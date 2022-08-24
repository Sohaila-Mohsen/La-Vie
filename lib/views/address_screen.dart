import 'package:flutter/material.dart';
import 'package:la_vie/bloc/userCubit/user_cubit.dart';
import 'package:la_vie/core/components/button.dart';
import 'package:la_vie/core/components/form_field.dart';
import 'package:la_vie/core/components/logo.dart';
import 'package:la_vie/core/utils/sp_helper/cache_helper.dart';
import 'package:la_vie/views/home_screen.dart';
import '../core/style/app_text_style/app_text_style.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({String? address, Key? key}) : super(key: key) {
    if (address == null) {
      _address = TextEditingController();
    } else {
      _address = TextEditingController(text: address);
    }
  }
  TextEditingController? _address;
  final GlobalKey<FormState> _formKey = GlobalKey();
  UserCubit? userCubit;
  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    userCubit = UserCubit.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/address.png")),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(22),
              margin: const EdgeInsets.all(13),
              height: constraintsHeight / 2 + 70,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Logo(90),
                  const Text(
                    "Get Seeds For Free",
                    style: TextStyle(
                        fontFamily: "Karantina",
                        fontWeight: FontWeight.w400,
                        fontSize: 28),
                  ),
                  const Text(
                    "Enter Your Address",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 11),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomFormField(
                            validator: (value) {
                              if (value == null) {
                                return "this field is required to continue";
                              } else {
                                return null;
                              }
                            },
                            hint: "Address",
                            controller: _address,
                            label: ""),
                        const SizedBox(
                          height: 12,
                        ),
                        AppButton(
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              userCubit!
                                  .addAddress(_address!.text)
                                  .then((value) {
                                if (userCubit!.user!.type!
                                    .contains("Success")) {
                                  SharedPreferencesHelper.saveData(
                                      key: "isFirst", value: false);
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                      (route) => false);
                                }
                              });
                            } else {
                              print("not valid");
                            }
                          },
                          text: "Continue",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            SharedPreferencesHelper.saveData(
                                key: "isFirst", value: true);
                            SharedPreferencesHelper.saveData(
                                key: "address", value: _address!.text);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                                (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 206, 206, 206),
                              fixedSize: const Size(double.infinity, 50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Save later",
                                style: AppTextStyle.defultTextStyle(14,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
