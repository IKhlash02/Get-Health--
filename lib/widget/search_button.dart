import 'package:flutter/material.dart';
import 'package:get_healt/util/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        // Add padding around the search bar
        padding: const EdgeInsets.symmetric(vertical: 15),
        // Use a Material design search bar
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            filled: true,

            fillColor: kotakColor,
            hintText: 'Cari...',
            hintStyle: Theme.of(context).textTheme.bodyLarge,
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
              },
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
