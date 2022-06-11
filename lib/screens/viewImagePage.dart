
import 'package:flutter/material.dart';

class ViewImagePage extends StatefulWidget {
  final String imageSrc;

  const ViewImagePage({
    Key? key,
    required this.imageSrc,
  }) : super(key: key);

  @override
  State<ViewImagePage> createState() => _ViewImagePageState();
}

class _ViewImagePageState extends State<ViewImagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: new Image.network(
      widget.imageSrc,
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    ));
  }
}
