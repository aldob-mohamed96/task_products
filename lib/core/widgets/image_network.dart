import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_products/core/resources_manager/assets.dart';
import 'package:task_products/core/widgets/loading.dart';

class NetWorkImageCashed extends StatelessWidget {
  final String url;
  final double size;
  final double height;
  final double width;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BoxFit boxFit;
  final double? raduis;

  const NetWorkImageCashed({
    super.key,
    required this.url,
    this.size = 24,
    this.height = 24,
    this.width = 24,
    this.raduis = 4,
    this.boxFit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CachedNetworkImage(
        fit: boxFit,
        imageUrl: url,
        cacheKey: url,
        fadeInDuration: const Duration(milliseconds: 100),
        fadeOutDuration: const Duration(milliseconds: 100),
        placeholderFadeInDuration: const Duration(milliseconds: 100),
        useOldImageOnUrlChange: false,
        alignment: Alignment.center,
        imageBuilder:
            (context, imageProvider) => Align(
              alignment: Alignment.center,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(raduis ?? 8),
                    topRight: Radius.circular(raduis ?? 8),
                    bottomLeft: Radius.circular(raduis ?? 8),
                    bottomRight: Radius.circular(raduis ?? 8),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                child: SizedBox(height: height, width: width),
              ),
            ),
        placeholder:
            (context, url) => Align(
              alignment: Alignment.center,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[600],
                  ),

                  height: height,
                  width: width,
                  // child: Center(
                  //   child: placeholder ?? const DottedLoading(),
                  // ),
                ),
              ),
            ),
        errorWidget: (context, url, error) {
          return SizedBox(
            height: height,
            width: width,
            child:
                errorWidget ??
                Image.asset(
                  Assets.assetsImgPngNotfoundimage,
                  fit: BoxFit.cover,
                  height: height,
                  width: width,
                ),
          );
        },
      ),
    );
  }
}

class NetWorkImageCashedLogo extends StatelessWidget {
  final String url;
  final double size;
  final double height;
  final double width;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BoxFit boxFit;

  const NetWorkImageCashedLogo({
    super.key,
    required this.url,
    this.size = 24,
    this.height = 24,
    this.width = 24,
    this.boxFit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onDoubleTap: () {
      //   Navigator.of(context)
      //       .pushNamed(Routes.photoView, arguments: {'image': url});
      // },
      // onLongPress: () {
      //   Navigator.of(context)
      //       .pushNamed(Routes.photoView, arguments: {'image': url});
      // },
      child: CachedNetworkImage(
        fit: boxFit,
        imageUrl: url,
        cacheKey: url,
        fadeInDuration: const Duration(milliseconds: 100),
        fadeOutDuration: const Duration(milliseconds: 100),
        placeholderFadeInDuration: const Duration(milliseconds: 100),
        useOldImageOnUrlChange: false,
        alignment: Alignment.center,
        imageBuilder:
            (context, imageProvider) => Align(
              alignment: Alignment.center,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
                child: SizedBox(height: height, width: width),
              ),
            ),
        placeholder:
            (context, url) => Align(
              alignment: Alignment.center,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Center(child: placeholder ?? const DottedLoading()),
                ),
              ),
            ),
        errorWidget: (context, url, error) {
          return SizedBox(
            height: height,
            width: width,
            child:
                errorWidget ??
                SvgPicture.asset(Assets.assetsImgPngNotfoundimage),
          );
        },
      ),
    );
  }
}
