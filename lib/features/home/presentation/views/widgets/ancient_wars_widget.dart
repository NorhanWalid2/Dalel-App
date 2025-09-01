import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:dalel_app/core/utls/app_assets.dart';

class AncientWarsWidget extends StatefulWidget {
  const AncientWarsWidget({super.key});

  @override
  State<AncientWarsWidget> createState() => _AncientWarsWidgetState();
}

class _AncientWarsWidgetState extends State<AncientWarsWidget> {
  final PageController _controller = PageController();

  // Replace with your actual assets
  final List<String> warsImages = [
    Assets.assetsImagesAncientWarImage,
    Assets.assetsImagesAncientWarImage,
    Assets.assetsImagesAncientWarImage,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // height of the whole widget
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // PageView (images)
          PageView.builder(
            controller: _controller,
            itemCount: warsImages.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  warsImages[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
          ),

          // SmoothPageIndicator (overlayed inside image)
          Positioned(
            bottom: 10, // distance from bottom of image
            child: SmoothPageIndicator(
              controller: _controller,
              count: warsImages.length,
              effect: SlideEffect(
                activeDotColor: Colors.grey,
                dotColor: Colors.white,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
