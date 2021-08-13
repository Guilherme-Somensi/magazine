import 'package:flutter/material.dart';
import 'package:magazine/models/item.dart';
import 'package:magazine/provider/list_of_item.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/logo.jpg"),
        ),
        title: Text(
          "Ofertas do dia",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/linha.jpg"),
          Expanded(
            child: ListView.separated(
              itemBuilder: builder,
              separatorBuilder: (_, index) {
                return Divider();
              },
              itemCount: listOfItems.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget builder(BuildContext _, int index) {
    {
      Item _item = listOfItems.elementAt(index);

      return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Image.asset(
              _item.photo,
              width: 40,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _item.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      _item.description,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Text(
                    _item.price,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text(
                    _item.installments,
                    style: TextStyle(fontSize: 10, color: Colors.blue),
                  )
                ],
              ),
            ),
            IconButton(
              icon: (_item.isFavorite)
                  ? Icon(
                      Icons.favorite,
                      color: Colors.pink,
                      //cor
                    )
                  : Icon(
                      Icons.favorite_outline,
                      //cor
                    ),
              onPressed: () {
                setState(() {
                  _item.isFavorite = !_item.isFavorite;
                });
              },
            ),
          ],
        ),
      );
    }
  }
}
