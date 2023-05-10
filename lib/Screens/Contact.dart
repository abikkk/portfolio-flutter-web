import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ContactContainer extends StatefulWidget {
  const ContactContainer({Key? key}) : super(key: key);

  @override
  _ContactContainerState createState() => _ContactContainerState();
}

class _ContactContainerState extends State<ContactContainer> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController(),
      messageController = new TextEditingController();
  bool submitClicked = false, isHTML = false;
  String subject = '--';

  List<String> attachments = [];

  Future<void> send() async {
    final Email email = Email(
      body: messageController.text,
      subject: subject,
      recipients: [emailController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }
  void _openImagePicker() async {
    final picker = ImagePicker();
    PickedFile? pick = await picker.getImage(source: ImageSource.gallery);
    if (pick != null) {
      setState(() {
        attachments.add(pick.path);
      });
    }
  }

  void _removeAttachment(int index) {
    setState(() {
      attachments.removeAt(index);
    });
  }

  Future<void> _attachFileFromAppDocumentsDirectoy() async {
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final filePath = appDocumentDir.path + '/file.txt';
      final file = File(filePath);
      await file.writeAsString('Text file in app directory');

      setState(() {
        attachments.add(filePath);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create file in applicion directory'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'contact me',
          style: TextStyle(fontSize: 48),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'your@email.com',
                    ),
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your email!';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: DropdownButton<String>(
                    hint: (subject == '--')
                        ? Text('query type',
                            style: TextStyle(color: Colors.grey))
                        : Text(subject),
                    isExpanded: true,
                    items: <String>[
                      'hire me',
                      'connect with me',
                      'general inquiry',
                      'others'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        subject = val!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'your query'),
                    maxLines: 10,
                    controller: messageController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please your query here!';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: InkWell(
                    onTap: () async {
                      setState(() {
                        submitClicked = !submitClicked;
                      });
                      Future.delayed(const Duration(milliseconds: 150), () {
                        setState(() {
                          submitClicked = !submitClicked;
                        });
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('processing your query')),
                          );
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: !submitClicked
                              ? [
                                  BoxShadow(
                                      color: Colors.grey[500]!,
                                      offset: Offset(4, 4),
                                      blurRadius: 15,
                                      spreadRadius: 1),
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-4, -4),
                                      blurRadius: 15,
                                      spreadRadius: 1)
                                ]
                              : null),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('submit')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
