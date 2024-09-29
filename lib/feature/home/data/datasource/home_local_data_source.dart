import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/storage/storage_handler.dart';
import '../models/categories_model.dart';
import '../models/mostsale_model.dart';
import '../models/sliders_model.dart';

abstract class HomeLocalDataSource {
  Future<List<CategoriesModel>> getAllCategoriesCached();
  Future<List<SlidersModel>> getAllSlidersCached();
  Future<List<MostSaleModel>> getAllMostSaleCached();
  Future<Unit> cacheCategories(List<CategoriesModel> categories);
  Future<Unit> cacheSliders(List<SlidersModel> entities);
  Future<Unit> cacheMostsale(List<MostSaleModel> most);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<Unit> cacheCategories(List<CategoriesModel> categories) {
    List categoriesToJson = categories
        .map<Map<String, dynamic>>(
            (categoriesModel) => categoriesModel.toJson())
        .toList();
    return StorageHandler().storeCategories(categoriesToJson);
  }

  @override
  Future<List<CategoriesModel>> getAllCategoriesCached() {
    String? categoriesCached = StorageHandler().cachedCategories;
    if (categoriesCached != null) {
      List decodeJsonData = json.decode(categoriesCached);
      List<CategoriesModel> jsonToPostModels = decodeJsonData
          .map<CategoriesModel>(
              (jsonPostModel) => CategoriesModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw OnEmptyCacheException();
    }
  }

  @override
  Future<Unit> cacheSliders(List<SlidersModel> entities) {
    List sliderToJson = entities
        .map<Map<String, dynamic>>((entitiesModel) => entitiesModel.toJson())
        .toList();
    return StorageHandler().storeSliders(sliderToJson);
  }

  @override
  Future<List<SlidersModel>> getAllSlidersCached() {
    String? slidersCached = StorageHandler().cachedSliders;
    if (slidersCached != null) {
      List decodeJsonData = json.decode(slidersCached);
      List<SlidersModel> jsonToPostModels = decodeJsonData
          .map<SlidersModel>(
              (jsonPostModel) => SlidersModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw OnEmptyCacheException();
    }
  }

  @override
  Future<Unit> cacheMostsale(List<MostSaleModel> most) {
    List mostsellToJson = most
        .map<Map<String, dynamic>>((mostModel) => mostModel.toJson())
        .toList();
    return StorageHandler().storeMostSale(mostsellToJson);
  }

  @override
  Future<List<MostSaleModel>> getAllMostSaleCached() {
    String? mostSellCached = StorageHandler().cachedMostSale;
    if (mostSellCached != null) {
      List decodeJsonData = json.decode(mostSellCached);
      List<MostSaleModel> jsonToPostModels = decodeJsonData
          .map<MostSaleModel>(
              (jsonPostModel) => MostSaleModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw OnEmptyCacheException();
    }
  }
}
