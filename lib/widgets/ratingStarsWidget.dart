import 'package:flutter/material.dart';

class RatingStarsWidget extends StatelessWidget {
  final double rating; // e.g. 4.5
  final double size;
  final Color filledColor;
  final Color emptyColor;

  const RatingStarsWidget({
    Key? key,
    required this.rating,
    this.size = 20.0,
    this.filledColor = Colors.amber,
    this.emptyColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 1; i <= 5; i++) {
      if (rating >= i) {
        // Full star
        stars.add(Icon(Icons.star, color: filledColor, size: size));
      } else if (rating >= i - 0.5) {
        // Half star
        stars.add(Icon(Icons.star_half, color: filledColor, size: size));
      } else {
        // Empty star
        stars.add(Icon(Icons.star_border, color: emptyColor, size: size));
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
