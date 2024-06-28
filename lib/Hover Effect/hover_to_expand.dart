import 'package:flutter/material.dart';
import 'package:flutter_example/Hover%20Effect/model.dart';

// Main HoverToExpand widget which holds a list of HoverItem widgets
class HoverToExpand extends StatefulWidget {
  const HoverToExpand({super.key});

  @override
  _HoverToExpandState createState() => _HoverToExpandState();
}

class _HoverToExpandState extends State<HoverToExpand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
              itemCount: dataInfo.length,
              itemBuilder: (context, index) {
                final data = dataInfo[index];
                return HoverItems(data: data);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HoverItems extends StatefulWidget {
  final ObjectToHover data;
  const HoverItems({super.key, required this.data});

  @override
  State<HoverItems> createState() => _HoverItemsState();
}

class _HoverItemsState extends State<HoverItems> {
  bool isAnimate = false; // state variable to control animation
  bool textAppear = false; // state variable to control text appearance

  // Function to update textAppera state
  void change(bool a) {
    setState(() {
      if (a) {
        textAppear = true;
      } else {
        textAppear = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // determine size, color, abd border radius based on animation state
    // first items is for after animation valuse and second value is for before animation
    double height = isAnimate ? 320 : 275;
    double width = isAnimate ? 530 : 280;
    Color color = isAnimate ? widget.data.color2 : widget.data.color1;
    BorderRadius borderRadius =
        isAnimate ? BorderRadius.circular(40) : BorderRadius.circular(300);
    return MouseRegion(
      // Handle mouse eneter event
      onEnter: (event) {
        isAnimate = true;
        change(isAnimate);
      },
      // Handle mouse exit event
      onExit: (event) {
        setState(() {
          isAnimate = false;
          change(isAnimate);
        });
      },
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 0),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: AnimatedContainer(
                height: height,
                width: width,
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: color,
                ),
                child: AnimatedOpacity(
                  opacity: textAppear ? 1 : 0,
                  duration: Duration(
                    milliseconds: textAppear ? 300 : 100,
                  ),
                  curve: Curves.easeIn,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: 270,
                          child: Text(
                            widget.data.description,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0),
            child: AnimatedContainer(
              padding: EdgeInsets.only(left: isAnimate ? 250 : 0),
              duration: const Duration(milliseconds: 200),
              height: height,
              child: Image(
                image: AssetImage(widget.data.image),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
