import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class ProviderModel with ChangeNotifier{
  InAppPurchase _iap = InAppPurchase.instance;
  bool available = true;
  StreamSubscription subscription;
  final String myProductID = "in_app_payment_test";

  bool _isPurchased = false;
  bool get isPurchased => _isPurchased;
  set isPurchased(bool value){
    _isPurchased = value;
    notifyListeners();
  }

  List _purchases = [];
  List get purchases => _purchases;
  set purchases (List value){
    _purchases = value;
    notifyListeners();
  }

  List _products = [];
  List get products => _products;
  set products(List value){
    _products = value;
    notifyListeners();
  }

  void initialize() async{
    available = await _iap.isAvailable();
    if(available){
      await _getProducts();
      verifyPurchase();
      subscription = _iap.purchaseStream.listen((data) {
        purchases.addAll(data);
        verifyPurchase();
      });
    }
  }

  void verifyPurchase(){
    PurchaseDetails purchase = hasPurchased(myProductID);
    if(purchase != null && purchase.status == PurchaseStatus.purchased){
      if(purchase.pendingCompletePurchase){
        _iap.completePurchase(purchase);
        isPurchased = true;
      }
    }
  }

  PurchaseDetails hasPurchased(String productID){
    return purchases.firstWhere(
            (purchase) => purchase.productID == productID,
    orElse: () => null);
  }

  Future<void> _getProducts() async {
    Set<String> ids = Set.from([myProductID]);
    ProductDetailsResponse response = await _iap.queryProductDetails(ids);
    products = response.productDetails;
  }



}