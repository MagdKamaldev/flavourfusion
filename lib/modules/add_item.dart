// ignore_for_file: must_be_immutable, use_key_in_widget_constructors
import 'package:flavorfusion/shared/colors.dart';
import 'package:flavorfusion/shared/components.dart';
import 'package:flavorfusion/shared/cubit/category_cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItem extends StatefulWidget {
  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  var nameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CategoryCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: lavendarBlush),
            title: Text(
              "Add Item",
              style: theme.bodyLarge,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.87,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Image.asset("assets/images/add.png")),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        "Name",
                        style: theme.bodyLarge!.copyWith(color: raisinBlack),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          onSubmit: () {},
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "field is required";
                            }
                          },
                          label: "name",
                          prefix: Icons.person,
                          context: context),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      Text(
                        "Image",
                        style: theme.bodyLarge!.copyWith(color: raisinBlack),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                " Choose an Option",
                              ),
                              content: SizedBox(
                                width: 70,
                                height: 70,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        CategoryCubit.get(context)
                                            .getStoryImagefromGallery(context);
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              width: size.width * 0.07,
                                              height: size.height * 0.034,
                                              child: Image.asset(
                                                  "assets/images/gallery.png")),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Text(
                                            "Gallery",
                                            style:
                                                TextStyle(color: raisinBlack),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "or",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.grey[600]),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        CategoryCubit.get(context)
                                            .getStoryImagefromCamera(context);
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              width: size.width * 0.07,
                                              height: size.height * 0.036,
                                              child: Image.asset(
                                                  "assets/images/camera.png")),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Text(
                                            "Camera",
                                            style:
                                                TextStyle(color: raisinBlack),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: raisinBlack, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              'Add +',
                              style: theme.bodyLarge!
                                  .copyWith(color: raisinBlack, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
          bottomNavigationBar: defaultbottomNav(
              context: context,
              text: "Add Item",
              function: () {
                cubit.addItem(
                    name: nameController.text, price: 20, description: "good");
                cubit.getCategories();
                setState(() {});
                Navigator.pop(context);
              }),
        );
      },
    );
  }
}
