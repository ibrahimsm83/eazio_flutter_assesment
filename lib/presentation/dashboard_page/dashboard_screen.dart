import 'package:eazio/model/sample_data_model.dart';
import 'package:eazio/utils/assets_manager.dart';
import 'package:eazio/utils/export_utils.dart';
import 'package:eazio/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TooltipBehavior? _tooltipBehavior;
  List<ChartSampleData>? chartData;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    chartData = <ChartSampleData>[
      ChartSampleData(
        x: 'Mon',
        y: 220,
        yValue: 320,
        secondSeriesYValue: 200,
      ),
      ChartSampleData(
        x: 'Tue',
        y: 250,
        yValue: 400,
        secondSeriesYValue: 350,
        // thirdSeriesYValue: 450
      ),
      ChartSampleData(
          x: 'Wed',
          y: 180,
          yValue: 250,
          secondSeriesYValue: 120,
          thirdSeriesYValue: 52),
      ChartSampleData(
          x: 'Thu',
          y: 220,
          yValue: 320,
          secondSeriesYValue: 200,
          thirdSeriesYValue: 65),
      ChartSampleData(
          x: 'Fri',
          y: 180,
          yValue: 250,
          secondSeriesYValue: 120,
          thirdSeriesYValue: 60),
      ChartSampleData(
          x: 'Sat',
          y: 250,
          yValue: 400,
          secondSeriesYValue: 300,
          thirdSeriesYValue: 65),
      ChartSampleData(
          x: 'Sun',
          y: 220,
          yValue: 320,
          secondSeriesYValue: 200,
          thirdSeriesYValue: 65),
    ];
    super.initState();
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        leadingWidth: 140,
        elevation: 0.3,
        leading: Image.asset(ImageAssets.appLogoImage),
        actions: [
          SvgPicture.asset(ImageAssets.commentsIcon),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SvgPicture.asset(ImageAssets.bellIcon),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SvgPicture.asset(ImageAssets.menuIcon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            const Divider(
              thickness: 0.3,
            ),
            const WelcomeWidgets(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: const Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    titleButtons(),
                    toggleButtons(),
                    const Divider(
                      thickness: 0.3,
                    ),
                    stackedColumnSeriesChart(),
                    const Divider(
                      thickness: 0.3,
                    ),
                    learnMoreButtons(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget header(){
    return  Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("Organization Insights.",
            style: getsemiboldStyle(
                color: ColorManager.kBlackColor, fontSize: 18.sp)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text("Track Your Organization Stats Insights",
              style: getRegularStyle(
                  color: ColorManager.kBlackColor, fontSize: 12.sp)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: ColorManager.kGreyColor),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    size: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("manage Widgets"),
                  )
                ],
              ),
            ),
          ),
        ),
          // SizedBox(height: 10.0),
      ],),
    );
  }

  Widget titleButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Attendance Summary",
              style: getsemiboldStyle(
                  color: ColorManager.kBlackColor, fontSize: 15.sp)),
          const Icon(
            Icons.more_vert,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget learnMoreButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Learn more",
            style: TextStyle(color: Colors.black, fontSize: 15.sp),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7.0),
              child: Text(
                "View Full Report",
                style: TextStyle(fontSize: 11.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///Toggle Buttons
  Widget toggleButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: ToggleSwitch(
        initialLabelIndex: 0,
        activeBgColor: [Colors.orange.withOpacity(0.3)],
        activeFgColor: ColorManager.kOrangeColor,
        inactiveBgColor: Colors.white,
        inactiveFgColor: Colors.black,
        borderColor: [Colors.grey],
        borderWidth: 0.4,
        minWidth: MediaQuery.of(context).size.width * 0.9,
        totalSwitches: 3,
        fontSize: 15.sp,
        customTextStyles: const [TextStyle(fontWeight: FontWeight.bold)],
        labels: const ['Today', 'This Week', 'This Month'],
        onToggle: (index) {
          print('switched to: $index');
        },
      ),
    );
  }

  ///Chart
  Widget stackedColumnSeriesChart() {
    return SizedBox(
      height: 300,
      child: SfCartesianChart(
        backgroundColor: Colors.white,
        plotAreaBorderWidth: 0,
        legend: const Legend(isVisible: true),
        primaryXAxis: const CategoryAxis(
          title: AxisTitle(text: "This Week"),
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: const NumericAxis(
            axisLine: AxisLine(width: 0),
            title: AxisTitle(text: "Attendance"),
            labelFormat: '{value}',
            maximum: 1000,
            interval: 200,
            majorTickLines: MajorTickLines(size: 0)),
        series: _getStackedColumnSeries(),
        tooltipBehavior: _tooltipBehavior,
      ),
    );
  }

  /// Returns the list of chart serie which need to render
  /// on the stacked column chart.
  List<StackedColumnSeries<ChartSampleData, String>> _getStackedColumnSeries() {
    return <StackedColumnSeries<ChartSampleData, String>>[
      StackedColumnSeries<ChartSampleData, String>(
          width: 0.3,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
          color: ColorManager.kgreenColor,
          legendIconType: LegendIconType.circle,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Absents'),
      StackedColumnSeries<ChartSampleData, String>(
          width: 0.3,
          legendIconType: LegendIconType.circle,
          color: ColorManager.kYellowColor,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          name: 'Late'),
      StackedColumnSeries<ChartSampleData, String>(
          width: 0.3,
          legendIconType: LegendIconType.circle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
          color: ColorManager.kOrangeColor,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'On Time'),
    ];
  }
}
