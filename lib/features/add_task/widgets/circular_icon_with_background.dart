import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CircularsColors extends StatefulWidget {
  final Function(Color) onChange;
  const CircularsColors({super.key, required this.onChange});

  @override
  State<CircularsColors> createState() => _CircularsColorsState();
}

class _CircularsColorsState extends State<CircularsColors> {
  int selectIndex=0;

  List<Color> colors=[Colors.blue,Colors.red,Colors.orange,Colors.green,Colors.pink];
  @override
  Widget build(BuildContext context) {
    return
        SizedBox(height: 50,
            child: ListView.separated(scrollDirection:Axis.horizontal,itemBuilder: (context,index)=>CircularIconWithBackground(isActive: selectIndex==index,onTap: (){
              setState(() {
                selectIndex=index;
                widget.onChange(colors[index]);
              });
            }, color: colors[index],), separatorBuilder: (context,index)=>SizedBox(width: 5.w,), itemCount: colors.length));

  }
}

class CircularIconWithBackground extends StatelessWidget {
 final bool isActive;
 final void Function()? onTap;
 final Color color;
  const CircularIconWithBackground({super.key,this.isActive=false, this.onTap, required this.color});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20.r,
        backgroundColor:color ,
        child: (isActive)?(Icon(Icons.check,size: 35.sp,color: Colors.white,)):null,
      ),
    );
  }
}
