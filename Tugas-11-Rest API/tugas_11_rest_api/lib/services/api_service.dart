import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/comment.dart';
import '../models/post.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts({int page = 1, int limit = 10}) async {
    try {
      final url = '$baseUrl/posts?_page=$page&_limit=$limit';

      print('Fetching posts from: $url');

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts: Status ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching posts: $e');
      throw Exception('Error: $e');
    }
  }

  Future<List<Comment>> getCommentsByPostId(int postId) async {
    try {
      print(
        'Fetching comments for post $postId from: $baseUrl/posts/$postId/comments',
      );
      final response = await http.get(
        Uri.parse('$baseUrl/posts/$postId/comments'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Comment.fromJson(json)).toList();
      } else {
        throw Exception(
          'Failed to load comments: Status ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error fetching comments: $e');
      throw Exception('Error: $e');
    }
  }

  Future<List<Comment>> getComments() async {
    try {
      print('Fetching comments from: $baseUrl/comments');
      final response = await http.get(
        Uri.parse('$baseUrl/comments'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Comment.fromJson(json)).toList();
      } else {
        throw Exception(
          'Failed to load comments: Status ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error fetching comments: $e');
      throw Exception('Error: $e');
    }
  }

  Future<Comment> getCommentById(int id) async {
    try {
      print('Fetching comment from: $baseUrl/comments/$id');
      final response = await http.get(
        Uri.parse('$baseUrl/comments/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Comment.fromJson(jsonData);
      } else {
        throw Exception(
          'Failed to load comment: Status ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error fetching comment: $e');
      throw Exception('Error: $e');
    }
  }
}
