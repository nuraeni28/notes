import 'package:flutter/material.dart';
import 'package:notes/shared/theme.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: 36,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: kBorder),
          borderRadius: BorderRadius.circular(4.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  bottom: 0,
                  left: 16,
                ),
                labelText: 'Search',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                labelStyle: textSearch,
                isDense: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            )),
            Image.asset(
              'icon_search.png',
              height: 24,
              width: 24,
            )
          ],
        ),
      ),
    );
  }
}
