import 'dart:math';
import 'package:flutter/material.dart';

class ParticleBackground extends StatefulWidget {
  const ParticleBackground({super.key});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  final List<Particle> _particles = [];
  final int _particleCount = 80;
  Offset _mousePosition = Offset.zero;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        _updateParticles();
      })..repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initParticles();
    });
  }

  void _initParticles() {
    final size = MediaQuery.of(context).size;
    for (int i = 0; i < _particleCount; i++) {
      _particles.add(Particle(
        position: Offset(
          _random.nextDouble() * size.width,
          _random.nextDouble() * size.height,
        ),
        velocity: Offset(
          (_random.nextDouble() - 0.5) * 2,
          (_random.nextDouble() - 0.5) * 2,
        ),
        radius: _random.nextDouble() * 3 + 1,
        color: _getRandomColor(),
        opacity: _random.nextDouble() * 0.5 + 0.1,
      ));
    }
  }

  Color _getRandomColor() {
    const colors = [
      Color(0xFF36D1DC),
      Color(0xFFB24592),
      Color(0xFFF2709C),
    ];
    return colors[_random.nextInt(colors.length)];
  }

  void _updateParticles() {
    final size = MediaQuery.of(context).size;
    if (size.width == 0 || size.height == 0) return;

    for (var particle in _particles) {
      particle.position += particle.velocity * 0.5;

      // Wrap around screen
      if (particle.position.dx < 0) particle.position = Offset(size.width, particle.position.dy);
      if (particle.position.dx > size.width) particle.position = Offset(0, particle.position.dy);
      if (particle.position.dy < 0) particle.position = Offset(particle.position.dx, size.height);
      if (particle.position.dy > size.height) particle.position = Offset(particle.position.dx, 0);
    }
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        _mousePosition = event.localPosition;
        _isHovering = true;
      },
      onExit: (_) {
        _isHovering = false;
      },
      child: GestureDetector(
        onTapDown: (details) {
          _pushParticles(details.localPosition);
        },
        child: CustomPaint(
          painter: ParticlePainter(
            particles: _particles,
            mousePosition: _mousePosition,
            isHovering: _isHovering,
          ),
          child: Container(),
        ),
      ),
    );
  }

  void _pushParticles(Offset position) {
    for (int i = 0; i < 4; i++) {
      _particles.add(Particle(
        position: position,
        velocity: Offset(
          (_random.nextDouble() - 0.5) * 4,
          (_random.nextDouble() - 0.5) * 4,
        ),
        radius: _random.nextDouble() * 3 + 1,
        color: _getRandomColor(),
        opacity: _random.nextDouble() * 0.5 + 0.1,
      ));
    }
    // Limit particle count to avoid performance issues
    if (_particles.length > 200) {
      _particles.removeRange(0, _particles.length - 200);
    }
  }
}

class Particle {
  Offset position;
  Offset velocity;
  double radius;
  Color color;
  double opacity;

  Particle({
    required this.position,
    required this.velocity,
    required this.radius,
    required this.color,
    required this.opacity,
  });
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final Offset mousePosition;
  final bool isHovering;

  ParticlePainter({
    required this.particles,
    required this.mousePosition,
    required this.isHovering,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final linePaint = Paint()..strokeWidth = 1;

    for (int i = 0; i < particles.length; i++) {
      final p1 = particles[i];

      // Draw particle
      paint.color = p1.color.withOpacity(p1.opacity);
      canvas.drawCircle(p1.position, p1.radius, paint);

      // Lines between particles
      for (int j = i + 1; j < particles.length; j++) {
        final p2 = particles[j];
        final distance = (p1.position - p2.position).distance;

        if (distance < 150) {
          final opacity = (1 - (distance / 150)) * 0.2;
          linePaint.color = const Color(0xFF36D1DC).withOpacity(opacity);
          canvas.drawLine(p1.position, p2.position, linePaint);
        }
      }

      // Interaction with mouse (Grab effect)
      if (isHovering) {
        final mouseDistance = (p1.position - mousePosition).distance;
        if (mouseDistance < 200) {
          final opacity = (1 - (mouseDistance / 200)) * 0.5;
          linePaint.color = const Color(0xFF36D1DC).withOpacity(opacity);
          canvas.drawLine(p1.position, mousePosition, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
