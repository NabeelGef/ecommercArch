import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../strings/words.dart';

class StorageHandler {
  StorageHandler._();
  static StorageHandler? _instance;
  factory StorageHandler() => _instance ??= StorageHandler._();
  static String language = "English";
  late SharedPreferences storage;

  Future<void> init() async {
    storage = await SharedPreferences.getInstance();
  }

  Future<void> setToken(String token) => storage.setString(Words.token,token);

  Future<Unit> storeCategories(List categories) {
    storage.setString(Words.cachedCategories, json.encode(categories));
    return Future.value(unit);
  }
  Future<Unit> storeCarts(List carts) {
    storage.setString(Words.cachedCarts, json.encode(carts));
    return Future.value(unit);
  }

  Future<Unit> storeSliders(List sliders) {
    storage.setString(Words.cachedSliders, json.encode(sliders));
    return Future.value(unit);
  }

  Future<Unit> storeMostSale(List mostSale) {
    storage.setString(Words.cachedMostSale, json.encode(mostSale));
    return Future.value(unit);
  }

  String? get cachedCategories => storage.getString(Words.cachedCategories);
  String? get cachedSliders => storage.getString(Words.cachedSliders);
  String? get cachedMostSale => storage.getString(Words.cachedMostSale);
//================products===============

  Future<Unit> storeProducts(List products) {
    storage.setString(Words.cachedProducts, json.encode(products));
    return Future.value(unit);
  }

  Future<Unit> storeSingleProducts(Map<String, dynamic> products) {
    storage.setString(Words.cachedSingleProducts, json.encode(products));
    return Future.value(unit);
  }

  String? get cachedCarts => storage.getString(Words.cachedCarts);
  String? get cachedProducts => storage.getString(Words.cachedProducts);
  String? get cachedProfile => storage.getString(Words.cachedProfile);
  String? get token => storage.getString(Words.token);

  String? get cachedSingleProducts =>
      storage.getString(Words.cachedSingleProducts);
//================Auth===============

  Future<Unit> storeProfile(Map<String, dynamic> profile) {
    storage.setString(Words.cachedProfile, json.encode(profile));
    return Future.value(unit);
  }


  //==============order==============

  Future<Unit> storeOrders(List orders) {
    storage.setString(Words.cachedOrders, json.encode(orders));
    return Future.value(unit);
  }

  String? get cachedOrders => storage.getString(Words.cachedOrders);
}
