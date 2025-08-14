import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class NetworkImageCard extends StatelessWidget {
  final double width;
  final double height;
  final String? imageUrl;
  final BoxFit? fit;
  final double borderRadius;
  final VoidCallback? onTap;

  const NetworkImageCard({
    super.key,
    this.width = 150,
    this.height = 228,
    this.imageUrl,
    this.fit = BoxFit.cover,
    this.borderRadius = 8.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Stack(
          children: [
            if (imageUrl != null)
              const Center(child: CircularProgressIndicator()),
            if (imageUrl == null || imageUrl!.isEmpty) ...[
              Center(
                child: Text(
                  'No Image',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ] else ...[
              // The image will be displayed by the ClipRRect
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: FadeInImage.memoryNetwork(
                  fadeInDuration: Duration(milliseconds: 100),
                  fadeOutDuration: Duration(milliseconds: 100),
                  image: imageUrl ?? "",
                  placeholder: kTransparentImage,
                  fit: fit,
                  width: width,
                  height: height,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
