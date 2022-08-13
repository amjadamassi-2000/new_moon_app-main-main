import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/const.dart';

class FasoulImageScreen extends StatefulWidget {
  @override
  _FasoulImageScreenState createState() => _FasoulImageScreenState();
}

class _FasoulImageScreenState extends State<FasoulImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: test2,
      appBar: AppBar(
        backgroundColor: test2,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "جدول فصول السنة",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "almarai",
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        child: Image.asset("assets/images/fasoulb.jpg", fit: BoxFit.fitWidth),
      ),
    );
  }
}
