import 'dart:io';
import 'dart:typed_data';
import 'package:image_format_converter/image_format_converter.dart';

void main() {
  print('--- Image Format Converter Example ---');

  // For this example to run locally, you would need a 'test_image.jpg'
  // in the same directory, but pub.dev just checks if this file exists and is valid Dart.
  final testFile = File('test_image.jpg');

  if (!testFile.existsSync()) {
    print('Please provide a test_image.jpg to run this example.');
    return;
  }

  // 1. Read the file
  final Uint8List originalBytes = testFile.readAsBytesSync();

  // 2. Convert to PNG
  print('Attempting to convert to PNG...');
  final Uint8List? pngBytes = ImageFormatConverter.convertToPng(originalBytes);

  if (pngBytes != null) {
    // 3. Save the result
    final outputFile = File('converted_result.png');
    outputFile.writeAsBytesSync(pngBytes);
    print('Success! Image converted and saved to ${outputFile.path}');
  } else {
    print('Failed to convert the image.');
  }
}
