
import 'package:fetchproject/model/pdetail.dart';
import 'package:fetchproject/model/product.dart';
// import 'package:flutter/foundation.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'apiservice.g.dart';

@RestApi(baseUrl: "https://fakestoreapi.com/")
abstract class apiService{

factory apiService(Dio dio)=_apiService;

@GET("products")
Future<List<Product>> getProducts();

@GET('products/{id}')
Future <Pdetail> getProductDetail(@Path("id") int id);

}