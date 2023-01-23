import 'package:flutter/material.dart';

/// Color scheme of the UI
/// Abstracted to adhere to DRY and ease of change
class ColorSelection {
  static const primary = Color.fromRGBO(15, 4, 75, 1);
  static const primaryContainer = Color.fromRGBO(231, 232, 244, 1);
  static const onPrimaryContainer = Color.fromRGBO(15, 4, 75, 0.5);

  static const secondary = Color.fromRGBO(23, 30, 97, 1);
  static const secondaryContainer = Color.fromRGBO(185, 188, 208, 1);
  static const onSecondaryContainer = Color.fromRGBO(15, 4, 75, 1);

  static const tertiary = Color.fromRGBO(120, 122, 145, 1);
  static const tertiaryContainer = Color.fromRGBO(219, 220, 248, 1);
  static const onTertiaryContainer = Color.fromRGBO(15, 4, 75, 0.4);

  static const neutral = Color.fromRGBO(255, 251, 235, 1);
  static const neutralContainer = Color.fromRGBO(227, 228, 236, 1);

  static const neutralVariant = Color.fromRGBO(238, 238, 238, 1);
  static const neutralVariantContainer = Color.fromRGBO(233, 233, 233, 1);

  static const accent = Color.fromRGBO(195, 199, 254, 0.7);
  static const accentVariant = Color.fromRGBO(255, 185, 185, 1);

  static const alert = Color.fromRGBO(239, 75, 75, 1);
  static const alertContainer = Color.fromRGBO(239, 75, 75, 0.7);
}

/// Text styles used in the UI
/// Abstracted to adhere to DRY and ease of change
class TextStyleSelection {
  static const titleTextMainLight = TextStyle(
    color: ColorSelection.neutral,
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );

  static const titleTextMainDark = TextStyle(
    color: ColorSelection.primary,
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );

  static const subtitleTextMainLight = TextStyle(
    color: ColorSelection.neutral,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const subtitleTextMainDark = TextStyle(
    color: ColorSelection.primary,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const buttonText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const primaryText = TextStyle(
    color: ColorSelection.primary,
  );

  static const neutralText = TextStyle(
    color: ColorSelection.neutral,
  );

  static const titleTextHome = TextStyle(
    color: ColorSelection.primary,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static const regularTextTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const regularText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const instructionText = TextStyle(
    color: ColorSelection.primary,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
  );

  static const recordCardTitle = TextStyle(
    color: ColorSelection.primary,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const recordCardSubtitle = TextStyle(
    color: ColorSelection.primary,
    fontSize: 14,
  );
}
