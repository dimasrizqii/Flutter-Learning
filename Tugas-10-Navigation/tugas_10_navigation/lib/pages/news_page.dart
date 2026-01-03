// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/news_model.dart';
import 'news_detail_page.dart';

class NewsPage extends StatelessWidget {
  NewsPage({super.key});

  final List<NewsModel> newsList = [
    NewsModel(
      id: '1',
      category: 'TECHNOLOGY',
      title: 'Microsoft launches a deepfake detector tool ahead of US election',
      imageUrl: 'assets/images/News.png',
      author: 'Dimas Rizqi Ibadurrahim',
      date: '3 min ago',
      content:
          'In the last couple of years, we\'ve seen new teams in tech companies emerge that focus on responsible innovation, digital well-being, AI ethics or humane use. Whatever their titles, these individuals are given the task of steering their company in a direction that is positive for society.',
    ),
    NewsModel(
      id: '2',
      category: 'TECHNOLOGY',
      title: 'Insurtech startup PasarPolis gets \$54 million — Series B',
      imageUrl: 'assets/images/InsurTech.png',
      author: 'Dimas Rizqi Ibadurrahim',
      date: '5 min ago',
      content:
          'PasarPolis, an insurtech startup, has raised \$54 million in Series B funding to expand its operations across Southeast Asia.',
    ),
    NewsModel(
      id: '3',
      category: 'TECHNOLOGY',
      title: 'The IPO parade continues as Wish files, Bumble',
      imageUrl: 'assets/images/Bumble.png',
      author: 'Dimas Rizqi Ibadurrahim',
      date: '10 min ago',
      content:
          'The IPO market continues to heat up with new filings from major tech companies.',
    ),
    NewsModel(
      id: '4',
      category: 'TECHNOLOGY',
      title: 'Hypatos gets \$11.8M for an approach to document processing',
      imageUrl: 'assets/images/Hypatos.png',
      author: 'Dimas Rizqi Ibadurrahim',
      date: '15 min ago',
      content:
          'Hypatos has secured \$11.8M in funding for its innovative approach to document processing using AI.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildFeaturedNews(context),
              const SizedBox(height: 32),
              _buildLatestNews(context),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xff1E1E1E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Image(image: AssetImage('assets/images/Menu Icon.png'))
          ),
          Text(
            'NewsApp',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1E1E1E),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildFeaturedNews(BuildContext context) {
    return SizedBox(
      height: 256,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final featuredNews = newsList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(news: featuredNews),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: index < newsList.length - 1 ? 16 : 0),
              width: MediaQuery.of(context).size.width - 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(featuredNews.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xff3490DB),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            featuredNews.category,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          featuredNews.title,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.4,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.bookmark_border,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 20,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Text(
                      featuredNews.date,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLatestNews(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1E1E1E),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: const Color(0xff9E9E9E),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final news = newsList[index];
            return _buildNewsItem(context, news);
          },
        ),
      ],
    );
  }

  Widget _buildNewsItem(BuildContext context, NewsModel news) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(news: news),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(news.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.category,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff9E9E9E),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    news.title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff1E1E1E),
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
