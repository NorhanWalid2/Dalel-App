import 'dart:async';
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
  Timer? _timer;
  int _currentPage = 0;

  // Replace with your actual assets
  final List<String> warsImages = [
    Assets.assetsImagesAncientWarImage,
    Assets.assetsImagesF,
    Assets.assetsImagesI,
    Assets.assetsImagesR,
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < warsImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
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
            bottom: 10,
            child: SmoothPageIndicator(
              controller: _controller,
              count: warsImages.length,
              effect: const SlideEffect(
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
