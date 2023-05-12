import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../util/colors.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: kotakColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "User XXXX",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: tulisanColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBar(
                initialRating: 4.5,
                minRating: 0,
                maxRating: 5,
                itemSize: 18,
                itemCount: 5,
                allowHalfRating: true,
                onRatingUpdate: (value) {},
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: aksenColor,
                  ),
                  half: const Icon(
                    Icons.star_half_outlined,
                    color: aksenColor,
                  ),
                  empty: const Icon(
                    Icons.star_outline,
                    color: aksenColor,
                  ),
                ),
              ),
              Text(
                "05/08/2023, 16:21",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: tulisanColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Aku ingin begini. Aku ingin begitu. Ingin ini, ingin itu, banyak sekali. Semua, semua, ...",
            textAlign: TextAlign.justify,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: tulisanColor),
          ),
        ],
      ),
    );
  }
}
