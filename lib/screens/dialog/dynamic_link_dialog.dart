import 'package:flutter/material.dart';

class DynamicLinkDialog extends StatefulWidget {
  final String dynamicLink;
  const DynamicLinkDialog({Key? key, this.dynamicLink = ""}) : super(key: key);

  @override
  State<DynamicLinkDialog> createState() => _DynamicLinkDialogState();
}

class _DynamicLinkDialogState extends State<DynamicLinkDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              widget.dynamicLink,
            ),
          ),
        ),
      ),
    );
  }
}
