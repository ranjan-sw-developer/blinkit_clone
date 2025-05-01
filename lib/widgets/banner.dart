import 'package:blink_it_app/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          color: ColorConstants.primaryColor,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Banner Title",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "Banner Sub Text",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 150, // Set height to 100 pixels
                child: PageView.builder(
                  itemCount: 4,
                  controller: PageController(viewportFraction: 0.5),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color:
                            Colors
                                .primaries[index % Colors.primaries.length]
                                .shade200,
                        child: Center(
                          child: Text(
                            'Card ${index + 1}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
