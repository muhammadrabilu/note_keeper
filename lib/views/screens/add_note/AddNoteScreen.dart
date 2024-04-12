import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_keeper/data/model/Note.dart';
import 'package:note_keeper/views/screens/home/item_view_model.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});

  final title = TextEditingController();
  final note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final itemViewModel = BlocProvider.of<ItemsViewModel>(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyAppBarIcon(
                  padding: const EdgeInsets.only(left: 16),
                  icon: Icons.navigate_before,
                  tab: () {
                    Navigator.pop(context);
                  },
                ),
                Row(
                  children: [
                    MyAppBarIcon(
                      padding: const EdgeInsets.only(right: 16),
                      icon: Icons.visibility,
                      tab: () {},
                    ),
                    MyAppBarIcon(
                      padding: const EdgeInsets.only(right: 16),
                      icon: Icons.save,
                      tab: () {
                        if (title.text.isNotEmpty && note.text.isNotEmpty) {
                          itemViewModel.addNote(
                            Note(title: title.text, note: note.text),
                          );
                          Navigator.pop(context);
                        } else {
                          Fluttertoast.showToast(
                              msg: "title or note is empty!",
                              toastLength: Toast.LENGTH_LONG);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            Material(
              child: Column(
                children: [
                  TextField(
                    maxLines: null,
                    minLines: null,
                    controller: title,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                        hintText: "Title...",
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 32),
                        contentPadding: EdgeInsets.all(16)),
                  ),
                  TextField(
                    style: const TextStyle(fontSize: 20),
                    maxLines: null,
                    minLines: null,
                    controller: note,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                        hintText: "Type something...",
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 20),
                        contentPadding: EdgeInsets.all(16)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyAppBarIcon extends StatelessWidget {
  const MyAppBarIcon(
      {super.key, required this.icon, required this.tab, this.padding});

  final IconData icon;

  final VoidCallback tab;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => tab(),
      child: Padding(
        padding: padding != null ? padding! : EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            color: Colors.black12,
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
