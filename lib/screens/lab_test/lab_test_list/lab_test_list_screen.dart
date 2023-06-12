import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ritecare_hms/view_model/lab_test_view_model/lab_test_list_view_model.dart';
import 'package:ritecare_hms/widgets/filter_button.dart';
import 'package:ritecare_hms/screens/lab_test/lab_test_list/components/lab_list1_card_list.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../data/response/status.dart';
import '../../../model/lab_test_model/lab_test_list_model.dart';
import '../../../utils/color_styles.dart';
import '../../../view_model/summery_view_model/summery_view_model.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/popup_button_widget.dart';
import '../../../widgets/resuable_header.dart';
import '../../demo_screen.dart';
import '../sample_list/components/sample_filter_widget.dart';
import 'components/lab_test_list_filter_widget.dart';
import 'lab_test_list_details.dart';

class LatTestListScreen extends StatefulWidget {
  const LatTestListScreen({Key? key}) : super(key: key);

  @override
  State<LatTestListScreen> createState() => _LatTestListScreenState();
}

class _LatTestListScreenState extends State<LatTestListScreen> {
  final labTestListVm = Get.put(LabTestListViewModel());

  final scrollerController = ScrollController();
  int page = 1;

  bool isLoading = true;
  bool hasMore = true;
  int labStatus = 0;

  //List<Items> itemsData = [];

  @override
  void initState() {
    scrollerController.addListener(_scrollListener);

    labTestListVm
        .getLabTestListData(page: 1, labStatus: 0);

print("init lab status ${labTestListVm.categoryId.value}");

        //.then((value) => itemsData.addAll(value.items?.map((e) => e) ?? []));

    super.initState();
  }

  void _scrollListener() async {
    if (scrollerController.position.pixels ==
        scrollerController.position.maxScrollExtent) {
      //page = page + 1;


      labTestListVm.pageNumber.value ++;
      print("lab page number ${ labTestListVm.pageNumber.value}");

      final list = await labTestListVm.getLabTestListData(page: labTestListVm.pageNumber.value, labStatus: labTestListVm.categoryId.value);
      //itemsData.addAll(list.items?.toList() ?? []);
    }
  }



  @override
  void dispose() {
    scrollerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        actions: [
          AppBarWidget(),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          LabTestListFilterWidget(
            textField1HintText: 'Labtest Name',
            onClick: () {},
          ),
          SizedBox(
            height: 20,
          ),
          ResuableHeader(
            leadingText: 'Test Name',
            titleText: 'Code',
            tralingText: 'Category',
          ),
          Expanded(
            child: Obx(() {
              switch (labTestListVm.rxRequestStatus.value) {
                case Status.LOADING:
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                case Status.ERROR:
                  print("error ${labTestListVm.error.value.toString()}");
                  return Text(labTestListVm.error.value.toString());

                case Status.SUCCESS:
                  if (labTestListVm.labtestListData.value.items?.length ==
                      null) {
                    return Text("item not found");
                  } else {
                    return ListView.builder(
                        controller: scrollerController,
                        itemCount: labTestListVm.items.length,
                        itemBuilder: (context, index) {
                          if (index < labTestListVm.items.length) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8),
                              child: LabList1CardList(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LabTestListDetailsScreen(
                                                  code: labTestListVm.items[index].code,
                                                  testName:
                                                  labTestListVm.items[index].name,
                                                  category: labTestListVm.items[index]
                                                      .itemCategory!
                                                      .name,
                                                  reportSerialNO:
                                                  labTestListVm.items[index]
                                                      .labItemSerialNo,
                                                  labReportGroup:
                                                  labTestListVm.items[index]
                                                      .labReportGroup
                                                      ?.name,
                                                  chargePrice: labTestListVm.items[index]
                                                      .salePrice,
                                                  refferCommission:
                                                  labTestListVm
                                                      .labtestListData
                                                      .value
                                                      .items![index]
                                                      .itemCategory!
                                                      .referralCommission,
                                                )));
                                  },
                                  title: "${labTestListVm.items[index].name}",
                                  code: labTestListVm.items[index].code,
                                  category: labTestListVm.items[index].itemCategory!.name,
                                  price: labTestListVm.items[index].salePrice),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        });
                  }
              }
            }),
          )
        ],
      ),
    );
  }
}
