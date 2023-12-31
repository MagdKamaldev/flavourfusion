part of 'category_cubit.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

class GetCategoriesLoadingState extends CategoryState{}

class GetCategoriesSuccessState extends CategoryState{}

class GetCategoriesErrorState extends CategoryState{}

class AddCategoryLoadingState extends CategoryState{}

class AddCategorySuccessState extends CategoryState{}

class AddCategoryErrorState extends CategoryState{}

class StoryImagePickedFromGallerySuccessState extends CategoryState{}

class StoryImagePickedFromGalleryErrorState extends CategoryState{}

class StoryImagePickedFromCameraSuccessState extends CategoryState{}

class StoryImagePickedFromCameraErrorState extends CategoryState{}

class DeleteItemLoadingState extends CategoryState{}

class DeleteItemSuccessState extends CategoryState{}

class DeleteItemErrorState extends CategoryState{}
