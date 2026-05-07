// ignore_for_file: avoid_print
import 'dart:io';
import 'package:image/image.dart';

void main() async {
  final bytes = await File('assets/images/Logo_cropped.png').readAsBytes();
  var img = decodeImage(bytes);
  if (img == null) {
    print('Failed to decode image');
    return;
  }
  
  // Make sure image has an alpha channel
  if (img.hasPalette) {
    img = img.convert(numChannels: 4);
  }

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      final p = img.getPixel(x, y);
      num r = p.r;
      num g = p.g;
      num b = p.b;
      
      // If the pixel is very close to white (all channels high)
      if (r > 200 && g > 200 && b > 200) {
        // Calculate the maximum color channel
        num maxC = r;
        if (g > maxC) maxC = g;
        if (b > maxC) maxC = b;
        
        // Smoothly map bright pixels to transparency for anti-aliasing
        // 200 -> 255 alpha (opaque), 255 -> 0 alpha (transparent)
        num alpha = 255 - ((maxC - 200) * 255 / 55);
        if (alpha < 0) alpha = 0;
        if (alpha > 255) alpha = 255;
        
        p.a = alpha;
      }
    }
  }
  
  await File('assets/images/Logo_transparent.png').writeAsBytes(encodePng(img));
  print('Saved Logo_transparent.png successfully!');
}
