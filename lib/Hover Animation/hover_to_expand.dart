import 'package:flutter/material.dart';
import 'package:flutter_example/Hover%20Animation/model.dart';

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
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
            itemCount: dataInfo.length, // Number of items in the list
            itemBuilder: (context, index) {
              final data = dataInfo[index]; // Get data for the current index
              return HoverItem(
                  data: data); 
            },
          ),
        ),
      ),
    );
  }
}

// HoverItem widget which expands and shows text on hover
class HoverItem extends StatefulWidget {
  final ObjectToHover data;

  const HoverItem({required this.data, super.key});

  @override
  _HoverItemState createState() => _HoverItemState();
}

class _HoverItemState extends State<HoverItem> {
  bool animate = false; // State variable to control animation
  bool textAppear = false; // State variable to control text appearance

  // Function to update textAppear state
  void changer(bool a) {
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
    // Determine size, color, and border radius based on animation state
    double height = animate ? 320 : 275;
    double width = animate ? 520 : 280;
    Color color = animate ? widget.data.color2 : widget.data.color1;
    BorderRadius border =
        animate ? BorderRadius.circular(40.0) : BorderRadius.circular(300.0);

    return MouseRegion(
      // Handle mouse enter event
      onEnter: (_) {
        setState(() {
          animate = true;
          changer(animate);
        });
      },
      // Handle mouse exit event
      onExit: (_) {
        setState(() {
          animate = false;
          changer(animate);
        });
      },
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 0),
            child: Padding(
              padding: const EdgeInsets.all(
                  30.0), 
              child: AnimatedContainer(
                height: height, 
                width: width, 
                duration:
                    const Duration(milliseconds: 200), 
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: border, 
                  color: color, 
                ),
                child: AnimatedOpacity(
                  opacity: textAppear ? 1 : 0, 
                  duration: Duration(
                      milliseconds:
                          textAppear ? 300 : 100), 
                  curve: Curves.easeOut, 
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.title,
                          style: const TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10.0),
                          width: 270,
                          child: Text(
                            widget.data.description,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
              padding: EdgeInsets.only(
                  left: animate ? 250 : 0),
              duration: const Duration(milliseconds: 200),
              height: height + 40,
              child: Image(
                image: AssetImage(widget.data.image),
                fit: BoxFit.fitHeight, // Fit the image with height
              ),
            ),
          ),
        ],
      ),
    );
  }
}
