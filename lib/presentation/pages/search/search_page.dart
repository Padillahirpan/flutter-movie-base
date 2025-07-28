import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SearchPageContent(),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            title: const Text('Search'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ],
    );
  }
}

class SearchPageContent extends StatelessWidget {
  const SearchPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: Center(
        child: Text(
          'This is the Search Page',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
