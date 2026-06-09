import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
    this.isSvg,
  });

  final String path;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;
  final bool? isSvg;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = color ?? theme.colorScheme.onSurface;
    final effectiveHeight = height ?? 24;
    final effectiveWidth = width ?? effectiveHeight;

    final isSvgFile = isSvg ?? path.endsWith('.svg');

    if (isSvgFile) {
      return SvgPicture.asset(
        path,
        height: effectiveHeight,
        width: effectiveWidth,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        fit: fit,
      );
    }

    return Image.asset(
      path,
      height: effectiveHeight,
      width: effectiveWidth,
      color: iconColor,
      fit: fit,
      errorBuilder: (_, __, ___) => Icon(
        Icons.broken_image_outlined,
        size: effectiveHeight,
        color: iconColor,
      ),
    );
  }
}
