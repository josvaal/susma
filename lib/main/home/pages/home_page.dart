import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/database/firestore_refs.dart';
import 'package:susma/globals/globals.dart' as globals;
import 'package:susma/main/auth/methods/auth_methods.dart';
import 'package:susma/main/home/components/column_p_subscriptions.dart';
import 'package:susma/main/home/components/row_p_subscriptions.dart';
import 'package:susma/main/home/components/layout_between.dart';
import 'package:susma/main/home/components/rounded_button.dart';
import 'package:susma/main/home/models/model_subscription.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription? _subscription;
  List<ModelSubscription> items = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchPreviewSubscriptions();
  }

  void _fetchPreviewSubscriptions() {
    _subscription =
        getSubscriptionRefByUID(globals.accountUID).listen((snapshot) {
      if (!mounted) return;
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          isLoading = false;
          hasError = false;
          items = snapshot.docs.map((document) {
            return ModelSubscription.fromJson(
              document.data() as Map<String, Object?>,
            );
          }).toList();
        });
      } else {
        setState(() {
          hasError = true;
        });
      }
    }, onError: (_) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        hasError = true;
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          SvgPicture.asset(
            width: 80,
            height: 80,
            "assets/dev/face_sad.svg",
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          Text(
            "Aún no añadiste ninguna subscripción",
            style: ShadTheme.of(context).textTheme.large,
            textAlign: TextAlign.center,
          )
        ],
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBetween(
            left: Text(
              'Siguientes',
              style: ShadTheme.of(context).textTheme.large,
            ),
            right: RoundedButton(
              text: "Ver Todo",
              onPressed: () async {
                await accountSignOut();
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 94.0,
            child: RowPSubscriptions(items: items),
          ),
          SizedBox(
            height: 10.0,
          ),
          LayoutBetween(
            left: Text(
              'Todos',
              style: ShadTheme.of(context).textTheme.large,
            ),
            right: RoundedButton(
              text: "Ver Todo",
              onPressed: () async {
                await accountSignOut();
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ColumnPSubscriptions(items: items),
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
