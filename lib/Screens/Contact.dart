import 'package:flutter/material.dart';

class ContactContainer extends StatefulWidget {
  const ContactContainer({Key? key}) : super(key: key);

  @override
  _ContactContainerState createState() => _ContactContainerState();
}

class _ContactContainerState extends State<ContactContainer> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController(),
      // queryType = new TextEditingController(),
      messageController = new TextEditingController();
  bool submitClicked = false;
  String queryType = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height / 1.11) - 10,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          Expanded(
              child: Center(
            child: Text(
              'contact me',
              style: TextStyle(fontSize: 48),
            ),
          )),
          Expanded(
            flex: 3,
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'your email'),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DropdownButton<String>(
                        hint: (queryType == null)
                            ? Text('query typs',
                                style: TextStyle(color: Colors.black))
                            : Text(queryType),
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
                            queryType = val!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'your query'),
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              submitClicked = !submitClicked;
                            });
                            Future.delayed(const Duration(milliseconds: 150),
                                () {
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
            ),
          ),
        ],
      ),
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
