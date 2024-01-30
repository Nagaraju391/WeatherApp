import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Icon icon;
  final String weatherEM;
  final dynamic data;

  const CustomContainer({super.key, required this.icon, required this.weatherEM, this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(20)),
        child:  Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(

            children: [
              Row(
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(icon.icon,color: Colors.white,),
                const SizedBox(width: 10,),
                Text(weatherEM,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20 )),

                ]
                ,
              ),
              Expanded(child: Center(child: Text(data.toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25 )),))
            ],
          ),
        ),
      ),
    );
  }
}
