import 'package:fetchproject/api/apiservice.dart';
import 'package:fetchproject/model/pdetail.dart';
import 'package:fetchproject/model/product.dart';
import 'package:fetchproject/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';


Dio dio=Dio();
apiService api=apiService(dio);

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(api);

    return GetMaterialApp(
      title: "RestApi",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: FutureBuilder<List<Product>>(
        future: api.getProducts(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<Product> products=snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return item(products[index],context);
              },);
          }
          else if(snapshot.hasError){
            return Text("Error");
          }
          return Center(child: CircularProgressIndicator());
        },),
    );
  }
}

Widget item(Product product,context){
  return Card(
    child: ListTile(
      onTap: () {
        // Navigator.push(context, 
        // MaterialPageRoute(builder: (context) => Detail(api,product
        // .id!),));

        Get.to(Detail(product.id!));

      },
      leading: CachedNetworkImage(imageUrl: product.image!,width: 100,height: 100,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()) ,),
      title: Text(product.title!),
      subtitle: Text(product.price.toString()),
    ),
  );
}