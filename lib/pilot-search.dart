import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:search/details_vehicle.dart';
import 'package:search/products.dart';

class PilotSearch extends StatefulWidget {
  const PilotSearch({super.key});

  @override
  State<PilotSearch> createState() => _PilotSearchState();
}

class _PilotSearchState extends State<PilotSearch> {
  int i = 0;

  static List allproducts = [];
  static List newProducts = [];
  void getProduct() async {
    Response response =
        await get(Uri.parse("https://pilotbazar.com/api/vehicle?page=1"));
    //https://pilotbazar.com/api/vehicle?page=0
    //https://crud.teamrabbil.com/api/v1/ReadProduct
    print(response.statusCode);
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);

    print(decodedResponse['data']);
    for (i; i < decodedResponse['data'].length; i++) {
      allproducts.add(Product(
        vehicleName: decodedResponse['data'][i]['translate'][0]['title'] ?? '',
        manufacture: decodedResponse['data'][i]['manufacture'] ?? '',
        slug: decodedResponse['data'][i]['slug'] ?? '',
        id: decodedResponse['data'][i]['id'] ?? '',
        condition: decodedResponse['data'][i]['condition']['translate'][0]
                ['title'] ??
            '',
        mileage: decodedResponse['data'][i]['mileage']['translate'][0]
                ['title'] ??
            '',
        price: decodedResponse['data'][i]['price'] ?? '',
        imageName: decodedResponse['data'][i]['image']['name'] ?? '',
        registration: decodedResponse['data'][i]['registration'] ?? '-',
      ));
    }
    setState(() {
      allproducts;
    });
    //print(allproducts.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
    updateList('');
  }

  void updateList(String val) {
    setState(() {
      if (val.isEmpty) {
        newProducts = List.from(allproducts);
        setState(() {});
      } else {
        List<String> searchTerms = val.toLowerCase().split(' ');

        newProducts = allproducts.where((element) {
          String combinedText =
              '${element.vehicleName} ${element.manufacture}'.toLowerCase();

          // Check if all search terms are present in the combined text
          return searchTerms.every((term) => combinedText.contains(term));
        }).toList();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search PilotBazar"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  // _searchList(value);
                  updateList(value);
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: newProducts.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        //getProduct();

                        print("Tapped the listile");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsVehicle(
                                      VehicleName: newProducts[index]
                                          .vehicleName
                                          .toString(),
                                      VehiceId:
                                          newProducts[index].id.toString(),
                                      imageName: newProducts[index]
                                          .imageName
                                          .toString(),
                                    )));
                      },
                      child: Card(
                        child: ListTile(
                          title: Image.network(
                              "https://pilotbazar.com/storage/vehicles/${newProducts[index].imageName}"),
                          subtitle: Column(
                            children: [
                              Text(newProducts[index].id.toString()),
                              Text(newProducts[index].vehicleName.toString()),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
