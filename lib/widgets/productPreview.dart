import 'package:flutter/material.dart';
import '../data/productData.dart';

class ProductPreview extends StatefulWidget {
  final ProductData productData;

  const ProductPreview({super.key, required this.productData});

  @override
  State<ProductPreview> createState() => _ProductPreviewState();
}

class _ProductPreviewState extends State<ProductPreview> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, "/product", arguments: widget.productData)
      },
      child: GridTile(
        footer: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => {
                  setState(() {
                    widget.productData.isFavourite =
                        !widget.productData.isFavourite;
                  })
                },
                icon: widget.productData.isFavourite
                    ? const Icon(Icons.favorite, color: Colors.white)
                    : const Icon(Icons.favorite_border, color: Colors.white),
              ),
              Text(
                widget.productData.productName,
                style: const TextStyle(color: Colors.white),
              ),
              IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
              ),
            ],
          ),
        ),
        child: Image.network(widget.productData.imageURL),
      ),
    );
  }
}
