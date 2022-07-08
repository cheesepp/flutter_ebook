import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_book/services/resource_service.dart';
import 'package:get/get.dart';

class ResourceSection extends StatefulWidget {
  ResourceSection({Key? key, required this.onClick, required this.resourceName})
      : super(key: key);
  String resourceName;
  Function(String text) onClick;

  @override
  State<ResourceSection> createState() => _ResourceSectionState();
}

final resources = ResourceService().getMap() ??
    {
      "Firebase": "https://ebook-mockdata-default-rtdb.firebaseio.com/",
      "Fahasa": "https://test-fd89c-default-rtdb.firebaseio.com/",
    };
String currentName =
    ResourceService().getResourceName() ?? resources.keys.first;

class _ResourceSectionState extends State<ResourceSection> {
  final resourceNameController = TextEditingController();
  final resourceController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    resourceNameController.dispose();
    resourceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'setting_resource'.tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ExpansionTile(title: Text(currentName), children: [
            ...resources.entries
                .map((entry) => GestureDetector(
                      onLongPress: () {
                        setState(() {
                          resources.remove(entry);
                        });
                      },
                      child: ListTile(
                          title: Text(entry.key),
                          trailing: Radio(
                              value: entry.key,
                              groupValue: currentName,
                              onChanged: (newValue) {
                                // widget.onClick('vi');
                                setState(() {
                                  currentName = entry.key;
                                  ResourceService()
                                      .setResourceName(currentName);
                                  ResourceService().setResourcce(entry.value);
                                  print(entry.value);
                                });
                              }),
                          onTap: () {
                            // widget.onClick('vi');
                            setState(() {
                              currentName = entry.key;
                              ResourceService().setResourceName(currentName);
                              ResourceService().setResourcce(entry.value);
                              print(entry.value);
                            });
                          }),
                    ))
                .toList(),
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Add Task',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      autofocus: true,
                                      controller: resourceNameController,
                                      decoration: const InputDecoration(
                                          label: Text('Resource'),
                                          border: OutlineInputBorder()),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    TextField(
                                      autofocus: true,
                                      controller: resourceController,
                                      minLines: 3,
                                      maxLines: 5,
                                      decoration: const InputDecoration(
                                          label: Text('Domain'),
                                          border: OutlineInputBorder()),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('cancel'),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          var task = {
                                            resourceNameController.text:
                                                resourceController.text
                                          };
                                          setState(() {
                                            resources.addAll(task);
                                            ResourceService()
                                                .setMap(jsonEncode(resources));
                                          });

                                          Navigator.pop(context);
                                        },
                                        child: const Text('Add'))
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
                child: Text('Add Resource')),
          ]),
        ],
      ),
    );
  }
}
