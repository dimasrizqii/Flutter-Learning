// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1E1E1E),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search news...',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xff9E9E9E),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xff9E9E9E),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_outlined,
                        size: 64,
                        color: const Color(0xff9E9E9E),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Cari berita yang Anda inginkan',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color(0xff9E9E9E),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
