

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class GenderContain extends StatelessWidget {
  final String SvgIcon;
  final String title;
  final bool isActive;
  final void Function()? onTap;
  const GenderContain({super.key,required this.title, required this.SvgIcon, this.onTap, this.isActive=false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 17,
        ),
        decoration: BoxDecoration(
          color: isActive? Color(0XFFE83D67):Color(0XFF24263B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SvgPicture.asset(SvgIcon),
            Text(title, style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),)
          ],
        ),
      ),
    );();
  }
}
