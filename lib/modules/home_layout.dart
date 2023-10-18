import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flavorfusion/models/categories_model.dart';
import 'package:flavorfusion/modules/add_category_screen.dart';
import 'package:flavorfusion/modules/category_screen.dart';
import 'package:flavorfusion/shared/colors.dart';
import 'package:flavorfusion/shared/components.dart';
import 'package:flavorfusion/shared/cubit/category_cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    var cubit = CategoryCubit.get(context);
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: carrebianCurrent,
            centerTitle: true,
            toolbarHeight: 80,
            title: Text(
              "Flavour Fusion",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
          ),
          body: ConditionalBuilder(
            condition: state is! GetCategoriesLoadingState,
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
            builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.015,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Categories",
                    style: theme.bodyLarge!.copyWith(color: raisinBlack),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: size.height * 0.7,
                    child: ListView.separated(
                        itemCount: cubit.categories!.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemBuilder: (context, index) => categoryItem(
                            category: cubit.categories![index],
                            size: size,
                            theme: theme,
                            context: context)),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navigateTo(context, AddCategory());
            },
            backgroundColor: carrebianCurrent,
            child: Icon(
              Icons.add,
              color: lavendarBlush,
            ),
          ),
        );
      },
    );
  }

  Widget categoryItem({
    required Category category,
    required Size size,
    required TextTheme theme,
    required BuildContext context,
  }) =>
      GestureDetector(
        onTap: () {
          navigateTo(context, CategroyScreen(category: category));
        },
        child: Container(
          decoration: BoxDecoration(
              color: carrebianCurrent, borderRadius: BorderRadius.circular(13)),
          height: size.height * 0.08,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                Text(
                  category.name,
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
        ),
      );
}
