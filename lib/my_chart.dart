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
          child: const MyLineChart(),
        ),
      ),
    );
  }
}

class MyLineChart extends StatefulWidget {
  const MyLineChart({super.key});

  // Colors for the sine and cosine lines.
  final Color sinColor = Colors.green;
  final Color cosColor = Colors.red;

  @override
  State<MyLineChart> createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  // Limits the number of points shown in the chart to avoid overflow.
  final limitCount = 100;

  // Lists to store the points for the sine and cosine functions.
  final sinPoints = <FlSpot>[];
  final cosPoints = <FlSpot>[];

  double X = 0; // Tracks the current X value.
  double step = .05; // Increment step for the X value.

  late Timer timer; // Timer to periodically update the chart data.

  @override
  void initState() {
    super.initState();
    // Timer updates the data every 50 milliseconds.
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      // If the number of points exceeds the limit, remove the oldest points.
      while (sinPoints.length > limitCount) {
        sinPoints.removeAt(0);
        cosPoints.removeAt(0);
      }

      setState(() {
        // Calculate new Y values based on the sine and cosine functions and add new points.
        sinPoints.add(
          FlSpot(
            X, // Current X value.
            .5 * math.sin(20 * X) +
                .5 * math.sin(5 * X), // Y value for sine function.
          ),
        );
        cosPoints.add(
          FlSpot(X, math.cos(X)),
        ); // Y value for cosine function.
      });
      X += step; // Increment X for the next cycle.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Only render the chart if there are cosine points available.
    return cosPoints.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              // Display the current X value.
              Text(
                'X:${X.toStringAsFixed(1)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Display the latest Y value for the sine function.
              Text(
                '.5Sin(20X) + .5sin(5*x):${sinPoints.last.y.toStringAsFixed(1)}',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Display the latest Y value for the cosine function.
              Text(
                'cos(X):${cosPoints.last.y.toStringAsFixed(1)}',
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // AspectRatio widget to maintain the desired ratio for the chart.
              AspectRatio(
                aspectRatio: 1.5,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  // LineChart widget to plot the data points.
                  child: LineChart(
                    LineChartData(
                      minY: -1,
                      maxY: 1,
                      minX: sinPoints.first
                          .x, // X-axis range starts from the first point's X value.
                      maxX: sinPoints.last
                          .x, // X-axis range ends at the last point's X value.
                      lineTouchData: const LineTouchData(enabled: false),
                      clipData: const FlClipData
                          .all(), // Clips overflowing content on all sides.
                      gridData: const FlGridData(
                          show: true), // Shows grid lines on the chart.
                      borderData:
                          FlBorderData(show: false), // Hides the chart border.
                      lineBarsData: [
                        sinLine(
                            sinPoints), // Configures the sine line appearance.
                        cosLine(
                            cosPoints), // Configures the cosine line appearance.
                      ],
                      titlesData:
                          const FlTitlesData(show: false), // Hides axis titles.
                    ),
                  ),
                ),
              )
            ],
          )
        : Container(); // Empty container if no points are available.
  }

  // Method to configure the sine line's appearance.
  LineChartBarData sinLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points, // Data points for the sine line.
      dotData: const FlDotData(show: false), // Hides dots at data points.
      gradient: LinearGradient(
        colors: [
          widget.sinColor.withOpacity(0),
          widget.sinColor
        ], // Gradient for the line.
        stops: const [.1, 1], // Controls where the gradient starts and ends.
      ),
      barWidth: 3, // Thickness of the line.
      isCurved: false, // Straight line segments (not curved).
    );
  }

  // Method to configure the cosine line's appearance.
  LineChartBarData cosLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points, // Data points for the cosine line.
      dotData: const FlDotData(show: false), // Hides dots at data points.
      gradient: LinearGradient(
        colors: [
          widget.cosColor.withOpacity(0),
          widget.cosColor
        ], // Gradient for the line.
        stops: const [.1, 1], // Controls where the gradient starts and ends.
      ),
      barWidth: 5, // Thickness of the line.
      isCurved: false, // Straight line segments (not curved).
    );
  }

  @override
  void dispose() {
    timer
        .cancel(); // Cancel the timer to stop updating the chart when the widget is disposed.
    super.dispose();
  }
}
