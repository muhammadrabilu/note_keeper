import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_keeper/views/screens/add_note/AddNoteScreen.dart';
import 'package:note_keeper/views/screens/search/search_screen.dart';
import 'package:note_keeper/views/theme/colors.dart';

import '../../../data/model/Note.dart';
import '../../widgets/my_custom_app_bar.dart';
import 'item_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Note deletedNoted;

  final image = Image.asset('images/empty_image.svg');

  @override
  Widget build(BuildContext mainContext) {
    final itemViewModel = BlocProvider.of<ItemsViewModel>(context);
    return BlocBuilder<ItemsViewModel, List<Note>>(
      builder: (context, items) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => {
                Navigator.push(
                  mainContext,
                  MaterialPageRoute(
                    builder: (context) => AddNoteScreen(),
                  ),
                )
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: Container(
              color: Colors.white70,
              child: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                        delegate: MyCustomAppBar(
                      appBar: Padding(
                        padding: const EdgeInsets.only(
                            top: 32.0, left: 32.0, right: 32.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Notes",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                MyAppBarIcon(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  icon: Icons.search,
                                  tab: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchScreen()));
                                  },
                                ),
                                MyAppBarIcon(
                                  padding: const EdgeInsets.only(right: 0),
                                  icon: Icons.info_outline,
                                  tab: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                  "Designed by -  Some one on Figma"),
                                              Text(
                                                  "Built by - Muhammad Rabilu"),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                    if (1 == 1)
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Dismissible(
                            key: Key(items[index].id.toString()),
                            direction: DismissDirection.endToStart,
                            background: Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, left: 32.0, right: 32.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onDismissed: (_) {
                              deletedNoted = items[index];
                              itemViewModel.deleteNote(items[index]);
                              ScaffoldMessenger.of(mainContext).showSnackBar(
                                SnackBar(
                                  content: const Text("item deleted"),
                                  action: SnackBarAction(
                                      label: "Undo",
                                      onPressed: () {
                                        itemViewModel.addNote(deletedNoted);
                                      }),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 32.0, right: 32.0),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(32),
                                      color: colors[
                                          Random().nextInt(colors.length)],
                                      child: Text(
                                          style:
                                              const TextStyle(fontSize: 25.0),
                                          "${items[index].title} id: ${items[index].id}"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }, childCount: items.length),
                      )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
