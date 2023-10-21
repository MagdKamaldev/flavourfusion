// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flavorfusion/models/categories_model.dart';
import 'package:flavorfusion/shared/colors.dart';
import 'package:flavorfusion/shared/networks/remote/dio_helper.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final Item item;
  ItemDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: lavendarBlush),
        title: Text(
          item.name,
          style: theme.bodyLarge,
        ),
      ),
      body: Column(children: [
        if (item.imageUrl != "")
          SizedBox(
            height: size.height * 0.4,
            width: double.infinity,
            child: Image.network(
              "$serverIp/${item.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
        if (item.imageUrl == "")
          SizedBox(
            height: size.height * 0.4,
            width: double.infinity,
            child: Image.asset(
              "assets/images/gallery.png",
              fit: BoxFit.contain,
            ),
          ),
        if (item.imageUrl == "")
          Container(
            width: double.infinity,
            height: 4,
            color: raisinBlack,
          ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: raisinBlack, width: 2),
                ),
                child: Center(
                    child: SizedBox(
                  width: size.width * 0.8,
                  child: Row(
                    children: [
                      Text(
                        "Price",
                        style: theme.bodyLarge!.copyWith(color: raisinBlack),
                      ),
                      const Spacer(),
                      Text(
                        item.price.toString(),
                        style: theme.bodyLarge!.copyWith(color: raisinBlack),
                      ),
                    ],
                  ),
                )),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                width: double.infinity,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: raisinBlack, width: 2),
                ),
                child: SizedBox(
                  width: size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description ",
                          style: theme.bodyLarge!.copyWith(color: raisinBlack),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          item.description,
                          style: theme.bodyLarge!
                              .copyWith(color: raisinBlack, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
