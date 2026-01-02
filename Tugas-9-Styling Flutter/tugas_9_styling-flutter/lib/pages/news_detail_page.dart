// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/news_model.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsModel news;

  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildImage(),
              const SizedBox(height: 24),
              _buildAuthorInfo(),
              const SizedBox(height: 20),
              _buildCategory(),
              const SizedBox(height: 12),
              _buildTitle(),
              const SizedBox(height: 12),
              _buildDate(),
              const SizedBox(height: 24),
              _buildContent(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xff1E1E1E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE0E0E0)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.bookmark_border,
                  color: Color(0xff1E1E1E),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE0E0E0)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.more_horiz,
                  color: Color(0xff1E1E1E),
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 248,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(news.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildAuthorInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: news.authorImageUrl == null || news.authorImageUrl!.isEmpty
                  ? const Color(0xffE0E0E0)
                  : null,
              image: news.authorImageUrl != null && news.authorImageUrl!.isNotEmpty
                  ? DecorationImage(
                      image: AssetImage(news.authorImageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: news.authorImageUrl == null || news.authorImageUrl!.isEmpty
                ? const Icon(
                    Icons.person,
                    color: Color(0xff9E9E9E),
                    size: 28,
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Text(
            news.author,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1E1E1E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        news.category,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: const Color(0xff3490DB),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        news.title,
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: const Color(0xff1E1E1E),
          height: 1.3,
        ),
      ),
    );
  }

  Widget _buildDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        news.date,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xff9E9E9E),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        news.content,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xff424242),
          height: 1.8,
        ),
      ),
    );
  }
}
