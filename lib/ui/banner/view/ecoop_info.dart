// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:etekad/core/core.dart';
// import 'package:etekad/ui/banner/cubit/banner_cubit.dart';
// import 'package:etekad/ui/component/component.dart';
// import 'package:etekad/ui/component/shimmer.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class EcoopInfo extends StatelessWidget {
//   const EcoopInfo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BannerCubit, BannerState>(
//       builder: (context, state) {
//         if (state is BannerLoaded) {
//           return ListView.builder(
//               shrinkWrap: true,
//               itemCount: state.listBanner.length,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, i) {
//                 return InkWell(
//                   onTap: () {
//                     BlocProvider.of<BannerCubit>(context)
//                         .navDetail(state.listBanner[i]);
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.all(15),
//                     child: ClipRRect(
//                       borderRadius: const BorderRadius.all(Radius.circular(10)),
//                       child: CachedNetworkImage(
//                         imageUrl: state.listBanner[i].imageUrl!,
//                         fit: BoxFit.cover,
//                         width: 1000.0,
//                         placeholder: (context, url) => const ShimmerBanner(),
//                         errorWidget: (context, url, error) => Image.asset(
//                           "assets/images/banner_1.png",
//                           fit: BoxFit.cover,
//                           width: SizeConfig.blockSizeHorizontal * 100,
//                           height: SizeConfig.blockSizeHorizontal * 40,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               });
//         } else if (state is BannerLoading) {
//           return const ShimmerBanner();
//         } else {
//           return Component.textBold("Error");
//         }
//       },
//     );
//   }
// }
