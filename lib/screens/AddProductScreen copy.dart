import 'package:crud_applacation_02/restAPI/restApi.dart';
import 'package:crud_applacation_02/style/style.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Map<String, String> FormValue = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };

  bool Loading = false;

  onAddProduct() async {
    if (FormValue["ProductName"]!.length == 0) {
      ErrorMassage('enter your product name ');
    } else if (FormValue["ProductCode"]!.length == 0) {
      ErrorMassage('enter your product code ');
    } else if (FormValue["Img"]!.length == 0) {
      ErrorMassage('enter your product image ');
    } else if (FormValue["UnitPrice"]!.length == 0) {
      ErrorMassage('enter your product price ');
    } else if (FormValue["Qty"]!.length == 0) {
      ErrorMassage('enter your product quantity ');
    } else if (FormValue["TotalPrice"]!.length == 0) {
      ErrorMassage('enter the total price ');
    } else {
      setState(() {
        Loading = true;
      });
      await CreateProductReqest(FormValue);
      setState(() {
        Loading = false;
      });
    }
  }

  onChengeInput(key, value) {
    setState(() {
      FormValue.update(key, (update) => value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          background(context),
          Container(
            child: Loading ? (const Center(child: CircularProgressIndicator(),)):((SingleChildScrollView(
              padding:  const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    decoration: TextFieldDecoration('Product Name'),
                    onChanged: (value) {
                      onChengeInput("ProductName", value);
                    },
                  ),
                   const SizedBox(
                    height: 26,
                  ),
                  TextFormField(
                    decoration: TextFieldDecoration('Product Code'),
                    onChanged: (value) {
                      onChengeInput("ProductCode", value);
                    },
                  ),
                   const SizedBox(
                    height: 26,
                  ),
                  TextFormField(
                    decoration: TextFieldDecoration('Product Image'),
                    onChanged: (value) {
                      onChengeInput("Img", value);
                    },
                  ),
                   const SizedBox(
                    height: 26,
                  ),
                  TextFormField(
                    decoration: TextFieldDecoration('Unit price'),
                    onChanged: (value) {
                      onChengeInput("UnitPrice", value);
                    },
                  ),
                   const SizedBox(
                    height: 26,
                  ),
                  DropdownQuantity(
                    DropdownButton(
                      value: FormValue['Qty'],
                      isExpanded: true,
                      underline: Container(),
                      items:  const [
                        DropdownMenuItem(
                          child: Text('  Select Quantity'),
                          value: '',
                        ),
                        DropdownMenuItem(
                          child: Text('  1 pes'),
                          value: '1 pes',
                        ),
                        DropdownMenuItem(
                          child: Text('  2 pes'),
                          value: '2 pes',
                        ),
                        DropdownMenuItem(
                          child: Text('  3 pes'),
                          value: '3 pes',
                        ),
                        DropdownMenuItem(
                          child: Text('  4 pes'),
                          value: '4 pes',
                        ),
                        DropdownMenuItem(
                          child: Text('  5 pes'),
                          value: '5 pes',
                        ),
                      ],
                      onChanged: (value) {
                        onChengeInput("Qty", value);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  TextFormField(
                    decoration: TextFieldDecoration('Total Price'),
                    onChanged: (value) {
                      onChengeInput("TotalPrice", value);
                    },
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        onAddProduct();
                      },
                      child: const Text('ADD'),
                      style: StyleButton(),
                    ),
                  )
                ],
              ),
            )))
          )
        ],
      ),
    );
  }
}
