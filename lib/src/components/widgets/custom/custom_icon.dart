import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Renders an SVG or raster image asset as an icon with optional color
/// tinting and sizing.
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

  /// Asset path to the icon file (.svg or .png/.jpg).
  final String path;
  /// Height of the icon. Defaults to 24.
  final double? height;
  /// Width of the icon. Defaults to [height].
  final double? width;
  /// Color tint applied to the icon.
  final Color? color;
  /// How the image should fit within its bounds. Defaults to [BoxFit.contain].
  final BoxFit fit;
  /// Whether the asset is an SVG. Auto-detected from the file extension
  /// when null.
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
