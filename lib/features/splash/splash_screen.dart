import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/features/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds:5),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()),(r)=>false);

    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // double heightScreen=MediaQuery.of(context).size.height;
    // double widthScreen=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/To-Do-List.gif",),
            SizedBox(height: 40.h,),
            Text("Taskati",
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10.h,),
            Text("it's time to get organized",style: TextStyle(
              fontSize: 17.sp,

            ),)

          ],
        ),
      )
    );
  }
}
