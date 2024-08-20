import 'dart:async';
import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatelessWidget {
  const MyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Container(
          color: Colors.blueGrey[900],
          height: 500,
          child: const MyAnimatedChart(),
        ),
      ),
    );
  }
}

class MyAnimatedChart extends StatefulWidget {
  const MyAnimatedChart({super.key});
  // Colors for the sine and cosine lines.
  final Color sinColor = Colors.green;
  final Color cosColor = Colors.red;

  @override
  State<MyAnimatedChart> createState() => _MyAnimatedChartState();
}

class _MyAnimatedChartState extends State<MyAnimatedChart> {
  // Limits the number of points show in the chart to avoid overflow.
  final limitCount = 100;
  // Lists to store  the points for the sine and cosine functions.
  final sinPoint = <FlSpot>[];
  final cosPoints = <FlSpot>[];

  double X = 0; // TO TRACKS THE CURRENT x value.
  double step = .05; // increment step for the X value.
  late Timer timer; // timer to peridically update the chart data.
  @override
  void initState() {
// timer updates the data every 50  milliseconds.
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      // if the number of point sxceeds the limit, remove the oldest points.
      while (sinPoint.length > limitCount) {
        sinPoint.removeAt(0);
        cosPoints.removeAt(0);
      }
      setState(() {
        // to calculate new Y values  based on the sine and cosine functions and add anw points.
        sinPoint.add(
          FlSpot(
            X, // current X value.
            .5 * math.sin(20 * X) +
                .5 * math.sin(5 * X), // Y value for sine function/
          ),
        );
        cosPoints.add(
          FlSpot(
            X,
            math.cos(X), // Y value fpr cosine function.
          ),
        );
        X += step; // increment X for the next cycle
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // only render the chart if there are cosine points available.
    return cosPoints.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              // display the current x value.
              Text(
                "X:${X.toStringAsFixed(1)}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // display the latest y value for the sine function
              Text(
                ".5sin(20x)+ .5sin5x:${sinPoint.last.y.toStringAsFixed(1)}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // display the latest y value for the cosine function
              Text(
                "cos(X)${cosPoints.last.y.toStringAsFixed(1)}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // aspectRatio widget to maintain the desired ratio for the chart.
              AspectRatio(
                aspectRatio: 1.5,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: LineChart(LineChartData(
                    minY: -1,
                    maxY: 1,
                    minX: sinPoint.first
                        .x, // X-axis range starts from the first point's X value.
                    maxX: sinPoint
                        .last.x, // X-axis range ends from last point's X value.
                    lineTouchData: const LineTouchData(enabled: false),
                    clipData: const FlClipData
                        .all(), // clips overflowing content on all sides.
                    gridData: const FlGridData(
                        show: true), // show grid lines on the chart.
                    borderData:
                        FlBorderData(show: false), // hides the chart border.
                    lineBarsData: [
                      sinLine(sinPoint), // configures the sine line appearance.
                      cosLine(
                          cosPoints) // configures the cosine line appearance.
                    ],
                    titlesData:
                        const FlTitlesData(show: false), // hides axis titles.
                  )),
                ),
              )
            ],
          )
        : Container(); // empty container if no points are available.
  }

  // method to configure the sine lines appearance.
  LineChartBarData sinLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points, // data points for the sine line.
      dotData: const FlDotData(show: false), // hides dots at data points.
      gradient: LinearGradient(colors: [
        widget.sinColor.withOpacity(0),
        widget.sinColor,
      ], stops: const [
        .1,
        1
      ] // gradient for the lines.
          ),
      barWidth: 3, // thikness of the line.
      isCurved: false, // straight line segments (not curved).
    );
  }

  // method to configure the cosine lines appearance.
  LineChartBarData cosLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points, // data points for the sine line.
      dotData: const FlDotData(show: false), // hides dots at data points.
      gradient: LinearGradient(
        colors: [
          widget.cosColor.withOpacity(0),
          widget.cosColor,
        ], // gradient for the lines.
        stops: const [.1, 1],
      ),
      barWidth: 3, // thikness of the line.
      isCurved: false, // straight line segments (not curved).
    );
  }
}
