// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
import 'package:flavorfusion/shared/colors.dart';
import 'package:flavorfusion/shared/components.dart';
import 'package:flavorfusion/shared/cubit/category_cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategory extends StatefulWidget {
  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CategoryCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: carrebianCurrent,
            centerTitle: true,
            toolbarHeight: 80,
            iconTheme: IconThemeData(color: lavendarBlush),
            title: Text(
              "Add Category",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.87,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Image.asset("assets/images/add.png")),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
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
                    ]),
              ),
            ),
          ),
          bottomNavigationBar: defaultbottomNav(
              context: context,
              text: "Add Category",
              function: () {
                cubit.addCategory(name: nameController.text, context: context);
                cubit.getCategories();
                setState(() {});
                Navigator.pop(context);
              }),
        );
      },
    );
  }
}
