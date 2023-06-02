import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetchproject/api/apiservice.dart';
import 'package:fetchproject/model/pdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class Detail extends StatelessWidget {
 
final apiService api=Get.find();
final int id;

Detail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Detail"),),
      body: Container(
        margin: EdgeInsets.all(20),
        child: FutureBuilder<Pdetail>(
          future: api.getProductDetail(id),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              Pdetail product=snapshot.data!;
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(imageUrl: product.image!,height: 150,width: 150,
            placeholder: (context, url) {
              return Center(child: CircularProgressIndicator());
            },),
            SizedBox(height: 10,),
            Expanded(
              child: ListView(
                  children: [
                    Text(product.title!,style: TextStyle(fontSize: 17),),
                    SizedBox(height: 10,),
                    Text('\$ ${product.price.toString()}',style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 10,),
                    Text("Description"),
                    SizedBox(height: 5,),
                    Text(product.description!,style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 10,),
                    RichText(text: TextSpan(
                      children:[
                        TextSpan(text: 'Category : ',style: TextStyle(color: Colors.black)),
                        TextSpan(text: product.category!,style: TextStyle(color: Colors.pink))
            
                      ]
                    ))
                  ],
              ),
            )
          ],
        );
            }
            else if(snapshot.hasError){
              return Text("This is error");
            }
            return Center(child: CircularProgressIndicator());
          },)
      )
    );
  }
}