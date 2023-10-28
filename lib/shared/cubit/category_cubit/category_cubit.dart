// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flavorfusion/models/categories_model.dart';
import 'package:flavorfusion/shared/components.dart';
import 'package:flavorfusion/shared/networks/remote/dio_helper.dart';
import 'package:flavorfusion/shared/networks/remote/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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

  File? storyImage;
  var pickedFile;
  var picker = ImagePicker();

  Future<void> getStoryImagefromGallery(context) async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      storyImage = File(pickedFile.path);
      Navigator.pop(context);
      emit(StoryImagePickedFromGallerySuccessState());
    } else {
      showCustomSnackBar(context, "no image selected", Colors.red);
      emit(StoryImagePickedFromGalleryErrorState());
    }
  }

  Future<void> getStoryImagefromCamera(context) async {
    pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      storyImage = File(pickedFile.path);
      Navigator.pop(context);
      emit(StoryImagePickedFromCameraSuccessState());
    } else {
      showCustomSnackBar(context, "no image selected", Colors.red);
      emit(StoryImagePickedFromCameraErrorState());
    }
  }

  void addItem({
    required String name,
    required double price,
    required String description,
    required int categoryId,
  }) async {
    FormData formData = FormData.fromMap({
      "photos": await MultipartFile.fromFile(pickedFile.path),
      "item": {
        "category_id": categoryId,
        "name": name,
        "price": price,
        "description": description,
      }.toString(),
    });
    await DioHelper.postData(url: EndPoints.registerItem, data: formData)
        .then((value) {})
        .catchError((e) {
      print(e);
    });
  }

  void deleteItem({
    required int id,
    required BuildContext context,
  }) {
    emit(DeleteItemLoadingState());
    DioHelper.postData(
      url: EndPoints.deleteItem,
      data: {
        "id": id,
      },
    ).then((value) {
      showCustomSnackBar(
          context, value.data["message"].toString(), Colors.green);
    }).catchError((error) {
      showCustomSnackBar(context, error.toString(), Colors.red);
    });
  }
}
