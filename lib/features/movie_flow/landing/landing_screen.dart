import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
    required this.nextPage,
    required this.previousPage,
  });

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: kMediumSpacing/2),
            Text(
              "Find a movie to watch",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset("images/movie.png"),
            ),
            const Spacer(),

            PrimaryButton(onPressed: nextPage, text: "Get started"),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
