import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/primary_button.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({
    super.key,
    required this.nextPage,
    required this.previousPage,
  });

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: widget.previousPage),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: kMediumSpacing / 2),
            Text(
              "Choose rating",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rating.toStringAsFixed(0),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Icon(Icons.star, size: 48, color: Colors.amber),
              ],
            ),
            const Spacer(),
            Slider(
              min: 0,
              max: 10,
              value: rating,
              divisions: 10,
              label: rating.toStringAsFixed(0),
              onChanged: (value) {
                rating = value;
                setState(() {});
              },
            ),
            const Spacer(),
            PrimaryButton(onPressed: widget.nextPage, text: "Continue"),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
