import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0a000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            height: 20,
            width: 20,
            child: Center(
              child: SvgPicture.asset('assets/images/search_icon.svg'),
            ),
          ),
          hint: Text(
            'ابحث عن.......',
            style: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
          ),
          suffixIcon: SizedBox(
            height: 20,
            width: 20,
            child: Center(child: SvgPicture.asset('assets/images/filters.svg')),
          ),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
