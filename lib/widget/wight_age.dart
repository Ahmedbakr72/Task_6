


import 'package:flutter/material.dart';

class WightAge extends StatelessWidget {
  final String titel;
  final String value;
  final void Function()? addOnPressed;
  final void Function()? minusOnPressed;
  const WightAge({super.key, required this.titel, required this.value, this.addOnPressed, this.minusOnPressed,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      padding:EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0XFF24263B),
      ),
      child: Column(
        children: [
          Text(titel,style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),),
          Text(value,style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 26,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton.small(
                heroTag: "btn1$titel",
                backgroundColor: Color(0XFF888c9E),
                shape: CircleBorder(),
                onPressed:addOnPressed ,
                child: Icon(Icons.add,
                  color: Colors.white,
                ),

              ),
              FloatingActionButton.small(
                heroTag: "btn2$titel",
                backgroundColor: Color(0XFF888c9E),
                shape: CircleBorder(),
                onPressed:minusOnPressed ,
                child: Icon(Icons.remove,
                  color: Colors.white,
                ),

              ),
            ],
          ),
        ],
      ),
    );
  }
}
