// ignore_for_file: avoid_print
import 'dart:io';
import 'package:image/image.dart';

void main() async {
  final file = File('assets/images/Logo.png');
  if (!file.existsSync()) {
    print('Logo.png not found');
    return;
  }
  
  final bytes = await file.readAsBytes();
  var img = decodeImage(bytes);
  if (img == null) return;
  
  // Find bounding box for non-white pixels
  int minX = img.width;
  int minY = img.height;
  int maxX = 0;
  int maxY = 0;
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      final pixel = img.getPixel(x, y);
      // Check if pixel is NOT white (with some tolerance for JPEG/compression artifacts)
      if (pixel.r < 240 || pixel.g < 240 || pixel.b < 240) {
        if (x < minX) minX = x;
        if (x > maxX) maxX = x;
        if (y < minY) minY = y;
        if (y > maxY) maxY = y;
      }
    }
  }
  
  if (maxX >= minX && maxY >= minY) {
    // Make sure the cropped area is a square so the logo isn't squished
    int width = maxX - minX + 1;
    int height = maxY - minY + 1;
    int size = width > height ? width : height;
    
    int newMinX = minX - (size - width) ~/ 2;
    int newMinY = minY - (size - height) ~/ 2;
    
    // Completely remove any padding so the logo fills the icon space
    // Let's add 0 padding this time to make it maximum size.
    final cropped = copyCrop(
      img, 
      x: newMinX, 
      y: newMinY, 
      width: size, 
      height: size,
    );
    
    final outFile = File('assets/images/Logo_cropped.png');
    await outFile.writeAsBytes(encodePng(cropped));
    print('Cropped successfully: ${outFile.path}. Bounding box: $minX, $minY to $maxX, $maxY');
  } else {
    print('Image is completely white');
  }
}
