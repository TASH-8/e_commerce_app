// ignore_for_file: use_rethrow_when_possible

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/home/data/models/items_model.dart';
import 'package:injectable/injectable.dart';

abstract class ItemsRemotedatasource {
  Future<List<ItemsModel>> getAllItems();
}

@LazySingleton(as: ItemsRemotedatasource)
class ItemsRemotedatasourceImp extends ItemsRemotedatasource {
  final FirebaseFirestore fireStore;

  ItemsRemotedatasourceImp({required this.fireStore});

  @override
  Future<List<ItemsModel>> getAllItems() async {
    // List<ItemsModel> itemsList = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await fireStore.collection("items").get();
      List<ItemsModel> itemsList = querySnapshot.docs
          .map((doc) => ItemsModel.fromJson(doc.data()))
          .toList();

      // for (var doc in querySnapshot.docs) {
      //   itemsList.add(ItemsModel.fromJson(doc.data()));
      // }
      return itemsList;
    } on ServerFailure catch (e) {
      throw e;
    }
  }
}
