import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard_controller.dart';
import '../../services/size_config.dart';
import '../../services/theme.dart';
import '../../widgets/buttons.dart';

class NewPropertyScreen extends StatelessWidget {
  final DashboardController x = DashboardController.to;
  // final myPref = MyPref.to;

  NewPropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
          //padding: EdgeInsets.only(top: Get.mediaQuery.padding.top),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                mainBackgroundcolor,
                mainBackgroundcolor2,
                mainBackgroundcolor3,
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                padding: EdgeInsets.only(top: Get.mediaQuery.padding.top),
                width: Get.width,
                height: Get.height,
                child: RefreshIndicator(
                  onRefresh: () async {
                    // x.asyncHome();
                    // await Future.delayed(const Duration(milliseconds: 2200));
                    // x.asyncLatitude();
                    // return;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 22, right: 18, top: 10, bottom: 10),
                          child: topIcon(),
                        ),

                        // white card with form
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(children: [
                            // text
                            Row(
                              children: [
                                Text(
                                  "Maelezo ya Nyumba",
                                  style: Get.textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            inputName(),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            inputSearch(),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            dropdownCategory(),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            dropdoenServiceType(),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            dropdoenKipindi(),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            inputPrice(),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            inputPeople(),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            inputPhone(),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            checkBox(),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            inputDescription(),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            attachPhoto(),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            Container(
                              margin: const EdgeInsets.only(bottom: 0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () async {
                                    // await login();
                                    Get.offAllNamed('/home');
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const ButtonContainer(
                                      text: 'Ongeza Nyumba',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),

                        SizedBox(height: getProportionateScreenHeight(15)),
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }
}

Widget topIcon() {
  //debugPrint(dataInstall);
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: colorGrey2,
                        style: BorderStyle.solid,
                        width: 0.8,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Icon(
                      FontAwesome.chevron_left,
                      size: 16,
                      color: Get.theme.disabledColor,
                    ),
                  ),
                ),
              ),
              spaceWidth10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Text("Ongeza Nyumba Mpya",
                    style: Get.theme.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

// property_name
final textPropertyName = ''.obs;
final TextEditingController _propertyName = TextEditingController();
Widget inputName() {
  _propertyName.text = textPropertyName.value;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: LinearGradient(
        colors: [Get.theme.canvasColor, Get.theme.canvasColor.withOpacity(.98)],
      ),
    ),
    child: SizedBox(
      width: Get.width,
      child: TextFormField(
        controller: _propertyName,
        onChanged: (text) {
          textPropertyName.value = text;
        },
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 15),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            FontAwesome.building,
            size: 18,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          hintText: "Jina la Nyumba",
          label: Text("Jina la Nyumba",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    ),
  );
}

// search_location
final textSearchLocation = ''.obs;
final TextEditingController _searchLocation = TextEditingController();
Widget inputSearch() {
  _searchLocation.text = textSearchLocation.value;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: LinearGradient(
        colors: [Get.theme.canvasColor, Get.theme.canvasColor.withOpacity(.98)],
      ),
    ),
    child: SizedBox(
      width: Get.width,
      child: TextFormField(
        controller: _searchLocation,
        onChanged: (text) {
          textSearchLocation.value = text;
        },
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 15),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            FontAwesome.location_arrow,
            size: 18,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          hintText: "Mahali Nyumba Ipo",
          label: Text("Mahali Nyumba Ipo",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    ),
  );
}

// _categories list
final List<String> _categories = [
  'Apartment',
  'Office',
  'Duka',
  'Hoteli',
  'Ghorofa',
  'Geto',
];

// property_category
final textPropertyCategory = ''.obs;
final TextEditingController _servicetype = TextEditingController();
Widget dropdownCategory() {
  _servicetype.text = textPropertyCategory.value;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: LinearGradient(
        colors: [Get.theme.canvasColor, Get.theme.canvasColor.withOpacity(.98)],
      ),
    ),
    child: SizedBox(
      width: Get.width,
      child: DropdownButtonFormField(
        hint: const Text(
          "Aina ya Nyumba",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          prefixIcon: Icon(
            FontAwesome.home,
            size: 18,
            color: Colors.grey,
          ),
        ),
        items: _categories.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {},
      ),
    ),
  );
}

final List<String> _huduma = [
  'Inauzwa',
  'Inapangishwa',
];

// property_category
final textServiceType = ''.obs;
final TextEditingController _propertyCategory = TextEditingController();
Widget dropdoenServiceType() {
  _propertyCategory.text = textServiceType.value;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: LinearGradient(
        colors: [Get.theme.canvasColor, Get.theme.canvasColor.withOpacity(.98)],
      ),
    ),
    child: SizedBox(
      width: Get.width,
      child: DropdownButtonFormField(
        hint: const Text(
          "Aina ya Huduma",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          prefixIcon: Icon(
            FontAwesome.sort_amount_desc,
            size: 18,
            color: Colors.grey,
          ),
        ),
        items: _huduma.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {},
      ),
    ),
  );
}

final List<String> _kipindi = [
  'Mwezi',
  'Miezi 3',
  'Miezi 6',
  'Mwaka',
  'Milele'
];

// property_category
final textKipindi = ''.obs;
final TextEditingController _kipindiController = TextEditingController();
Widget dropdoenKipindi() {
  _kipindiController.text = textKipindi.value;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: LinearGradient(
        colors: [Get.theme.canvasColor, Get.theme.canvasColor.withOpacity(.98)],
      ),
    ),
    child: SizedBox(
      width: Get.width,
      child: DropdownButtonFormField(
        hint: const Text(
          "Kipindi cha Huduma",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          prefixIcon: Icon(
            FontAwesome.calendar,
            size: 18,
            color: Colors.grey,
          ),
        ),
        items: _kipindi.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {},
      ),
    ),
  );
}

