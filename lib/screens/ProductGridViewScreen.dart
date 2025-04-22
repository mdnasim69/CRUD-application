import 'package:crud_applacation_02/restAPI/restApi.dart';
import 'package:crud_applacation_02/screens/AddProductScreen%20copy.dart';
import 'package:crud_applacation_02/screens/ProductUpdateScreen.dart';
import 'package:crud_applacation_02/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Productgridviewscreen extends StatefulWidget {
  const Productgridviewscreen({super.key});

  @override
  State<Productgridviewscreen> createState() => _ProductgridviewscreenState();
}

class _ProductgridviewscreenState extends State<Productgridviewscreen> {
  List productList1 = [];
  bool Loading = true;

  @override
  void initState() {
    GetProduct();
    super.initState();
  }

  DeleteProduct(id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete!'),
            content:
                const Text('Once you delete ,then you will not get it again'),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('NO')),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      Loading = true;
                    });
                    DeletProductRequest(id);
                    GetProduct();
                  },
                  child: const Text('YES')),
            ],
          );
        });
  }

  GetProduct() async {
    Loading = true;
    var data = await ReadProductReqest();

    setState(
      () {
        productList1 = data;
        Loading = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 60,
        title: const Text(
          'Product',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          background(context),
          Container(
              child: Loading
                  ? (const Center(
                      child: CircularProgressIndicator(),
                    ))
                  : RefreshIndicator(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 2,
                                  mainAxisExtent: 280),
                          itemCount: productList1.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      productList1[index]['Img'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          productList1[index]['ProductName'],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            'price: ${productList1[index]['UnitPrice']}  BDT'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            'product code: ${productList1[index]['ProductCode']} '),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    side: const BorderSide(
                                                        color: Colors.blue,
                                                        width: 2)),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Productupdatescreen(
                                                                productList1[
                                                                    index])));
                                              },
                                              child: const Icon(
                                                CupertinoIcons
                                                    .ellipsis_vertical_circle,
                                                size: 18,
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    side: const BorderSide(
                                                        color: Colors.blue,
                                                        width: 2)),
                                              ),
                                              onPressed: () {
                                                DeleteProduct(
                                                    productList1[index]['_id']);
                                              },
                                              child: const Icon(
                                                CupertinoIcons.delete,
                                                size: 18,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                      onRefresh: () async {
                        await GetProduct();
                      })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
