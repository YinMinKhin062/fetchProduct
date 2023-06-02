
import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';
@JsonSerializable()
class Product{
  int ?id;
  String ? title,description,category,image;
  double ? price;
  Product(this.id,this.title,this.price,this.description,this.category,this.image);

factory Product.fromJson(Map<String,dynamic>json)=>_$ProductFromJson(json);

}