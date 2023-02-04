import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/movie_flow/landing/landing_screen.dart';

class MovieFlow extends StatefulWidget {
  const MovieFlow({super.key});

  @override
  State<MovieFlow> createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow> {
  final pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pagecontroller,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        LandingPage(),
        Scaffold(body: Container(color: Colors.red)),
        Scaffold(body: Container(color: Colors.yellow)),
        Scaffold(body: Container(color: Colors.blue)),
        Scaffold(body: Container(color: Colors.green)),
      ],
    );
  }

  void nextPage() {
    pagecontroller.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInCubic,
    );
  }

  void previousPage() {
    pagecontroller.previousPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInCubic,
    );
  }

  @override
  void dispose() {
    pagecontroller.dispose();
    super.dispose();
  }
}
