import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'register_screen.dart';
import 'home_screen.dart';
import 'news_screen.dart';
import 'favorite_screen.dart';
import 'currency_converter_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final MaterialColor blackColor = MaterialColor(
  //   0xFF000000,
  //   <int, Color>{
  //     50: Color(0xFF000000),
  //     100: Color(0xFF000000),
  //     200: Color(0xFF000000),
  //     300: Color(0xFF000000),
  //     400: Color(0xFF000000),
  //     500: Color(0xFF000000),
  //     600: Color(0xFF000000),
  //     700: Color(0xFF000000),
  //     800: Color(0xFF000000),
  //     900: Color(0xFF000000),
  //   },
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News24',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _screens = [
    NewsScreen(),
    FavoriteScreen(),
    CurrencyConverterScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert),
            label: 'Others',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black, // Warna ikon dan label yang dipilih
        unselectedItemColor: Colors.grey, // Warna ikon dan label yang tidak dipilih
        onTap: _onItemTapped,
      ),
    );
  }
}