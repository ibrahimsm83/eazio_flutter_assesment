import 'package:eazio/model/sample_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        //  thirdSeriesYValue: 720
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
        backgroundColor: Colors.blue,
        title: const Text("EiZo"),
      ),
      body: Column(
        children: [
     welcomeWidget(),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(10.0),
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
        ],
      ),
    );
  }

Widget welcomeWidget(){
  return Container(
    // color: Colors.lightBlue,
    decoration: BoxDecoration(
      color: Colors.lightBlue,
    borderRadius: BorderRadius.circular(10.0)
    ),
    child: Column(children: [
      ListTile(
        title: Text("Welcome Back, Jhon!",style: TextStyle(color:Colors.white,),),
        subtitle: Text("Take a look of your Weekely propesal",style: TextStyle(color:Colors.white,),),
        trailing: Container(
          height: 30,
          width: 30,
          child: Icon(Icons.share),
        ),
        
      ),
       const Divider(
                    thickness: 0.3,
                  ),
                  Text(
            "Average Late & Overtime",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14.sp),
          ),
    ]),
  ); 
}

  Widget titleButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Attendence Summary",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 17.sp),
          ),
          const Icon(
            Icons.more_vert,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

//
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
    return  ToggleSwitch(
        initialLabelIndex: 0,
        activeBgColor: [Colors.orange.withOpacity(0.3)],
        activeFgColor: Colors.orange,
        inactiveBgColor: Colors.white,
        inactiveFgColor: Colors.black,
        borderColor: [Colors.grey],
        borderWidth: 0.4,
        minWidth: MediaQuery.of(context).size.width,
        totalSwitches: 3,
        fontSize: 15.sp,
        customTextStyles: const [TextStyle(fontWeight: FontWeight.bold)],
        labels: const ['Today', 'This Week', 'This Month'],
        onToggle: (index) {
          print('switched to: $index');
        },
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
            title: AxisTitle(text: "Attendence"),
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
          color: Colors.green,
          legendIconType: LegendIconType.circle,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Absents'),
      StackedColumnSeries<ChartSampleData, String>(
          width: 0.3,
          legendIconType: LegendIconType.circle,
          color: Colors.orange,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          name: 'Late'),
      StackedColumnSeries<ChartSampleData, String>(
          width: 0.3,
          legendIconType: LegendIconType.circle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
          color: Colors.red[400],
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'On Time'),
    ];
  }
}
