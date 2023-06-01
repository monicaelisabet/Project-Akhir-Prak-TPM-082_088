import 'package:flutter/material.dart';
import 'favorite_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsDetailScreen extends StatefulWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String description;
  final String content;
  final String urlNews;

  const NewsDetailScreen({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
    required this.content,
    required this.urlNews,
  });

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  bool isFavorited = false;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorited = _prefs.getBool(widget.urlNews) ?? false;
    });
  }

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
      _prefs.setBool(widget.urlNews, isFavorited);
      if (isFavorited) {
        FavoriteScreen.addFavoriteNews(FavoriteNews(
          title: widget.title,
          author: widget.author,
          imageUrl: widget.imageUrl,
        ));
      } else {
        FavoriteScreen.favoriteNewsList.removeWhere((news) => news.imageUrl == widget.imageUrl);
      }
    });
  }

  void _launchURL() async {
    String url = widget.urlNews;
    try {
      await launch(url);
    } catch (e) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'By ${widget.author}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  RichText(
                    text: TextSpan(
                      text: 'Read More : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: widget.urlNews,
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = _launchURL,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: isFavorited ? Colors.red : null,
                      ),
                      onPressed: toggleFavorite,
                    ),
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
