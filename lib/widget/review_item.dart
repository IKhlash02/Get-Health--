import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../util/colors.dart';

class ReviewItem extends StatelessWidget {
  final String userName;
  final String rating;
  final String date;
  final String review;
  const ReviewItem(
      {super.key,
      required this.userName,
      required this.date,
      required this.rating,
      required this.review});

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
            userName,
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
                initialRating: double.parse(rating),
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
                date,
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
            review,
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
