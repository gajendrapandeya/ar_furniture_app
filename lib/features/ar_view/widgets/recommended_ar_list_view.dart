// import 'package:ar_furniture_app/core/widgets/spacer.dart';
// import 'package:ar_furniture_app/features/ar_view/controller/ar_recommended_controller.dart';
// import 'package:ar_furniture_app/features/ar_view/controller/image_controller.dart';
// import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class RecommendedArListView extends ConsumerStatefulWidget {
//   const RecommendedArListView({
//     super.key,
//     required this.product,
//     required this.recommendedProducts,
//   });

//   final List<Product> recommendedProducts;
//   final Product product;

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _RecommendedArListViewState();
// }

// class _RecommendedArListViewState extends ConsumerState<RecommendedArListView> {
//   @override
//   Widget build(BuildContext context) {
//     return _buildRecommendedProducts(widget.recommendedProducts);
//   }

//   Widget _buildRecommendedProducts(List<Product> recommendedProducts) {
//     final addedRecommendedProducts = [widget.product, ...recommendedProducts];
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.15,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 12,
//         vertical: 8,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade50,
//       ),
//       alignment: Alignment.center,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: ((context, index) =>
//             _buildRecommendedItem(addedRecommendedProducts, index)),
//         separatorBuilder: ((context, index) => HorizontalSpacer.xs),
//         itemCount: addedRecommendedProducts.length,
//       ),
//     );
//   }

//   Widget _buildRecommendedItem(
//       List<Product> addedRecommendedProducts, int index) {
//     final arRecommenderProvider =
//         ref.watch(arRecommendedProvider(_removedBgUrl));
//     return InkWell(
//       onTap: () {
//         ref
//             .read(arRecommendedProvider(_removedBgUrl).notifier)
//             .setIndex(index: index);
//         ref
//             .read(arRecommendedProvider(_removedBgUrl).notifier)
//             .setImageUrl(imageUrl: _removedBgUrl);
//         ref.read(imageProvider.notifier).getImageUrl(
//               imageUrl: addedRecommendedProducts[index].imageUrls.first,
//               apiKey: dotenv.env['REMOVE_BG_API_KEY']!,
//             );
//       },
//       child: Container(
//         padding: const EdgeInsets.all(2),
//         decoration: BoxDecoration(
//             border: Border.all(
//           color: arRecommenderProvider.selectedIndex == index
//               ? Colors.black
//               : Colors.transparent,
//         )),
//         child: CachedNetworkImage(
//           imageUrl: addedRecommendedProducts[index].imageUrls.first,
//           fit: BoxFit.cover,
//           width: 100,
//         ),
//       ),
//     );
//   }
// }
