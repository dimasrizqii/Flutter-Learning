import 'package:flutter/material.dart';
import '../models/comment.dart';
import '../models/post.dart';
import '../services/api_service.dart';

class PostCommentsPage extends StatefulWidget {
  final Post post;

  const PostCommentsPage({super.key, required this.post});

  @override
  State<PostCommentsPage> createState() => _PostCommentsPageState();
}

class _PostCommentsPageState extends State<PostCommentsPage> {
  final ApiService _apiService = ApiService();
  List<Comment> _comments = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  Future<void> _loadComments() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final comments = await _apiService.getCommentsByPostId(widget.post.id);
      setState(() {
        _comments = comments;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F23),
      body: CustomScrollView(slivers: [_buildAppBar(), _buildBody()]),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      backgroundColor: const Color(0xFF1A1A35),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Comments (${_comments.length})',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6C5CE7), Color(0xFF4834D4)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Post #${widget.post.id} by User ${widget.post.userId}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.post.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return SliverFillRemaining(
        child: const Center(
          child: CircularProgressIndicator(color: Color(0xFF6C5CE7)),
        ),
      );
    }

    if (_errorMessage != null) {
      return SliverFillRemaining(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Error loading comments',
                  style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                ),
                const SizedBox(height: 8),
                Text(
                  _errorMessage!,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _loadComments,
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (_comments.isEmpty) {
      return SliverFillRemaining(
        child: const Center(
          child: Text(
            'No comments found for this post',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final comment = _comments[index];
          return _buildCommentCard(comment, index);
        }, childCount: _comments.length),
      ),
    );
  }

  Widget _buildCommentCard(Comment comment, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A1A35), Color(0xFF2D2D50)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF6C5CE7).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C5CE7).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Color(0xFF6C5CE7),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        comment.email,
                        style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                comment.body,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[200],
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
