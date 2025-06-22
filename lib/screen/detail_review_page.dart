import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:get_healt_2/widget/review_item.dart';

import '../data/models/ulasan_model.dart';

class DetailReview extends StatelessWidget {
  final List<ReviewModel>? ulasanList;
  final String averageRating;
  const DetailReview(
      {super.key, required this.ulasanList, required this.averageRating});

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
                    color: AppColors.primaryColor,
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
                        initialRating: double.parse(averageRating),
                        minRating: 0,
                        maxRating: 5,
                        itemSize: 25,
                        itemCount: 5,
                        allowHalfRating: true,
                        onRatingUpdate: (value) {},
                        ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: AppColors.accentColor,
                          ),
                          half: const Icon(
                            Icons.star_half_outlined,
                            color: AppColors.accentColor,
                          ),
                          empty: const Icon(
                            Icons.star_outline,
                            color: AppColors.accentColor,
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
                            "${double.parse(averageRating)}/5",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: AppColors.textColor),
                          ),
                          Text(
                            "(12 ulasan)",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: AppColors.textColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 40,
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReviewItem(
                  date: ulasanList![index].timestamp.toString(),
                  rating: ulasanList![index].rating,
                  userName: ulasanList![index].userName,
                  review: ulasanList![index].review,
                ),
              );
            },
            itemCount: ulasanList!.length,
          ))
        ],
      ),
    );
  }
}
