import 'package:flutter/material.dart';
import 'package:assignment_recastdesigns/core/extension/media_query_extension.dart';
import '../../core/constants/app_assets.dart';

class InfiniteMovingImages extends StatefulWidget {
  const InfiniteMovingImages({super.key});

  @override
  State<InfiniteMovingImages> createState() => _InfiniteMovingImagesState();
}

class _InfiniteMovingImagesState extends State<InfiniteMovingImages>
    with SingleTickerProviderStateMixin {
  final List<String> topImages = ImageAsset.topImages;
  final List<String> bottomImages = ImageAsset.bottomImages;

  late AnimationController _controller;
  late Animation<double> _topAnimation;
  late Animation<double> _bottomAnimation;

  bool _isAnimationStarted = false;
  final double spacing = 12.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _startAnimation();
      }
    });

    _topAnimation = Tween<double>(begin: 0, end: -1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _bottomAnimation = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  void _startAnimation() {
    if (!_isAnimationStarted && mounted) {
      _controller.repeat();
      setState(() {
        _isAnimationStarted = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topHeight = context.hp(24);
    final bottomHeight = context.hp(24);
    final screenWidth = MediaQuery.of(context).size.width;

    final imageWidth = screenWidth * 0.32;
    final totalWidth = (imageWidth + spacing) * topImages.length - spacing;

    return Container(
      color: Colors.black,
      width: double.infinity,
      height: topHeight + bottomHeight + context.hp(3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: topHeight,
            width: double.infinity,
            child: ClipRect(
              child: AnimatedBuilder(
                animation: _topAnimation,
                builder: (context, child) {
                  return Stack(
                    children: [
                      Positioned(
                        left: _topAnimation.value * totalWidth,
                        child: _buildImageRow(
                          images: topImages,
                          imageWidth: imageWidth,
                          height: topHeight,
                          spacing: spacing,
                        ),
                      ),
                      Positioned(
                        left: _topAnimation.value * totalWidth + totalWidth + spacing,
                        child: _buildImageRow(
                          images: topImages,
                          imageWidth: imageWidth,
                          height: topHeight,
                          spacing: spacing,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          SizedBox(height: context.hp(1)),

          SizedBox(
            height: bottomHeight,
            width: double.infinity,
            child: ClipRect(
              child: AnimatedBuilder(
                animation: _bottomAnimation,
                builder: (context, child) {
                  return Stack(
                    children: [
                      Positioned(
                        left: _bottomAnimation.value * totalWidth,
                        child: _buildImageRow(
                          images: bottomImages,
                          imageWidth: imageWidth,
                          height: bottomHeight,
                          spacing: spacing,
                        ),
                      ),
                      Positioned(
                        left: _bottomAnimation.value * totalWidth + totalWidth + spacing,
                        child: _buildImageRow(
                          images: bottomImages,
                          imageWidth: imageWidth,
                          height: bottomHeight,
                          spacing: spacing,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildImageRow({
    required List<String> images,
    required double imageWidth,
    required double height,
    required double spacing,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(images.length, (index) {
        return Container(
          width: imageWidth,
          height: height,
          margin: EdgeInsets.only(
            left: index == 0 ? 0 : spacing,
          ),
          color: Colors.black,
          child: Image.asset(
            images[index],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[900],
                child: Center(
                  child: Icon(Icons.broken_image, color: Colors.grey[600]),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}