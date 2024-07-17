import 'package:flutter/material.dart';

class TipsTricks extends StatefulWidget {
  const TipsTricks({super.key});

  @override
  State<TipsTricks> createState() => _TipsTricksState();
}

class _TipsTricksState extends State<TipsTricks> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Container(
          //   height: 100,
          //   width: 100,
          //   color: Colors.green,
          // ),
          // const SizedBox(height: 30),
// FractionallySizedBox
          // Flexible(
          //   child: FractionallySizedBox(
          //     widthFactor: 0.6,
          //     heightFactor: 0.4,
          //     child: Container(color: Colors.green),
          //   ),
          // )

          //  spacer Widget
          // Text("Using Container Only"),
          //   Row(
          //     children: [
          //       SquareContainer(Colors.green),
          //       SquareContainer(Colors.green),
          //       SquareContainer(Colors.green),
          //       SquareContainer(Colors.green),
          //       SquareContainer(Colors.green),
          //       SquareContainer(Colors.green),
          //     ],
          //   ),
          //   SizedBox(
          //     height: 20,
          //   ),
          //   Text("Using Spacer"),
          //   Row(
          //     children: [
          //       Spacer(flex: 1),
          //       SquareContainer(Colors.green),
          //       Spacer(flex: 2),
          //       SquareContainer(Colors.green),
          //       Spacer(flex: 1),
          //       SquareContainer(Colors.green),
          //       Spacer(flex: 1),
          //       SquareContainer(Colors.green),
          //       Spacer(flex: 1),
          //       SquareContainer(Colors.green),
          //       Spacer(flex: 5),
          //       SquareContainer(Colors.green),
          //       Spacer(flex: 1),

          //     ],
          //   ),

          // Wrap Widget
          // Text("Horizontal Wrap"),
          // WrapWidget(Axis.horizontal),
          // SizedBox(height: 10),
          // Text("Vertical Wrap"),
          // Expanded(
          //   flex: 1,
          //   child: WrapWidget(Axis.vertical),
          // ),
        ],
      ),
    );
  }
}

class WrapWidget extends StatelessWidget {
  const WrapWidget(this.axis, {super.key});
  final Axis axis;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: axis,
      runAlignment: WrapAlignment.start,
      spacing: 20,
      runSpacing: 20,
      children: const [
        SquareContainer(Colors.green),
        SquareContainer(Colors.blue),
        SquareContainer(Colors.yellowAccent),
        SquareContainer(Colors.red),
        SquareContainer(Colors.blueGrey),
        SquareContainer(Colors.purpleAccent),
        SquareContainer(Colors.yellowAccent),
        SquareContainer(Colors.red),
        SquareContainer(Colors.blueGrey),
        SquareContainer(Colors.purpleAccent),
      ],
    );
  }
}

class SquareContainer extends StatelessWidget {
  const SquareContainer(this.color, {super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
