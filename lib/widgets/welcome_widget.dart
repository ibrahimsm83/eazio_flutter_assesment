import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/assets_manager.dart';
import '../utils/export_utils.dart';

class WelcomeWidgets extends StatelessWidget {
  const WelcomeWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(ImageAssets.bgPatternIcon),
              fit: BoxFit.cover,
            ),
            color: ColorManager.kPrimary,
            borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text("Welcome Back, Jhon!",
                    style: getboldStyle(
                        color: ColorManager.kWhiteColor, fontSize: 18.sp)),
                subtitle: Text("Take a Look of your Weekly Reports.",
                    style: getRegularStyle(
                        color: ColorManager.kWhiteColor, fontSize: 11.sp)),
                trailing: Container(
                  decoration: BoxDecoration(
                      color: ColorManager.kWhiteColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  height: 30,
                  width: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SvgPicture.asset(
                      ImageAssets.shareIcon,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 0.3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Average Late & Overtime",
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor, fontSize: 18.sp)),
            ),
            const Divider(thickness: 0.3),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: twenty5min(true),
                  ),
                  twenty5min(false),
                  const SizedBox(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 10.0),
              child: Text("Payroll Finance",
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor, fontSize: 18.sp)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(thickness: 0.3),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AED 43.20K",
                          style: getboldStyle(
                              color: ColorManager.kWhiteColor, fontSize: 17.sp),
                        ),
                        avg("Total Processed", true),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "AED 105.40K",
                        style: getboldStyle(
                            color: ColorManager.kWhiteColor, fontSize: 17.sp),
                      ),
                      avg("Avg.Overtime", true),
                    ],
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  activity(),
                  headCount(),
                ],
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget twenty5min(bool isAvg) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isAvg
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "25",
                    style: getboldStyle(
                        color: ColorManager.kWhiteColor, fontSize: 24.sp),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0, left: 4),
                    child: Text(
                      "Min",
                      style: getRegularStyle(
                          color: ColorManager.kWhiteColor, fontSize: 14.sp),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "5",
                        style: getboldStyle(
                            color: ColorManager.kWhiteColor, fontSize: 24.sp),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0, left: 4),
                        child: Text(
                          "Hr",
                          style: getRegularStyle(
                              color: ColorManager.kWhiteColor, fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "15",
                        style: getboldStyle(
                            color: ColorManager.kWhiteColor, fontSize: 24.sp),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0, left: 4),
                        child: Text(
                          "Min",
                          style: getRegularStyle(
                              color: ColorManager.kWhiteColor, fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        isAvg ? avg("Avg. Lateness", false) : avg("Avg.Overtime", true),
      ],
    );
  }

  Widget avg(String text, bool isBullish) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              getRegularStyle(color: ColorManager.kWhiteColor, fontSize: 12.sp),
        ),
        percBox(isBullish),
      ],
    );
  }

  Widget percBox(
    bool isBullish,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color:
                isBullish ? ColorManager.kWhiteColor : ColorManager.kWhiteColor,
            border: Border.all(
                color: isBullish
                    ? ColorManager.kGreenColor
                    : ColorManager.kRedColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.9),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isBullish
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                size: 15,
                color: isBullish
                    ? ColorManager.kGreenColor
                    : ColorManager.kRedColor,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Text(
                  "15%",
                  style: getRegularStyle(
                      color: isBullish
                          ? ColorManager.kGreenColor
                          : ColorManager.kRedColor,
                      fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget activity(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text("Activity",
            style: getboldStyle(
                color: ColorManager.kWhiteColor, fontSize: 18.sp)),
      ),
      Divider(thickness: 0.7),
        Row(
          children: [
          activityHead("22","Avg.","Leaves"),
          SizedBox(width: 10.0),
          activityHead("70","Avg.","Attendance"),
        ],)
    ],
    );
  }
Widget activityHead(String title,String subTitle,String description){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getboldStyle(
              color: ColorManager.kWhiteColor, fontSize: 20.sp),
        ),
        Text(
          subTitle,
          style: getRegularStyle(
              color: ColorManager.kWhiteColor, fontSize: 11.sp),
        ),
        Text(
          description,
          style: getRegularStyle(
              color: ColorManager.kWhiteColor, fontSize: 11.sp),
        ),
      ],);
}
  Widget headCount(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text("Head Count",
            style: getboldStyle(
                color: ColorManager.kWhiteColor, fontSize: 18.sp)),
      ),
      Divider(
        thickness: 0.7,
      ),

        Row(
          children: [
            activityHead("1283","Total","Employees"),
            SizedBox(width: 10.0),
            activityHead("250","Total","Internship"),
          ],),
    ],
    );
  }
}
