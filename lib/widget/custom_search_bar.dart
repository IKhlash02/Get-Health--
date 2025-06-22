import 'package:flutter/material.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String query) onSubmitted;
  final String hintText;

  final TextEditingController _searchController = TextEditingController();

  CustomSearchBar({
    super.key,
    required this.onSubmitted,
    this.hintText = 'Cari nama produk atau gejala...',
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _searchController,
      hintText: hintText,
      hintStyle: WidgetStateProperty.all(
        GoogleFonts.plusJakartaSans(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.textColor,
        ),
      ),
      leading: const Icon(
        Icons.search,
        color: AppColors.accentColor,
      ),
      trailing: <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => _searchController.clear(),
        ),
      ],
      onSubmitted: (query) {
        if (query.trim().isNotEmpty) {
          onSubmitted(query);
        }
      },
      backgroundColor: WidgetStateProperty.all(AppColors.boxColor),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide.none, // No border
        ),
      ),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }
}
