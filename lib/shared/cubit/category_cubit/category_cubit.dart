import 'package:flavorfusion/models/categories_model.dart';
import 'package:flavorfusion/shared/colors.dart';
import 'package:flavorfusion/shared/components.dart';
import 'package:flavorfusion/shared/networks/remote/dio_helper.dart';
import 'package:flavorfusion/shared/networks/remote/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial()) {
    getCategories();
  }
  static CategoryCubit get(context) => BlocProvider.of(context);

  List<Category>? categories;

  void getCategories() {
    emit(GetCategoriesLoadingState());
    DioHelper.getData(
      url: EndPoints.categories,
    ).then((value) {
      categories = (value.data as List)
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList();
      emit(GetCategoriesSuccessState());
    });
  }

  void addCategory({
    required String name,
    required BuildContext context,
  }) {
    emit(AddCategoryLoadingState());
    DioHelper.postData(
      url: EndPoints.addCaetgory,
      data: {
        "name": name,
      },
    ).then((value) {
      showCustomSnackBar(
          context, value.data["message"].toString(), Colors.green);
    }).catchError((error) {
      showCustomSnackBar(context, error.toString(), Colors.red);
    });
  }
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function onSubmit,
  required Function validate,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
        validator: (value) {
          return validate(value);
        },
        controller: controller,
        keyboardType: type,
        enabled: isClickable,
        obscureText: isPassword,
        onFieldSubmitted: (s) {
          onSubmit();
        },
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black, // Set the text color here
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 16, color: raisinBlack),
          prefixIcon: Icon(
            prefix,
            color: carrebianCurrent,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  icon: Icon(
                    suffix,
                    color: carrebianCurrent,
                  ),
                  onPressed: () {
                    suffixPressed!();
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      const SizedBox(height: 5),
    ],
  );
}

