import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorPainter extends CustomPainter {
  final Size imageSize;
  final List<Face> faces;
  final bool isReflection;

  const FaceDetectorPainter(
    this.imageSize,
    this.faces, {
    this.isReflection = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.blue;

    for (final face in faces) {
      final faceRect = _reflectionRect(face.boundingBox);
      canvas.drawRect(
        _scaleRect(
          rect: faceRect,
          imageSize: imageSize,
          widgetSize: size,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant FaceDetectorPainter oldDelegate) {
    return oldDelegate.imageSize != imageSize || oldDelegate.faces != faces;
  }

  Rect _reflectionRect(Rect boundingBox) {
    if (isReflection) {
      return boundingBox;
    }
    final centerX = imageSize.width / 2;
    final left = ((boundingBox.left - centerX) * -1) + centerX;
    final right = ((boundingBox.right - centerX) * -1) + centerX;
    return Rect.fromLTRB(left, boundingBox.top, right, boundingBox.bottom);
  }

  Rect _scaleRect({
    required Rect rect,
    required Size imageSize,
    required Size widgetSize,
  }) {
    final scaleX = widgetSize.width / imageSize.width;
    final scaleY = widgetSize.height / imageSize.height;

    final scaledRect = Rect.fromLTRB(
      rect.left.toDouble() * scaleX,
      rect.top.toDouble() * scaleY,
      rect.right.toDouble() * scaleX,
      rect.bottom.toDouble() * scaleY,
    );

    return scaledRect;
  }
}