// PHONE
final textPhone = ''.obs;
final TextEditingController _phone = TextEditingController();
Widget inputPhone() {
  _phone.text = textPhone.value;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      color: Colors.white,
    ),
    child: SizedBox(
      width: Get.width,
      child: TextFormField(
        controller: _phone,
        onChanged: (text) {
          textPhone.value = text;
        },
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.phone,
        style: const TextStyle(fontSize: 15),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            FontAwesome.phone,
            size: 18,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          hintText: "Namba ya Simu",
          label: Text("Namba ya Simu",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    ),
  );
}

// price
final textPrice = ''.obs;
final TextEditingController _price = TextEditingController();
Widget inputPrice() {
  _price.text = textPrice.value;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: LinearGradient(
        colors: [Get.theme.canvasColor, Get.theme.canvasColor.withOpacity(.98)],
      ),
    ),
    child: SizedBox(
      width: Get.width,
      child: TextFormField(
        controller: _price,
        onChanged: (text) {
          textPrice.value = text;
        },
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 15),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            FontAwesome.dollar,
            size: 18,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          hintText: "Bei ya Nyumba",
          label: Text("Bei ya Nyumba",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    ),
  );
}

// description
final textDescription = ''.obs;
final TextEditingController _description = TextEditingController();
Widget inputDescription() {
  _description.text = textDescription.value;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: LinearGradient(
        colors: [Get.theme.canvasColor, Get.theme.canvasColor.withOpacity(.98)],
      ),
    ),
    child: SizedBox(
      width: Get.width,
      child: TextFormField(
        controller: _description,
        onChanged: (text) {
          textDescription.value = text;
        },
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        style: const TextStyle(fontSize: 15),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Maelezo ya Nyumba",
          label: Text("Maelezo ya Nyumba",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    ),
  );
}

// people
final textPeople = ''.obs;
final TextEditingController _people = TextEditingController();
Widget inputPeople() {
  _people.text = textPeople.value;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: LinearGradient(
        colors: [Get.theme.canvasColor, Get.theme.canvasColor.withOpacity(.98)],
      ),
    ),
    child: SizedBox(
      width: Get.width,
      child: TextFormField(
        controller: _people,
        onChanged: (text) {
          textPeople.value = text;
        },
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 15),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            FontAwesome.users,
            size: 18,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          hintText: "Watu wanaoweza kuishi",
          label: Text("Watu wanaoweza kuishi",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    ),
  );
}

