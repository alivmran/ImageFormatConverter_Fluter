# Image Format Converter

A lightweight, pure Dart package that automatically intercepts and converts unsupported image formats (like JPEG, WebP, GIF) into standardized PNG or JPEG files. 

Perfect for applications that require strict image format uploads without needing complex platform-specific (iOS/Android) native code.

## Features

* Convert any supported image format to **PNG**.
* Convert any supported image format to **JPEG** (with adjustable quality).
* Pure Dart implementation (No platform channels required).
* Graceful error handling for corrupted or unsupported files.

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  image_format_converter: ^0.0.3