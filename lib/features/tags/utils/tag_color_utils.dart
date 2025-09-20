import 'package:flutter/material.dart';
import 'dart:math';

class TagColorUtils {
  // Predefined color palette for tags
  static const List<Color> _tagColors = [
    Color(0xFF2196F3), // Blue
    Color(0xFF4CAF50), // Green
    Color(0xFFFF9800), // Orange
    Color(0xFF9C27B0), // Purple
    Color(0xFFF44336), // Red
    Color(0xFF00BCD4), // Cyan
    Color(0xFF795548), // Brown
    Color(0xFF607D8B), // Blue Grey
    Color(0xFFE91E63), // Pink
    Color(0xFF3F51B5), // Indigo
    Color(0xFF009688), // Teal
    Color(0xFFFF5722), // Deep Orange
    Color(0xFF8BC34A), // Light Green
    Color(0xFFCDDC39), // Lime
    Color(0xFFFFC107), // Amber
  ];

  /// Generate a consistent color for a tag based on its name
  /// Same tag name will always return the same color
  static Color getTagColor(String tagName) {
    if (tagName.isEmpty) return _tagColors.first;

    // Use hashCode to get consistent color for same tag name
    final hash = tagName.toLowerCase().hashCode;
    final index = hash.abs() % _tagColors.length;
    return _tagColors[index];
  }

  /// Get a lighter version of the tag color for backgrounds
  static Color getTagBackgroundColor(String tagName) {
    final color = getTagColor(tagName);
    return color.withValues(alpha: 0.1);
  }

  /// Get a border color for the tag
  static Color getTagBorderColor(String tagName) {
    final color = getTagColor(tagName);
    return color.withValues(alpha: 0.3);
  }

  /// Get appropriate text color for the tag (either white or black based on background)
  static Color getTagTextColor(String tagName) {
    final color = getTagColor(tagName);

    // Calculate luminance to determine if we should use light or dark text
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black87 : Colors.white;
  }

  /// Generate a random color (for testing purposes)
  static Color getRandomColor() {
    final random = Random();
    return _tagColors[random.nextInt(_tagColors.length)];
  }
}
