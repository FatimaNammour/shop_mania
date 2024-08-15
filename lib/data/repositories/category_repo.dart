import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shop_mania/core/constant/request_routes.dart';

import '../../core/dio/exceptions.dart';
import '../models/category_model.dart';

class CategoryRepository {
  Dio dio;
  CategoryRepository({required this.dio});

  Future<Category?> getSingleCategory({required String categoryName}) async {
    try {
      final result = await dio.get(
        RequestRoutes.categories + categoryName,
      );

      return Category.fromJson(result.data);
    } catch (error) {
      log(error.toString());
      throw ExceptionHandler(error);
    }
  }

  Future<List<Category>?> getAllCategories() async {
    try {
      final result = await dio.get(
        RequestRoutes.categories,
      );

      return Category.fromList(result.data["data"]);
    } catch (error) {
      log(error.toString());
      throw ExceptionHandler(error);
    }
  }

  Future<Category> addCategory({required String categoryName}) async {
    try {
      final result = await dio
          .post(RequestRoutes.categories, data: {"name": categoryName});

      return Category.fromJson(result.data["data"]);
    } catch (error) {
      log(error.toString());
      throw ExceptionHandler(error);
    }
  }

  Future<Category> updateCategory(
      {required String categoryNewName, required String categoryName}) async {
    try {
      final result = await dio.put(RequestRoutes.categories + categoryName,
          data: {"name": categoryNewName});

      return Category.fromJson(result.data["data"]);
    } catch (error) {
      log(error.toString());
      throw ExceptionHandler(error);
    }
  }

  Future<void> deleteCategory({required String categoryName}) async {
    try {
      await dio.delete(RequestRoutes.categories + categoryName);
    } catch (error) {
      log(error.toString());
      throw ExceptionHandler(error);
    }
  }
}
