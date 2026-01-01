import 'dart:math' as math;
import 'package:flutter/material.dart';

class CrystallineObject extends StatefulWidget {
  const CrystallineObject({super.key});

  @override
  State<CrystallineObject> createState() => _CrystallineObjectState();
}

class _CrystallineObjectState extends State<CrystallineObject> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(400, 400),
          painter: CrystalPainter(rotation: _controller.value * 2 * math.pi),
        );
      },
    );
  }
}

class CrystalPainter extends CustomPainter {
  final double rotation;
  CrystalPainter({required this.rotation});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.4;

    final paint = Paint()
      ..style = PaintingStyle.fill;

    // Define vertices of an octahedron in 3D
    List<List<double>> vertices = [
      [0, 1, 0],   // Top
      [0, -1, 0],  // Bottom
      [1, 0, 0],   // Right
      [-1, 0, 0],  // Left
      [0, 0, 1],   // Front
      [0, 0, -1],  // Back
    ];

    // Rotation matrices
    double cosR = math.cos(rotation);
    double sinR = math.sin(rotation);
    double cosR2 = math.cos(rotation * 0.5);
    double sinR2 = math.sin(rotation * 0.5);

    List<Offset> projected = [];
    for (var v in vertices) {
      // Rotate Y
      double tx = v[0] * cosR - v[2] * sinR;
      double tz = v[0] * sinR + v[2] * cosR;
      double ty = v[1];

      // Rotate X
      double dy = ty * cosR2 - tz * sinR2;
      double dz = ty * sinR2 + tz * cosR2;
      double dx = tx;

      // Perspective projection
      double perspective = 1 / (1 - dz * 0.5);
      projected.add(Offset(
        center.dx + dx * radius * perspective,
        center.dy + dy * radius * perspective,
      ));
    }

    // Define faces (sets of 3 vertices)
    List<List<int>> faces = [
      [0, 2, 4], [0, 4, 3], [0, 3, 5], [0, 5, 2],
      [1, 2, 4], [1, 4, 3], [1, 3, 5], [1, 5, 2],
    ];

    // Sort faces by depth (average Z) for painter's algorithm
    List<Map<String, dynamic>> sortedFaces = [];
    for (var face in faces) {
      double avgZ = 0;
      for (var idx in face) {
        // Recalculate Z for sorting
        double tz = vertices[idx][0] * sinR + vertices[idx][2] * cosR;
        double dz = vertices[idx][1] * sinR2 + tz * cosR2;
        avgZ += dz;
      }
      sortedFaces.add({'face': face, 'z': avgZ / 3});
    }
    sortedFaces.sort((a, b) => a['z'].compareTo(b['z']));

    for (var entry in sortedFaces) {
      List<int> face = entry['face'];
      Path path = Path()
        ..moveTo(projected[face[0]].dx, projected[face[0]].dy)
        ..lineTo(projected[face[1]].dx, projected[face[1]].dy)
        ..lineTo(projected[face[2]].dx, projected[face[2]].dy)
        ..close();

      // Lighting based on Z
      double depth = (entry['z'] + 1) / 2; // 0 to 1
      paint.color = Color(0xFF36D1DC).withOpacity(0.3 + depth * 0.4);
      
      // Add gradient to face
      paint.shader = LinearGradient(
        colors: [
          Color(0xFF36D1DC).withOpacity(0.2 + depth * 0.3),
          Color(0xFFB24592).withOpacity(0.1 + depth * 0.2),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

      canvas.drawPath(path, paint);

      // Draw edges
      final edgePaint = Paint()
        ..color = Color(0xFF36D1DC).withOpacity(0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;
      canvas.drawPath(path, edgePaint);
    }
    
    // Add internal glow
    final glowPaint = Paint()
      ..color = Color(0xFF36D1DC).withOpacity(0.1)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 30);
    canvas.drawCircle(center, radius * 0.8, glowPaint);
  }

  @override
  bool shouldRepaint(CrystalPainter oldDelegate) => oldDelegate.rotation != rotation;
}
