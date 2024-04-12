import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_keeper/data/model/Note.dart';
import 'package:note_keeper/views/screens/home/item_view_model.dart';

import '../../theme/colors.dart';
import '../../widgets/my_custom_app_bar.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final query = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final itemViewModel = BlocProvider.of<ItemsViewModel>(context);
    return PopScope(
      onPopInvoked: (didPop) {
        itemViewModel.getAllData(query: "");
      },
      child: BlocBuilder<ItemsViewModel, List<Note>>(builder: (context, items) {
        query.addListener(() {
          itemViewModel.getAllData(query: query.text);
        });

        return Scaffold(
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
                    child: SearchBar(
                      controller: query,
                      hintText: "Search by the keyword....",
                      trailing: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.close),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return SizedBox(
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
                              color: colors[Random().nextInt(colors.length)],
                              child: Text(
                                  style: const TextStyle(fontSize: 25.0),
                                  "${items[index].title} id: ${items[index].id}"),
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
      }),
    );
  }
}
