import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClients;
import 'package:wscube_products/models/data_model.dart';
import 'package:wscube_products/screens/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel? dataModel;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HomePage",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: dataModel != null && dataModel!.products.isNotEmpty
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 6,
              ),
              itemCount: dataModel!.products.length,
              itemBuilder: (_, index) {
                var product = dataModel!.products[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.black12,
                    elevation: 5,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => DetailsPage(
                                      id: product.id!,
                                      title: product.title!,
                                      description: product.description!,
                                      price: product.price!,
                                      discountPercentage:
                                          product.discountPercentage!,
                                      rating: product.rating!,
                                      stock: product.stock!,
                                      brand: product.brand!,
                                      category: product.category!,
                                      thumbnail: product.thumbnail!,
                                      images: product.images!,
                                    )));
                      },
                      title: SizedBox(
                        height: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.brand!,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: SizedBox(
                                width: 110,
                                height: 170,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    product.thumbnail!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Price: ",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.purple,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "\$ ${product.price}",
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void getProducts() async {
    var uri = Uri.parse("https://dummyjson.com/products");
    var response = await httpClients.get(uri);

    if (response.statusCode == 200) {
      var mData = jsonDecode(response.body);
      dataModel = DataModel.fromJson(mData);
      setState(() {});
    }
  }
}
