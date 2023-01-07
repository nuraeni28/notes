import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes/app/ui/widgets/custom_search_bar.dart';
import 'package:notes/shared/theme.dart';

class AppBarActionItem extends StatelessWidget {
  const AppBarActionItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Image.asset('logo_app.png')),
        Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Text(
              'App name',
              style: textAppName,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20),
          child: CustomSearchBar(),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Container(
                width: 125.0,
                height: 30.0,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kBorder),
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Image.asset(
                        'icon_grid.png',
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Module',
                        style: greyTextStyle,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Image.asset(
                        'icon_drop_down.png',
                        height: 18,
                        width: 18,
                      ),
                    ],
                  ),
                ))),
        Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset('icon_notification.png'),
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset('icon_message_question.png'),
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset('icon_setting.png'),
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset('icon_more.png'),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 20),
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new AssetImage('profile.png'),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Center(
                  child: Text(
                'Sign Out',
                style: textSubtitle2.copyWith(fontSize: 14),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
