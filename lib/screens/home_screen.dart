





import 'package:flutter/material.dart';
import 'package:untitled/screens/result_screen.dart';
import 'package:untitled/theme/app_colors.dart';
import 'package:untitled/widget/custom_app_bar.dart';
import 'package:untitled/widget/gender_contain.dart';
import 'package:untitled/widget/wight_age.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 bool isMale=true;
 int height=150;
 int weight=60;
 int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder:(context)=>ResultScreen(
         height:height,
            weight:weight,
            age: age,
            isMale:isMale??false,
          )));
        },
        child: Container(
          height: 100,
          alignment: Alignment.center,
          color: Color(0XFFE83D67),
          child: Text("Calculate",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,)
          ),
        ),
      ),
      appBar:CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 26),
        child: Column(
          children: [
            //select gander row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GenderContain(
                    isActive: isMale ,
                    onTap: (){
                      setState(() {
                        isMale=true;
                      });
                    },
                    title: "Male",
                    SvgIcon: "assets/Images/Vector.svg",
                  ),
                ),
                SizedBox(width: 9,),
                Expanded(
                  child: GenderContain(
                    isActive: !isMale,
                    onTap: (){
                      setState(() {
                        isMale=false;
                      });
                    },
                    title: "Female",
                    SvgIcon: "assets/Images/Vector (1).svg",
                  ),
                ),
              ],
            ),
            SizedBox(height: 25,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 27, horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0XFF333244),
              ),
              child: Column(
                children: [
                  Text("Height", style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: height.toString(),
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                        TextSpan(text: "cm,",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,),
                        )
                      ],
                    ),
                  ),
                  Slider(
                      min: 0,
                      max: 250,
                      activeColor: Color(0XFFE83D67),
                      thumbColor: Colors.white,
                      value: height.toDouble(), onChanged: (v) {
                    setState(() {
                      height=v.toInt();
                    });
                  }
                  ),


                ],
              ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: WightAge(
                    minusOnPressed: (){
                      if(weight>0){
                        setState(() {
                          weight--;
                        });
                      }
                    },
                    addOnPressed: (){
                      setState(() {
                        weight++;
                      });
                    },
                    titel: "Weight", value: weight.toString())),
                SizedBox(width: 9,),
                Expanded(child: WightAge(
                    addOnPressed: (){
                      setState(() {
                        age++;
                      });
                    },
                    minusOnPressed: (){
                      if(age>0){
                        setState(() {
                          age--;
                        });
                      }
                    },
                    titel: "age", value: age.toString())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}