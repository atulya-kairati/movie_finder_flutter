import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/movie_flow/result/result.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/primary_button.dart';

class YearsBackScreen extends StatefulWidget {
  const YearsBackScreen({
    super.key,
    required this.previousPage,
  });

  final VoidCallback previousPage;

  @override
  State<YearsBackScreen> createState() => _YearsBackScreenState();
}

class _YearsBackScreenState extends State<YearsBackScreen> {

  double yearsBack = 10;

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
              "How old...",
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
                  yearsBack.toStringAsFixed(0),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  " Years back",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).textTheme.headlineMedium?.color?.withOpacity(0.6)
                  ),
                ),
              ],
            ),
            const Spacer(),
            Slider(
              min: 0,
              max: 70,
              value: yearsBack,
              divisions: 70,
              label: yearsBack.toStringAsFixed(0),
              onChanged: (value) {
                yearsBack = value;
                setState(() {});
              },
            ),
            const Spacer(),
            PrimaryButton(onPressed: (){
              Navigator.of(context).push(ResultScreen.route());
            }, text: "Perfect",),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
