import 'package:flutter/material.dart';
import 'package:notes/app/ui/widgets/appbar_action_item.dart';
import 'package:notes/app/ui/widgets/custom_drawer.dart';
import 'package:notes/app/ui/widgets/custom_tab_bar.dart';
import 'package:notes/app/ui/widgets/table_patient.dart';
import 'package:notes/shared/theme.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0),
        child: AppBar(
          primary: false,
          backgroundColor: kWhiteColor,
          leading: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
          actions: [AppBarActionItem()],
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: CustomTabBar(),
          ),
        ),
      ),
      body: TablePatient(),
    );
  }
}
