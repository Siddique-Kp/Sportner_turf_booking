// import 'package:flutter/material.dart';


// import '../../utils/global_colors.dart';

// class ShimmerWidget extends StatelessWidget {
//   const ShimmerWidget({
//     super.key,
//     required this.height,
//     required this.width,
//     this.radius = 6,
//     this.color = AppColors.lightGrey,
//     this.child = const SizedBox()
//   });

//   final double height;
//   final double width;
//   final double radius;
//   final Color color;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: AppColors.grey[500]!,
//       highlightColor: AppColors.grey[300]!,
//       child: BlankContainer(
//         height: height,
//         width: width,
//         radius: radius,
//         color: color,
//         child: child,
//       ),
//     );
//   }
// }

// class BlankContainer extends StatelessWidget {
//   const BlankContainer({
//     super.key,
//     required this.height,
//     required this.width,
//     this.radius = 6,
//     this.color = AppColors.lightGrey,
//     this.child = const SizedBox(),
//   });

//   final double height;
//   final double width;
//   final double radius;
//   final Color color;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height.h,
//       width: width.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(radius.r),
//         color: color,
//       ),
//       child: child,
//     );
//   }
// }

