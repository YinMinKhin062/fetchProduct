
import 'package:json_annotation/json_annotation.dart';
part 'pdetail.g.dart';

@JsonSerializable()
class Pdetail{
  int ?id;
  String ? title,description,category,image;
  double ?price;

  Pdetail(this.id,this.title,this.price,this.description,this.category,this.image);

factory Pdetail.fromJson(Map<String,dynamic>json)=> _$PdetailFromJson(json);
}