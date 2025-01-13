import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:susma/database/firestore_refs.dart';
import 'package:susma/globals/globals.dart' as globals;
import 'package:susma/main/error/screens/ErrorScreen.dart';
import 'package:susma/main/nav/components/FloatingBottomBar.dart';
import 'package:susma/main/nav/pages/NavigationPage.dart';
import 'package:susma/main/nav/components/CustomAppBar.dart';
import 'package:susma/main/nav/utils/NavScreens.dart';
import 'package:susma/main/start/screens/start_screen.dart';

@RoutePage()
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;

  PreferredSizeWidget? _getAppBar(BuildContext context) {
    final data = appBarData[currentPageIndex];
    return CustomAppBar(
      title: data["title"],
      avatarUrl: data["avatarUrl"],
      avatarPlaceholder: data["avatarPlaceholder"],
      actionIcon: data["actionIcon"],
      onPressed: data["onPressed"],
      leadingType: data["leadingType"],
      icon: data["icon"],
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingBottomBar(
        pageIndex: currentPageIndex,
        destinationSelected: _onPageChanged,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getAccountMetadataRefByUID(globals.accountUID),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return ErrorScreen();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return StartScreen();
          }
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.hasData &&
              snapshot.data != null) {
            // Itera sobre los documentos y procesa los datos
            final docs = snapshot.data!.docs;
            for (var document in docs) {
              print('Document ID: ${document.id}');
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              print('Data: $data');
            }
          } else {
            print('Snapshot has no data.');
          }
          // acá quisiera que se pueda cambiar los datos del topbar
          return NavigationPage(
            screens: screens,
            currentPageIndex: currentPageIndex,
          );
        },
      ),
    );
  }
}
