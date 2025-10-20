import 'package:flutter/material.dart';
import '../models/snippet.dart';

/// スニペット表示用のボタンWidget
class SnippetButton extends StatefulWidget {
  final Snippet snippet;
  final VoidCallback onTap;
  final bool isActive;

  const SnippetButton({
    super.key,
    required this.snippet,
    required this.onTap,
    this.isActive = false,
  });

  @override
  State<SnippetButton> createState() => _SnippetButtonState();
}

class _SnippetButtonState extends State<SnippetButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: widget.isActive
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF4A90E2),
                    const Color(0xFF357ABD),
                  ],
                )
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.grey.shade50,
                  ],
                ),
          boxShadow: [
            BoxShadow(
              color: widget.isActive
                  ? const Color(0xFF4A90E2).withOpacity(0.4)
                  : Colors.black.withOpacity(0.08),
              blurRadius: widget.isActive ? 12 : 8,
              offset: Offset(0, widget.isActive ? 4 : 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              _controller.forward().then((_) => _controller.reverse());
              widget.onTap();
            },
            onTapDown: (_) {
              setState(() => _isPressed = true);
              _controller.forward();
            },
            onTapUp: (_) {
              setState(() => _isPressed = false);
              _controller.reverse();
            },
            onTapCancel: () {
              setState(() => _isPressed = false);
              _controller.reverse();
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.isActive)
                      Icon(
                        Icons.volume_up,
                        color: Colors.white,
                        size: 20,
                      ),
                    if (widget.isActive) const SizedBox(height: 4),
                    Flexible(
                      child: Text(
                        widget.snippet.text,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: widget.isActive ? Colors.white : Colors.black87,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