// check box
Widget electricity() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    child: SizedBox(
      width: Get.width,
      child: CheckboxListTile(
        title: const Text("Ina umeme"),
        value: true,
        onChanged: (newValue) {},
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.all(0),
        activeColor: Get.theme.primaryColor,
        checkColor: Colors.white,
        dense: true,
      ),
    ),
  );
}

Widget water() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    child: SizedBox(
      width: Get.width,
      child: CheckboxListTile(
        title: const Text("Ina Maji"),
        value: false,
        onChanged: (newValue) {},
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.all(0),
        activeColor: Get.theme.primaryColor,
        checkColor: Colors.white,
        dense: true,
      ),
    ),
  );
}

// parking
Widget parking() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    child: SizedBox(
      width: Get.width,
      child: CheckboxListTile(
        title: const Text("Ina Parking"),
        value: false,
        onChanged: (newValue) {},
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.all(0),
        activeColor: Get.theme.primaryColor,
        checkColor: Colors.white,
        dense: true,
      ),
    ),
  );
}

// fance
Widget fance() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    child: SizedBox(
      width: Get.width,
      child: CheckboxListTile(
        title: const Text("Ina Fance"),
        value: false,
        onChanged: (newValue) {},
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.all(0),
        activeColor: Get.theme.primaryColor,
        checkColor: Colors.white,
        dense: true,
      ),
    ),
  );
}

// wifi
Widget wifi() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    child: SizedBox(
      width: Get.width,
      child: CheckboxListTile(
        title: const Text("Ina Wifi"),
        value: false,
        onChanged: (newValue) {},
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.all(0),
        activeColor: Get.theme.primaryColor,
        checkColor: Colors.white,
        dense: true,
      ),
    ),
  );
}

// toilet & bathroom
Widget toiletBathroom() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    child: SizedBox(
      width: Get.width,
      child: CheckboxListTile(
        title: const Text("Ina Choo & Bafu"),
        value: true,
        onChanged: (newValue) {},
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.all(0),
        activeColor: Get.theme.primaryColor,
        checkColor: Colors.white,
        dense: true,
      ),
    ),
  );
}

// kitchen
Widget kitchen() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    child: SizedBox(
      width: Get.width,
      child: CheckboxListTile(
        title: const Text("Ina Jiko"),
        value: false,
        onChanged: (newValue) {},
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.all(0),
        activeColor: Get.theme.primaryColor,
        checkColor: Colors.white,
        dense: true,
      ),
    ),
  );
}

// bedroom
Widget bedroom() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    child: SizedBox(
      width: Get.width,
      child: CheckboxListTile(
        title: const Text("Ina Vyumba"),
        value: false,
        onChanged: (newValue) {},
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.all(0),
        activeColor: Get.theme.primaryColor,
        checkColor: Colors.white,
        dense: true,
      ),
    ),
  );
}

Widget checkBox() {
  return Column(
    children: [
      electricity(),
      water(),
      parking(),
      fance(),
      wifi(),
      toiletBathroom(),
      kitchen(),
      bedroom(),
    ],
  );
}

// select photo
Widget attachPhoto() {
  // smooth container
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: LinearGradient(
        colors: [Get.theme.canvasColor, Get.theme.canvasColor.withOpacity(.98)],
      ),
    ),
    child: SizedBox(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Pakia Picha Kuu",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  // Get.toNamed('/login');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: colorGrey2,
                        style: BorderStyle.solid,
                        width: 0.8,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Icon(
                      FontAwesome.plus,
                      size: 16,
                      color: Get.theme.disabledColor,
                    ),
                  ),
                ),
              ),
              spaceWidth10,
              InkWell(
                onTap: () {
                  // Get.toNamed('/login');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: colorGrey2,
                        style: BorderStyle.solid,
                        width: 0.8,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Icon(
                      FontAwesome.camera,
                      size: 16,
                      color: Get.theme.disabledColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
