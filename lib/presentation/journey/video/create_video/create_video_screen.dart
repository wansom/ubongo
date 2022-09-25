// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:ubongo/presentation/journey/video/create_video/create_video_constants.dart';

class CreateVideoScreen extends StatefulWidget {
  final Function onCreate;

  const CreateVideoScreen({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  _CreateVideoScreenState createState() => _CreateVideoScreenState();
}

class _CreateVideoScreenState extends State<CreateVideoScreen> {
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) => Scaffold(
        appBar: AppBar(
          title: const Text('Create Video'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  key: CreateVideoConstants.descriptionFieldKey,
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                key: CreateVideoConstants.createVideoButton,
                onPressed: () {
                  widget.onCreate(descriptionController.text);
                },
                child: const Text('Create'),
              )
            ],
          ),
        ),
      );
}
