import 'package:flutter/material.dart';

class ShortsTile extends StatelessWidget {
  const ShortsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 280,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Apply border radius
              child: Image.asset(
                'assets/images/shorts_thumbnail.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              top: 1,
              right: 1,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_rounded),
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 1,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                child: Text(
                  'Youtube Shorts Thumbnail | Tutorial | Channel Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}