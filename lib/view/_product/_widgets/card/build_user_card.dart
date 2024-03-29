// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
// import 'package:fluttermvvmtemplate/view/feed/model/house_model.dart';
// import 'package:kartal/kartal.dart';

// class BuildUserCard extends StatelessWidget {
//   BuildUserCard({
//     required this.model,
//     required this.onPressedLikeId,
//     super.key,
//     this.isLiked = false,
//   });
//   final HouseModel model;
//   final bool isLiked;
//   Function(String id) onPressedLikeId;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ListTile(
//           contentPadding: EdgeInsets.zero,
//           leading:
//               CircleAvatar(backgroundImage: NetworkImage(model.user.image)),
//           title: Text(model.user.name),
//           subtitle: Text(model.user.date),
//           trailing: buildIconButton(),
//         ),
//         context.sized.emptySizedHeightBoxLow,
//         buildWrap(context),
//       ],
//     );
//   }

//   Widget buildWrap(BuildContext context) {
//     return Column(
//       children: [
//         AutoSizeText(
//           model.title,
//           style: context.textTheme.titleLarge
//               ?.copyWith(fontWeight: FontWeight.w600),
//           maxLines: 1,
//         ),
//         Text(model.description),
//       ],
//     );
//   }

//   IconButton buildIconButton() {
//     return IconButton(
//       icon: Icon(
//         Icons.favorite,
//         color: isLiked ? Colors.pink : Colors.black12,
//       ),
//       onPressed: () {
//         onPressedLikeId(model.id);
//       },
//     );
//   }
// }
