import 'package:flutter/material.dart';

import '../../../widgets/network_image_card.dart';

List<Widget> promotionList({
  required String title,
  required Function(String promotion)? onTap,
  required List<String> promotions,
}) {
  return [
    Padding(
      padding: const EdgeInsets.only(left: 24.0, bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
    SizedBox(
      child: promotions.isEmpty
          ? const Center(child: Text('No promotions available'))
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: promotions.map((promotion) {
                  return GestureDetector(
                    onTap: () => onTap?.call(promotion),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: promotion == promotions.first ? 24.0 : 12.0,
                        top: 12.0,
                        bottom: 12.0,
                        right: promotion == promotions.last ? 24.0 : 12.0,
                      ),
                      child: Column(
                        children: [
                          NetworkImageCard(
                            imageUrl: 'https://picsum.photos/1920/1080?blur',
                            width: 250,
                            height: 100,
                            fit: BoxFit.cover,
                            onTap: () => onTap?.call(promotion),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
    ),
  ];
}
