import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';
import 'post_comments_page.dart';

class PostsListPage extends StatefulWidget {
  const PostsListPage({super.key});

  @override
  State<PostsListPage> createState() => _PostsListPageState();
}

class _PostsListPageState extends State<PostsListPage> {
  final ApiService _apiService = ApiService();
  List<Post> _posts = [];
  bool _isLoading = true;
  String? _errorMessage;

  int _currentPage = 1;
  final int _postsPerPage = 10;
  final int _totalPosts = 100;

  int get _totalPages => (_totalPosts / _postsPerPage).ceil();
  bool get _isFirstPage => _currentPage == 1;
  bool get _isLastPage => _currentPage >= _totalPages;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final posts = await _apiService.getPosts(
        page: _currentPage,
        limit: _postsPerPage,
      );
      setState(() {
        _posts = posts;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  void _goToNextPage() {
    if (!_isLastPage) {
      setState(() {
        _currentPage++;
      });
      _loadPosts();
    }
  }

  void _goToPreviousPage() {
    if (!_isFirstPage) {
      setState(() {
        _currentPage--;
      });
      _loadPosts();
    }
  }

  void _refreshCurrentPage() {
    _loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F23),
      appBar: AppBar(
        title: const Text(
          'Posts',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: const Color(0xFF1A1A35),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshCurrentPage,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildPageIndicator(),
          Expanded(child: _buildBody()),
          _buildPaginationControls(),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(color: const Color(0xFF1A1A35)),
    );
  }

  Widget _buildPaginationControls() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A35),
        border: Border(
          top: BorderSide(
            color: const Color(0xFF6C5CE7).withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!_isFirstPage)
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _isLoading ? null : _goToPreviousPage,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Previous'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D2D50),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            )
          else
            const Expanded(child: SizedBox()),

          const SizedBox(width: 16),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF6C5CE7).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF6C5CE7).withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Text(
              '$_currentPage / $_totalPages',
              style: const TextStyle(
                color: Color(0xFF6C5CE7),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          const SizedBox(width: 16),

          if (!_isLastPage)
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _isLoading ? null : _goToNextPage,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Next'),
                iconAlignment: IconAlignment.end,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C5CE7),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            )
          else
            const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF6C5CE7)),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Error loading posts',
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
                onPressed: _refreshCurrentPage,
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }

    if (_posts.isEmpty) {
      return const Center(
        child: Text(
          'No posts found',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return _buildPostCard(post);
      },
    );
  }

  Widget _buildPostCard(Post post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A1A35), Color(0xFF2D2D50)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C5CE7).withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostCommentsPage(post: post),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6C5CE7).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.article,
                        color: Color(0xFF6C5CE7),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Post #${post.id}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'User ${post.userId}',
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF6C5CE7),
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  post.body,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[300],
                    height: 1.5,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.comment, size: 14, color: Colors.green),
                      SizedBox(width: 4),
                      Text(
                        'View Comments',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
