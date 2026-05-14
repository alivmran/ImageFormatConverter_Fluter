import 'dart:typed_data';
import 'package:image/image.dart' as img;

class ImageFormatConverter {
  /// Converts any supported image format (JPEG, WebP, GIF, etc.) to PNG.
  /// Returns [null] if the image cannot be decoded.
  static Uint8List? convertToPng(Uint8List inputBytes) {
    try {
      img.Image? decodedImage = img.decodeImage(inputBytes);

      if (decodedImage == null) {
        return null; // Silently reject bad data
      }

      return img.encodePng(decodedImage);
    } catch (e) {
      // Removed the print statement for a clean console
      return null;
    }
  }

  /// Converts any supported image format to JPEG.
  /// You can specify the quality (0 to 100).
  static Uint8List? convertToJpeg(Uint8List inputBytes, {int quality = 100}) {
    try {
      img.Image? decodedImage = img.decodeImage(inputBytes);

      if (decodedImage == null) {
        return null; // Silently reject bad data
      }

      return img.encodeJpg(decodedImage, quality: quality);
    } catch (e) {
      // Removed the print statement for a clean console
      return null;
    }
  }
}
