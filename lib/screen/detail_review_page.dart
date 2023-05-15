import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_healt/util/colors.dart';
import 'package:get_healt/widget/review_item.dart';

class DetailReview extends StatelessWidget {
  const DetailReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primerColor,
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 18,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text("ULASAN PRODUK",
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      RatingBar(
                        initialRating: 4.5,
                        minRating: 0,
                        maxRating: 5,
                        itemSize: 25,
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
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "4.5/5",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: tulisanColor),
                          ),
                          Text(
                            "(12 ulasan)",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: tulisanColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 32,
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: ReviewItem(),
              );
            },
            itemCount: 10,
          ))
        ],
      ),
    );
  }
}
