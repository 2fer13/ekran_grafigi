import 'package:ekran_grafigi/model/chart_data.dart';
import 'package:ekran_grafigi/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ChartData> data;

  @override
  void initState() {
    super.initState();
    data = [
      ChartData(17, 21500),
      ChartData(18, 22684),
      ChartData(19, 21643),
      ChartData(20, 22997),
      ChartData(21, 22383),
      ChartData(22, 22635),
      ChartData(23, 21800),
      ChartData(24, 23500),
      ChartData(25, 21354),
      ChartData(26, 22354),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bg_color,
      appBar: AppBar(
        backgroundColor: AppStyle.bg_color,
        elevation: 0.0,
        title: const Text("bitcoin"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "BITCOİN",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const CircleAvatar(
            backgroundImage:
                NetworkImage("https://coinicons-api.vercel.app/api/icon/btc"),
            radius: 36.0,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "(BTC)",
            style: const TextStyle(color: Colors.white12, fontSize: 24),
          ),
          Center(
            child: SfCartesianChart(
              margin: const EdgeInsets.all(0),
              borderWidth: 0,
              borderColor: Colors.transparent,
              plotAreaBorderWidth: 0,
              primaryXAxis: NumericAxis(
                minimum: 17,
                maximum: 26,
                interval: 1,
                isVisible: false,
                borderWidth: 0.0,
                borderColor: Colors.transparent,
              ),
              primaryYAxis: NumericAxis(
                minimum: 19000,
                maximum: 24000,
                interval: 1000,
                isVisible: false,
                borderWidth: 0.0,
                borderColor: Colors.transparent,
              ),
              series: <ChartSeries<ChartData, int>>[
                SplineAreaSeries(
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.price,
                  splineType: SplineType.natural,
                  gradient: LinearGradient(
                    colors: [
                      AppStyle.spline_color,
                      AppStyle.bg_color.withAlpha(150)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                SplineSeries(
                  dataSource: data,
                  color: AppStyle.accent_color,
                  width: 4,
                  markerSettings: MarkerSettings(
                      color: AppStyle.spline_color,
                      borderWidth: 2,
                      shape: DataMarkerType.circle,
                      isVisible: true,
                      borderColor: AppStyle.accent_color),
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.price,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    side: BorderSide(
                      color: AppStyle.accent_color,
                    )),
                icon: const Icon(
                  Icons.upload,
                  color: Colors.white,
                ),
                label: const Text(
                  "Sell",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: AppStyle.accent_color,
                  ),
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Buy",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
