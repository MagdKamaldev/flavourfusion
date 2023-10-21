// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flavorfusion/models/categories_model.dart';
import 'package:flavorfusion/modules/add_item.dart';
import 'package:flavorfusion/modules/item_details.dart';
import 'package:flavorfusion/shared/colors.dart';
import 'package:flavorfusion/shared/networks/remote/dio_helper.dart';
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
        child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.9,
          children: List.generate(
            category.items.length,
            (index) => item(
                item: category.items[index],
                size: size,
                theme: theme,
                context: context),
          ),
        ),
      ),

      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(context, AddItem(category: category,));
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
      GestureDetector(
        onTap: () {
          navigateTo(context, ItemDetails(item: item,));
        },
        child: Container(
          decoration: BoxDecoration(
              color: carrebianCurrent, borderRadius: BorderRadius.circular(13)),
          height: size.height * 0.1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: theme.bodyLarge!.copyWith(fontSize: 18),
                ),
                if (item.imageUrl != "") const Spacer(),
                if (item.imageUrl != "")
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: SizedBox(
                        height: size.height * 0.14,
                        width: size.width * 0.33,
                        child: Image.network(
                          "$serverIp/${item.imageUrl}",
                          fit: BoxFit.cover,
                        )),
                  ),
                if (item.imageUrl == "") const Spacer(),
                if (item.imageUrl == "")
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: SizedBox(
                        height: size.height * 0.14,
                        width: size.width * 0.33,
                        child: Image.asset(
                          "assets/images/gallery.png",
                          fit: BoxFit.cover,
                        )),
                  ),
              ],
            ),
          ),
        ),
      );
}
