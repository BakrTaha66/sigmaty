import 'package:flutter/material.dart';
import 'package:sigmaty/Sigmaty/presentation/widgets/notfications/notfications_widget.dart';

class NotficationView extends StatefulWidget {
  const NotficationView({super.key});

  @override
  State<NotficationView> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<NotficationView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: NotficationsWidget());
  }
}
