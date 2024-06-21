import 'package:flutter/material.dart';
import 'constants.dart';
import 'Model/universe_model.dart';

class DetailPage extends StatefulWidget {
  final PlanetInfo planetInfo;

  const DetailPage({super.key, required this.planetInfo});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isExpanded = false;
  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 280),
                        Text(
                          widget.planetInfo.name,
                          style: TextStyle(
                            fontSize: 60,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Solar System',
                          style: TextStyle(
                            fontSize: 35,
                            color: primaryTextColor,
                          ),
                        ),
                          const SizedBox(height: 5),
                        const Divider(color: Colors.black12),
                        const SizedBox(height: 20),
                        Text(
                          widget.planetInfo.description,
                          maxLines: _isExpanded ? null : 5,
                          overflow: _isExpanded
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: _toggleExpanded,
                          child: Text(
                            _isExpanded ? 'Read less' : 'Read more',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(color: Colors.black12),
                      
                        
                      ],
                      
                    ),
                  ),
                    Text(
                    '    Gallery',
                    style: TextStyle(
                      fontSize: 25,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: SizedBox(
                      height: 250,
                      child: ListView.builder(
                        itemCount: widget.planetInfo.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                widget.planetInfo.images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -45,
              child: Hero(
                tag: widget.planetInfo.id,
                child: Image.asset(widget.planetInfo.iconImage),
              ),
            ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                widget.planetInfo.id.toString(),
                style: TextStyle(
                  fontSize: 247,
                  color: primaryTextColor.withOpacity(0.1),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
