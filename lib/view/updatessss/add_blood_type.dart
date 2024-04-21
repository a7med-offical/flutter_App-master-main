import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:bldapp/Colors.dart';
import 'package:bldapp/Provider/theme_provider.dart';
import 'package:bldapp/model/donar_model.dart';
import 'package:bldapp/view/updatessss/donar_details_info.dart';
import 'package:bldapp/view/updatessss/hospital.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bldapp/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddBloodType extends StatefulWidget {
  const AddBloodType({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<AddBloodType> createState() => _AddBloodTypeState();
}
class _AddBloodTypeState extends State<AddBloodType> {
  String title = 'Lets Scan QR Code';
  CollectionReference bloodTypeData =
      FirebaseFirestore.instance.collection('bloodTypeData');
  CollectionReference inventoryTable =
      FirebaseFirestore.instance.collection('inventoryTable');

  String searchQuery = '';
  Future<void> scanQrCode() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'Cancel', true, ScanMode.QR)
          .then(
        (value) {
          List dataList = value.split(' ');
          String moreData = '';
          for (var i = 7; i < dataList.length; i++) {
            moreData = moreData + ' ' + dataList[i];
          }
          print('+++++++++++++++++++++++++++++++++++++++++' + value);

          String name = dataList[0].replaceAll('-', ' ');
          print('+++++++++++++++++++++++++++++++++++++++++' + dataList[6]);
          String hospital = dataList[6].replaceAll('-', ' ');
          print('+++++++++++++++++++++++++++++++++++++++++' + hospital);

          addData(
            donarName: name,
            donarId: dataList[1],
            serialNumber: dataList[2],
            bloodType: dataList[3],
            uId: dataList[4],
            expiredDate: dataList[5],
            hospitalName: hospital,
            moreDetails: moreData,
          );
        },
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Add_Blood_Type, style: Style.style16),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: searchController,
              onChanged: (query) => searchFunc(query),
              decoration: InputDecoration(
                hintText: S.of(context).Search_by_Serial_Num,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    searchFunc('');
                  },
                ),
              ),
              // style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: SingleChildScrollView(
            child: StreamBuilder<List<QueryDocumentSnapshot>>(
              stream: FirebaseFirestore.instance
                  .collection('bloodTypeData')
                  .where('id', isEqualTo: widget.id)
                  .snapshots()
                  .map((snapshot) => snapshot.docs),
              builder: (BuildContext context,
                  AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
                if (snapshot.hasError) {
                  return Text(S.of(context).Something_went_wrong);
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('');
                }

                List<QueryDocumentSnapshot> dataList = snapshot.data!;

                if (searchQuery.isNotEmpty) {
                  dataList = dataList.where((document) {
                    Map<String, dynamic> dataItem =
                        document.data() as Map<String, dynamic>;
                    String serialNumber = dataItem['serialNumber'].toString();
                    return serialNumber
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase());
                  }).toList();
                }

                return DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Blood Type',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.amber,
                            fontSize: 16),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Serial Num',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Details',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                  rows: dataList.map((DocumentSnapshot document) {
                    Map<String, dynamic> dataItem =
                        document.data() as Map<String, dynamic>;

                    return DataRow(
                      cells: [
                        DataCell(Text(dataItem['bloodType'].toString())),
                        DataCell(Text(dataItem['serialNumber'])),
                        DataCell(
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.info,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DonarDetailsInfo(
                                      donar: Donar(
                                        createdDate:
                                            dataItem['createdDate'].toString(),
                                        donarName:
                                            dataItem['donateName'].toString(),
                                        donarId:
                                            dataItem['donateID'].toString(),
                                        serialNum:
                                            dataItem['serialNumber'].toString(),
                                        expiredDate:
                                            dataItem['expiredDate'].toString(),
                                        bloodType:
                                            dataItem['bloodType'].toString(),
                                        moreDetails:
                                            dataItem['moreDetails'].toString(),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _theme.isDarkMode ? Colors.amber : background,
        onPressed: () {
          scanQrCode();
        },
        child: Icon(
          Icons.add,
          size: 25,
          color: _theme.isDarkMode ? background : Colors.white,
        ),
      ),
    );
  }

  List<QueryDocumentSnapshot> data = [];
  List<QueryDocumentSnapshot> searchData = [];
  TextEditingController searchController =
      TextEditingController(); // Controller for the search query

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('bloodTypeData')
        .where('id', isEqualTo: widget.id)
        .get();
    data.addAll(querySnapshot.docs);
    searchData.addAll(data);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void searchFunc(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  Future<void> addData({
  required String donarName,
  required String bloodType,
  required String donarId,
  required String expiredDate,
  required String hospitalName,
  required String moreDetails,
  required String serialNumber,
  required String uId,
}) async {
  try {
    // Check if the document already exists
    DocumentSnapshot bloodTypeDoc = await bloodTypeData.doc(uId).get();
    
    if (bloodTypeDoc.exists) {
      // Document already exists, show error dialog
      showErrorDialog('Failure', 'Blood type already exists');
      return;
    }

    // Fetch hospital data
    QuerySnapshot hospitalSnapshot = await FirebaseFirestore.instance
        .collection('HospitalRegisterData')
        .where('name', isEqualTo: hospitalName)
        .limit(1)
        .get();

    if (hospitalSnapshot.docs.isEmpty) {
      // Hospital data not found, handle appropriately
      print('Hospital data not found for: $hospitalName');
      return;
    }

    DocumentSnapshot hospitalDoc = hospitalSnapshot.docs.first;
    Map<String, dynamic> hospitalData = hospitalDoc.data() as Map<String, dynamic>;

    // Increment blood type count in hospital data
    int currentValue = hospitalData['bloodtype'][bloodType] ?? 0;
    await hospitalDoc.reference.set({
      'bloodtype': {bloodType: currentValue + 1},
    }, SetOptions(merge: true));

    // Add data to inventory table
    await inventoryTable.add({
      'donateName': donarName,
      'bloodType': bloodType,
      'donateID': donarId,
      'expiredDate': expiredDate,
      'serialNumber': serialNumber,
      'moreDetails': moreDetails,
      'postId': uId,
      'UpdatedDate': DateFormat('yyyy-MM-dd').format(DateTime.now()),
      'id': widget.id,
      'process': 'add',
    });

    // Add data to bloodTypeData collection
    await bloodTypeData.doc(uId).set({
      'donateName': donarName,
      'bloodType': bloodType,
      'donateID': donarId,
      'expiredDate': expiredDate,
      'serialNumber': serialNumber,
      'moreDetails': moreDetails,
      'postId': uId,
      'createdDate': DateFormat('yyyy-MM-dd').format(DateTime.now()),
      'id': widget.id,
    }, SetOptions(merge: true));

    // Show success dialog
    showSuccessDialog('Successful', 'Blood type is added');
  } catch (error) {
    // Handle errors
    showErrorDialog('Error', 'Please scan a correct QR');
    print('Error adding data: $error');
  }
}

void showSuccessDialog(String title, String message) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: title,
    desc: message,
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      setState(() {});
    },
  )..show();
}

void showErrorDialog(String title, String message) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    title: title,
    desc: message,
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      setState(() {});
    },
  )..show();
}

}
