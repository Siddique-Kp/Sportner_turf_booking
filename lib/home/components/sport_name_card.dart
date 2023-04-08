import 'package:flutter/material.dart';

class SportsNameCard extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Color? color;
  final Widget? child;
  final String sports;
  const SportsNameCard({
    super.key,
    this.onTap,
    this.color,
    this.child,
    required this.sports,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 40,
          width: 110,
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                child: child,
              ),
              SizedBox(
                width: 60,
                height: 40,
                child: Center(
                  child: Text(
                    sports,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
