import 'dart:io';
import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:image/image.dart' as img;
import 'package:image_format_converter/image_format_converter.dart';

void main() {
  group('ImageFormatConverter', () {
    Uint8List createDummyJpeg() {
      final image = img.Image(width: 10, height: 10);
      img.fill(image, color: img.ColorRgb8(255, 0, 0));
      return img.encodeJpg(image);
    }

    test('convertToPng: Successfully converts a valid JPEG to PNG', () {
      final jpegBytes = createDummyJpeg();
      final pngBytes = ImageFormatConverter.convertToPng(jpegBytes);

      expect(pngBytes, isNotNull);

      final decodedPng = img.PngDecoder().decode(pngBytes!);
      expect(decodedPng, isNotNull);
    });

    test('convertToJpeg: Successfully converts a valid image to JPEG', () {
      final sourceBytes = createDummyJpeg();
      final newJpegBytes = ImageFormatConverter.convertToJpeg(
        sourceBytes,
        quality: 50,
      );

      expect(newJpegBytes, isNotNull);
    });

    test(
      'convertToPng: Returns null when provided with corrupted/invalid bytes',
      () {
        final invalidBytes = Uint8List.fromList([1, 2, 3, 4, 5, 99, 100]);
        final result = ImageFormatConverter.convertToPng(invalidBytes);

        expect(result, isNull);
      },
    );

    test(
      'convertToPng: Successfully converts an actual JPEG file from disk',
      () {
        final inputFile = File('test/assets/sample.jpg');
        expect(inputFile.existsSync(), isTrue);

        final Uint8List realImageBytes = inputFile.readAsBytesSync();
        final Uint8List? pngBytes = ImageFormatConverter.convertToPng(
          realImageBytes,
        );

        expect(pngBytes, isNotNull);

        if (pngBytes != null) {
          final outputFile = File('test/assets/converted_result.png');
          outputFile.writeAsBytesSync(pngBytes);
          // Removed the print statement here
        }
      },
    );
  });
}
