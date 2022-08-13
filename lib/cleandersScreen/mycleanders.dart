import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:new_moon_app/cleandersScreen/hijri.dart';
import 'package:new_moon_app/items/calenderidtem.dart';
import 'package:new_moon_app/items/clock/views/home_view.dart';
import 'package:new_moon_app/items/current_ecteran.dart';
import 'package:new_moon_app/items/current_najm.dart';
import 'package:new_moon_app/items/currentecterantext.dart';
import 'package:new_moon_app/items/ekteran_item.dart';
import 'package:new_moon_app/items/hijri.dart';
import 'package:new_moon_app/screens/bnb_screens/all_najom.dart';
import 'package:new_moon_app/screens/stars_image_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../components/const.dart';
import '../components/global_componnets.dart';
import '../screens/ekteran_screen.dart';
import '../screens/fasoul_image_screen.dart';

class Cleanders extends StatefulWidget {
  @override
  State<Cleanders> createState() => _CleandersState();
}

class _CleandersState extends State<Cleanders> {
  //var toDay = DateFormat('EEEE').format(DateTime.now());

  var now = DateTime.now();
  var todayFormatter = DateFormat.EEEE("ar");

  var date = DateFormat.yMMMd("ar");
  Future<String> getText() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get('ecteran');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getText();
  }

  @override
  Widget build(BuildContext context) {
    HijriCalendar _today = HijriCalendar.now();
    HijriCalendar.setLocal('ar');

    String today = todayFormatter.format(now);
    String todayDate = date.format(now);

    return Scaffold(
      backgroundColor: test2,
      appBar: AppBar(
        backgroundColor: test2,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "التقويم وتفاصيل أُخرى ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "almarai",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(width: 1, color: Colors.grey),
                    // color: item,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: FutureBuilder<String>(
                        future: getText(), // async work
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Text('Loading....');
                            default:
                              if (snapshot.hasError)
                                return Text('Error: ${snapshot.error}');
                              else
                                return Text(
                                  ' ${snapshot.data}',
                                  style: TextStyle(
                                    height: 1.5,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    wordSpacing: 2,
                                    fontFamily: "almarai",
                                  ),
                                );
                          }
                        },
                      )),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  width: 200.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  height: 270.h,
                  child: HomeView()),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 300.w,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "  اليوم   |    ${today} ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "almarai",
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                      thickness: 1,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    rowItem("assets/icons/calendar.png", todayDate, 28),
                    rowItem("assets/icons/hijri_calender.png",
                        '${_today.toFormat("dd MMMM yyyy")}', 35),
                    current_najm(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: InkWell(
                        onTap: () {
                          To(context, StarsImageScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                              color: item,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "مشاهدة صور النجوم",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "almarai",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: InkWell(
                        onTap: () {
                          To(context, FasoulImageScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                              color: item,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "جدول فصول السنة",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "almarai",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ecteranText(),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  To(context, EcteranScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 1.0,
                          spreadRadius: 3.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Text(
                      "لمعرفة أكثر حول الاقترانات",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "almarai",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  To(context, all_najom());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 1.0,
                          spreadRadius: 3.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Text(
                      "لمعرفة أكثر حول النجوم",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "almarai",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
Padding(
              padding: EdgeInsets.symmetric(horizontal: 15)
                  .add(EdgeInsets.only(bottom: 10)),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        " الإقتران الحالي",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "almarai",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Current_ecteran(),
 */

/*
              // SizedBox(
              //   height: 20.h,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15)
              //       .add(EdgeInsets.only(bottom: 10)),
              //   child: Container(
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: Divider(
              //             color: Colors.grey,
              //             thickness: 1,
              //             indent: 20,
              //           ),
              //         ),
              //
              //         Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 10),
              //           child: Text(
              //             " التقويم الميلادي ",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 16.sp,
              //               fontWeight: FontWeight.w500,
              //               fontFamily: "almarai",
              //             ),
              //           ),
              //         ),
              //         Expanded(
              //           child: Divider(
              //             color: Colors.grey,
              //             thickness: 1,
              //             endIndent: 20,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //     margin:
              //         EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(20.r)),
              //     child: SfDateRangePicker()),
              // SizedBox(
              //   height: 20.h,
              // ),
              // SizedBox(
              //   height: 20.h,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15)
              //       .add(EdgeInsets.only(bottom: 10)),
              //   child: Container(
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: Divider(
              //             color: Colors.grey,
              //             thickness: 1,
              //             indent: 20,
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 10),
              //           child: Text(
              //             " التقويم الهجري ",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 16.sp,
              //               fontWeight: FontWeight.w500,
              //               fontFamily: "almarai",
              //             ),
              //           ),
              //         ),
              //         Expanded(
              //           child: Divider(
              //             color: Colors.grey,
              //             thickness: 1,
              //             endIndent: 20,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //     margin: EdgeInsets.symmetric(horizontal: 20.w),
              //     height: 250.h,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(20.r)),
              //     child: hijri()),
              // SizedBox(
              //   height: 20.h,
              // ),

 */
