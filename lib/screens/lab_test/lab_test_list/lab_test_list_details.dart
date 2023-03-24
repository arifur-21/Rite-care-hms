
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_styles.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/popup_button_widget.dart';
import 'lab_test_list_screen.dart';

class LabTestListDetailsScreen extends StatefulWidget {
  const LabTestListDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LabTestListDetailsScreen> createState() => _LabTestListDetailsScreenState();
}

class _LabTestListDetailsScreenState extends State<LabTestListDetailsScreen> {

  List<Map> _books = [
    {
      'id': "CATEGORY",
      'title': 'Cancer Marker',

    },
    {
      'id': "CODE",
      'title': '183',

    },
    {
      'id': 'REPORT SERIAL NO',
      'title': '0',

    },
    {
      'id': 'LAB REPORT GROUP',
      'title': 'AB',

    },
    {
      'id': 'REFERRER COMMISSION(TK)',
      'title': '294',

    },
    {
      'id': 'CHARGE PRICE',
      'title': '389',

    }
  ];
  int _currentSortColumn = 0;
  bool _isSortAsc = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        child:DrawerWidget(),
      ),

      appBar: AppBar(
        backgroundColor: ColorStyles.primaryColor,
        actions: [
          AppBarWidget(),

          PopUpButtonWidget()
        ],
      ),
      body: Column(
        children: [

          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: ColorStyles.primaryColor,
                  borderRadius: BorderRadius.circular(2)
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("IMAGING DETAIL",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LatTestListScreen()));
                      },
                        child: Icon(Icons.cancel_presentation, size: 40,color: Colors.white,)),
                  ],
                ),
              ),
            ),
          ),

          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                _createDataTable()
              ],
            ),
          ),


        ],
      ),
    );
  }


  Widget _createDataTable() {
    return Container(
      width: double.infinity,
      child: DataTable(
        columns: _createColumns(),
        rows: _createRows(),
        sortColumnIndex: _currentSortColumn,
        sortAscending: _isSortAsc,
      ),
    );
  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: Text('TEST NAME', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
       /* onSort: (columnIndex, _) {
          setState(() {
            _currentSortColumn = columnIndex;
            if (_isSortAsc) {
              _books.sort((a, b) => b['id'].compareTo(a['id']));
            } else {
              _books.sort((a, b) => a['id'].compareTo(b['id']));
            }
            _isSortAsc = !_isSortAsc;
          });
        },*/
      ),
      DataColumn(label: Text('AFP',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),

    ];
  }
  List<DataRow> _createRows() {
    return _books
        .map((book) => DataRow(cells: [
      DataCell(Expanded(child: Text( book['id'].toString(), style: TextStyle(fontWeight: FontWeight.bold),))),
      DataCell(Expanded(child: Text(book['title']))),

    ]))
        .toList();
  }
}



