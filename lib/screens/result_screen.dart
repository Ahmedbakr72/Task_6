


import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled/theme/app_colors.dart';
import 'package:untitled/widget/custom_app_bar.dart';
class ResultScreen extends StatelessWidget {
  final int weight;
  final int height;
  final bool isMale;
  final int age;

  const ResultScreen(
      {super.key, required this.weight, required this.height, required this.isMale, required this.age});

  double covertHeightToMeter() {
    return height / 100;
  }

  double clcBMI() {
    return weight / (pow(covertHeightToMeter(), 2));
  }

  String range() {
    if (clcBMI() <= 18.4) {
      return "UnderWeight";
    }
    else if (clcBMI() > 18.4 && clcBMI() <= 24.9) {
      return "Normal";
    } else if (clcBMI() >= 25 && clcBMI() <= 39.9) {
      return "OverWeight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        alignment: Alignment.center,
        color: Color(0XFFEB3D67),
        child: Text('Re - Calculate', style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),),
      ),
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Result", style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),),
            SizedBox(height: 25,),
            Text("${clcBMI().toStringAsFixed(2)})", style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),),
            SizedBox(height: 25,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: 38, left: 33, right: 33, bottom: 150),
              decoration: BoxDecoration(
                color: Color(0XFF333244),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(range(), style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0XFF21BF73),
                  ),),
                  SizedBox(height: 25,),
                  Text('${clcBMI().toStringAsFixed(2)}', style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),),
                  SizedBox(height: 60,),
                  Text("You Have a Normal Body Weight,\nGood Job.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF888C9E),
                    ),),
                  SizedBox(height: 25,),
                  Text("gender:${isMale ? "male" : "female"}", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),),
                  SizedBox(height: 33,),
                  Text("age:$age", style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}