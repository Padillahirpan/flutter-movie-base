import 'package:flutter/material.dart';

Widget searchBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Row(
      spacing: 16.0,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search movies...',
                hintStyle: TextStyle(color: Colors.grey[400]),
                icon: const Icon(Icons.search, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: const Center(
                child: Icon(Icons.search, color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
