import 'package:flutter/material.dart';

class GetLocationWidget extends StatelessWidget {
  const GetLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.location_on,
          size: 28,
        ),
        label: const Text(
          "Get location",
          style: TextStyle(fontSize: 19),
        ),
      ),
    );
  }
}