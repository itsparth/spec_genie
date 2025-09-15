import 'package:flutter/material.dart';

class ImagePickerButton extends StatelessWidget {
  final void Function(String) onImageSelected;

  const ImagePickerButton({
    super.key,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _pickImage,
      icon: const Icon(Icons.image),
      tooltip: 'Pick image',
    );
  }

  void _pickImage() {
    // TODO: Implement actual image picking
    // For now, use a dummy path
    const dummyPath = '/path/to/selected/image.jpg';
    onImageSelected(dummyPath);
  }
}
