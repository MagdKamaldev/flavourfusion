// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flavorfusion/models/categories_model.dart';
import 'package:flavorfusion/modules/add_item.dart';
import 'package:flavorfusion/shared/colors.dart';
import 'package:flutter/material.dart';
import '../shared/components.dart';

class CategroyScreen extends StatelessWidget {
  final Category category;

  CategroyScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: lavendarBlush),
        title: Text(
          category.name,
          style: theme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: size.height * 0.02,
          ),
          itemBuilder: (context, index) => item(
              item: category.items[index],
              size: size,
              theme: theme,
              context: context),
          itemCount: category.items.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(context, AddItem());
        },
        backgroundColor: carrebianCurrent,
        child: Icon(
          Icons.add,
          color: lavendarBlush,
        ),
      ),
    );
  }

  Widget item({
    required Item item,
    required Size size,
    required TextTheme theme,
    required BuildContext context,
  }) =>
      Container(
        decoration: BoxDecoration(
            color: carrebianCurrent, borderRadius: BorderRadius.circular(13)),
        height: size.height * 0.08,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            children: [
              Text(
                item.name,
                style: theme.bodyLarge,
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: lavendarBlush,
              )
            ],
          ),
        ),
      );
}
