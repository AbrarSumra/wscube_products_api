import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final num rating;
  final num stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<dynamic> images;

  const DetailsPage({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  //DataModel? dataModel;

  @override
  void initState() {
    super.initState();
    //getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.purple.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Details Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey,
            height: 200,
            child: ListView.builder(
              itemCount: widget.images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, photoIndex) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Image.network(
                                    widget.images[photoIndex],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  right: 30,
                                  top: 210,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      );
                    },
                    child: Card(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          widget.images[photoIndex],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 11),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                Text(
                  widget.brand,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Price:",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      "\$ ${widget.price}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.green,
                      child: Text(
                        "${widget.discountPercentage}% off",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                Row(
                  children: [
                    const Text(
                      "Rate:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            " ${widget.rating}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Desc :",
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 30),
                    SizedBox(
                      width: 270,
                      child: Text(
                        " ${widget.description}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                Row(
                  children: [
                    const Text(
                      "In stock:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      " ${widget.stock}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
