import 'package:flutter/material.dart';

import 'package:get_healt/util/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchSecond extends StatefulWidget {
  final ValueChanged<String> onCustomWidgetCallback;
  const SearchSecond(
      {super.key, required, required this.onCustomWidgetCallback});

  @override
  State<SearchSecond> createState() => _SearchSecondState();
}

class _SearchSecondState extends State<SearchSecond> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          filled: true,

          fillColor: kotakColor,
          hintText: 'Cari  nama produk atau gejala ...',
          hintStyle: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              color: tulisanColor),
          // Add a clear button to the search bar
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => _searchController.clear(),
          ),
          // Add a search icon or button to the search bar
          prefixIcon: IconButton(
            icon: const Icon(
              Icons.search,
              color: aksenColor,
            ),
            onPressed: () {
              // Perform the search here
              widget.onCustomWidgetCallback(_searchController.text);
            },
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
