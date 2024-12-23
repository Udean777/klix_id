import 'package:flutter/material.dart';
import 'package:klix_id/core/configs/theme/app_colors.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final Duration autoPlayInterval;

  const ImageCarousel({
    super.key,
    required this.imageUrls,
    this.height = 400,
    this.autoPlayInterval = const Duration(seconds: 3),
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1000);
    _currentPage = 1000 % widget.imageUrls.length;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(widget.autoPlayInterval, _autoPlay);
    });
  }

  void _autoPlay() {
    if (!mounted) return;
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    Future.delayed(widget.autoPlayInterval, _autoPlay);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          width: widget.height * 0.75,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index % widget.imageUrls.length;
              });
            },
            itemBuilder: (context, index) {
              final actualIndex = index % widget.imageUrls.length;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.imageUrls[actualIndex],
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imageUrls.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? AppColors.primary
                    // ignore: deprecated_member_use
                    : AppColors.primary.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
