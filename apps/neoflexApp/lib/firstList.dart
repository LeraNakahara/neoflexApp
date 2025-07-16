import 'package:flutter/material.dart';
import 'auth_panel.dart';

class FirstListScreen extends StatefulWidget {
  final Widget holidayScreen;

  const FirstListScreen({
    super.key,
    required this.holidayScreen,
  });

  @override
  State<FirstListScreen> createState() => _FirstListScreenState();
}

class _FirstListScreenState extends State<FirstListScreen> {
  late final AuthPanelController _authPanelController;

  @override
  void initState() {
    super.initState();
    _authPanelController = AuthPanelController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authPanelController.open();
    });
  }

  @override
  void dispose() {
    _authPanelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.holidayScreen,
          AuthPanel(
            controller: _authPanelController,
            onLoginSuccess: (_) => _authPanelController.close(),
          ),
        ],
      ),
    );
  }
}