import 'package:flutter/material.dart';
import 'auth_panel.dart';

class FirstListScreen extends StatefulWidget {
  final Widget holidayScreen;
  final DateTime selectedDate;

  const FirstListScreen({
    super.key,
    required this.holidayScreen,
    required this.selectedDate,
  });

  @override
  State<FirstListScreen> createState() => _FirstListScreenState();
}

class _FirstListScreenState extends State<FirstListScreen>
    with SingleTickerProviderStateMixin {
  late final AuthPanelController _authPanelController;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  bool _showAuthPanel = false;
  bool _isInitialShow = true;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _showInitialAuthPanel();
  }

  @override
  void didUpdateWidget(FirstListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      _showAuthPanelAfterDateChange();
    }
  }

  void _initAnimations() {
    _authPanelController = AuthPanelController();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutQuart,
      ),
    );
  }

  Future<void> _showInitialAuthPanel() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _showAuthPanel = true;
        _isInitialShow = false;
      });
      _authPanelController.open();
      _animationController.forward();
    }
  }

  Future<void> _showAuthPanelAfterDateChange() async {
    _animationController.reverse();
    setState(() => _showAuthPanel = false);

    await Future.delayed(_animationController.duration!);

    if (mounted) {
      setState(() => _showAuthPanel = true);
      _authPanelController.open();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _authPanelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.holidayScreen,

          if (_showAuthPanel)
            FadeTransition(
              opacity: _opacityAnimation,
              child: GestureDetector(
                onTap: () {
                  setState(() => _showAuthPanel = false);
                  _authPanelController.close();
                  _animationController.reverse();
                },
                child: Container(color: Colors.black),
              ),
            ),

          if (_showAuthPanel)
            SlideTransition(
              position: _slideAnimation,
              child: AuthPanel(
                controller: _authPanelController,
                onLoginSuccess: (_) {
                  setState(() => _showAuthPanel = false);
                  _authPanelController.close();
                  _animationController.reverse();
                },
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!_showAuthPanel) {
            setState(() => _showAuthPanel = true);
            _authPanelController.open();
            _animationController.forward();
          }
        },
        child: const Icon(Icons.login),
      ),
    );
  }
}