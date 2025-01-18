import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:susma/database/firestore_refs.dart';
import 'package:susma/globals/globals.dart' as globals;
import 'package:susma/main/auth/models/account_metadata.dart';
import 'package:susma/main/error/screens/ErrorScreen.dart';
import 'package:susma/main/nav/components/floating_bottom_bar.dart';
import 'package:susma/main/nav/methods/string_methods.dart';
import 'package:susma/main/nav/pages/navigation_page.dart';
import 'package:susma/main/nav/components/custom_app_bar.dart';
import 'package:susma/main/nav/utils/nav_screens.dart';
import 'package:susma/main/loading/screens/loading_screen.dart';

@RoutePage()
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;
  bool isLoading = true;
  bool hasError = false;
  late AccountMetadata accountMetadata;

  @override
  void initState() {
    super.initState();
    _fetchAccountMetadata();
  }

  void _fetchAccountMetadata() {
    getAccountMetadataRefByUID(globals.accountUID).listen(
      (snapshot) {
        if (snapshot.docs.isNotEmpty) {
          setState(() {
            isLoading = false;
            hasError = false;
          });
          for (var document in snapshot.docs) {
            setState(() {
              accountMetadata = AccountMetadata.fromJson(
                document.data() as Map<String, Object?>,
              );
            });

            print('AccountMetadata: ${accountMetadata.toJson()}');
          }
        } else {
          setState(() {
            hasError = true;
          });
        }
      },
      onError: (_) {
        setState(() {
          isLoading = false;
          hasError = true;
        });
      },
    );
  }

  PreferredSizeWidget? _getAppBar(BuildContext context) {
    appBarData[0]["title"] = accountMetadata.name;
    appBarData[0]["subtitle"] = accountMetadata.username;
    appBarData[0]["leadingType"] = "avatar";
    appBarData[0]["avatarUrl"] = accountMetadata.avatarUrl;
    appBarData[0]["avatarPlaceholder"] = getInitials(accountMetadata.name);

    final data = appBarData[currentPageIndex];
    return CustomAppBar(
      title: data["title"],
      subtitle: data["subtitle"],
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
    if (isLoading) {
      return StartScreen();
    }
    if (hasError) {
      return ErrorScreen();
    }

    return Scaffold(
      appBar: _getAppBar(context),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingBottomBar(
        pageIndex: currentPageIndex,
        destinationSelected: _onPageChanged,
      ),
      body: NavigationPage(
        screens: screens,
        currentPageIndex: currentPageIndex,
      ),
    );
  }
}
