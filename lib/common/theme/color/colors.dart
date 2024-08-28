part of '../theme.dart';

class AppColors {
  const AppColors._({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.background,
    required this.surface,
    required this.error,
    required this.onPrimary,
    required this.onSecondary,
    required this.onTertiary,
    required this.onBackground,
    required this.onSurface,
    required this.onError,
  });

  /// A primary color is the color displayed most frequently across your app's screens and components.
  final Color primary;

  /// A secondary color provides more ways to accent and distinguish your product. Having a secondary color is optional, and should be applied sparingly to accent select parts of your UI.
  ///
  /// If you don’t have a secondary color, your primary color can also be used to accent elements.
  ///
  /// Secondary colors are best for:
  ///
  /// Floating action buttons
  /// Selection controls, like sliders and switches
  /// Highlighting selected text
  /// Progress bars
  /// Links and headlines
  final Color secondary;

  /// A tertiary color provides more ways to accent and distinguish your product. Having a tertiary color is optional, and should be applied sparingly to accent select parts of your UI.
  final Color tertiary;

  /// The background color appears behind scrollable content. The baseline background and surface color is #FFFFFF.
  final Color background;

  /// Surface colors affect surfaces of components, such as cards, sheets, and menus.
  final Color surface;

  /// Error colors indicate errors in components, such as text fields. It should be used sparingly to not overwhelm users.
  final Color error;
  final Color onPrimary;
  final Color onSecondary;
  final Color onTertiary;
  final Color onBackground;
  final Color onSurface;
  final Color onError;

  factory AppColors.dark() {
    return const AppColors._(
      primary: Color(0xFFFF6F00), // Gradient Orange (Primary Button Color)
      secondary: Color(0xFF29B6F6), // Soft Blue (Icons/Indicators)
      tertiary: Color(0xFF66BB6A), // Bright Green (Positive Data)
      background: Color(0xFF0F1D2F), // Dark Blue (Primary Background)
      surface: Color(0xFF17223A), // Deep Navy (Secondary Background)
      error: Color(0xFFFF5252), // Bright Red (Error/Warnings)
      onPrimary: Color(0xFFFFFFFF), // White (Text on Primary)
      onSecondary: Color(0xFFFFFFFF), // White (Text on Secondary)
      onTertiary: Color(0xFF000000), // Black (Text on Tertiary)
      onBackground: Color(0xFFC5DFFA), // Light Blue (Text on Background)
      onSurface: Color(0xFFB0BEC5), // Light Grey (Text on Surface)
      onError: Color(0xFF000000), // Black (Text on Error)
    );
  }
}
