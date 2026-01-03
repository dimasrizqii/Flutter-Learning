class NewsModel {
  final String id;
  final String category;
  final String title;
  final String imageUrl;
  final String author;
  final String? authorImageUrl;
  final String date;
  final String content;

  NewsModel({
    required this.id,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.author,
    this.authorImageUrl,
    required this.date,
    required this.content,
  });
}
