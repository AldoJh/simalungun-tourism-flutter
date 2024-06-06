import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/data/datasource/local_datasource.dart';
import 'package:simalungun_tourism/presentation/bloc/profile/profile_bloc.dart';
import 'package:simalungun_tourism/presentation/pages/login_page.dart';
import 'package:simalungun_tourism/presentation/widget/textfield_custom.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<ProfileBloc>().add(FetchProfileEvent());
    super.initState();
  }

  final picker = ImagePicker();

//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      context.read<ProfileBloc>().add(
            UpdateProfilePictureEvent(image: File(pickedFile.path)),
          );
    }
  }

//Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      context.read<ProfileBloc>().add(
            UpdateProfilePictureEvent(image: File(pickedFile.path)),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: const Text(
            'Profile Saya',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        title: const Text("Konfirmasi"),
                        content: const Text("Apakah anda yakin ingin keluar?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                context.goNamed(LoginPage.routeName);
                                LocalDataSource().removeToken();
                              },
                              child: const Text("Ya", style: TextStyle(
                                                    color:
                                                        constants.PrimaryColor),)),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Tidak",style: TextStyle(
                                                    color:
                                                        constants.PrimaryColor),)),
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is ProfileLoaded) {
              nameController.text = state.profile!.data!.name!;
              emailController.text = state.profile!.data!.email!;
              phoneController.text = state.profile!.data!.phone ?? "";
            }
            if (state is ProfileUpdated) {
              if (state.profile!.success == false) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.profile!.message ?? ""),
                  backgroundColor: Colors.red,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text("Profile berhasil diubah"),
                  backgroundColor: Colors.green,
                ));
                context.read<ProfileBloc>().add(FetchProfileEvent());
              }
            }
            if (state is ProfilePictureUpdated) {
              if (state.profile!.success == false) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.profile!.message ?? ""),
                  backgroundColor: Colors.red,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text("Foto Profile berhasil diubah"),
                  backgroundColor: Colors.green,
                ));
                context.read<ProfileBloc>().add(FetchProfileEvent());
              }
            }
          },
          builder: (context, state) {
            if (state is ProfileLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                  state.profile!.data!.photo!
                                      .replaceAll(' ', ''),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: 250,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 24, top: 24, right: 24),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Ganti Foto Profile',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 28),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      getImageFromCamera();
                                                      context.pop();
                                                    },
                                                    child: Container(
                                                      height: 56,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 1.0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(width: 24),
                                                          Icon(
                                                            Icons
                                                                .camera_alt_outlined,
                                                            color: Colors.black,
                                                            size: 20,
                                                          ),
                                                          SizedBox(width: 24),
                                                          Text(
                                                            "Ambil Foto",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Spacer(),
                                                          Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color: Colors.grey,
                                                            size: 16,
                                                          ),
                                                          SizedBox(width: 24),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 16),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      getImageFromGallery();
                                                      context.pop();
                                                    },
                                                    child: Container(
                                                      height: 56,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 1.0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(width: 24),
                                                          Icon(
                                                            Icons
                                                                .image_outlined,
                                                            color: Colors.black,
                                                            size: 20,
                                                          ),
                                                          SizedBox(width: 24),
                                                          Text(
                                                            "pilih dari galeri",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Spacer(),
                                                          Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color: Colors.grey,
                                                            size: 16,
                                                          ),
                                                          SizedBox(width: 24),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Ink(
                                      child: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            state.profile!.data!.name!,
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            state.profile!.data!.email!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          TextFieldCustom(
                              controller: nameController,
                              hintText: "Your Name",
                              labelText: "Nama"),
                          SizedBox(height: 20),
                          TextFieldCustom(
                              controller: emailController,
                              hintText: "your@email.com",
                              labelText: "Email"),
                          SizedBox(height: 20),
                          TextFieldCustom(
                              controller: phoneController,
                              hintText: "+62",
                              labelText: "Nomor Telepon"),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  context.read<ProfileBloc>().add(
                                      UpdateProfileEvent(
                                          name: nameController.text,
                                          email: emailController.text,
                                          phone: phoneController.text));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: constants.PrimaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40))),
                                child: const Text(
                                  "Ubah Profile",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                          SizedBox(height: 30),
                          // TextFieldCustom(
                          //     controller: passwordController,
                          //     isPassword: true,
                          //     hintText: "Password",
                          //     labelText: "Password"),
                          // SizedBox(height: 20),
                          // TextFieldCustom(
                          //     controller: passwordConfirmController,
                          //     isPassword: true,
                          //     hintText: "Password",
                          //     labelText: "Konfirmasi Password"),
                          // SizedBox(height: 20),
                          // SizedBox(
                          //   width: double.infinity,
                          //   height: 50,
                          //   child: ElevatedButton(
                          //     onPressed: () {},
                          //     style: ElevatedButton.styleFrom(
                          //         backgroundColor: constants.PrimaryColor,
                          //         shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(40))),
                          //     child: const Text(
                          //       "Ubah Password",
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.w600),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(height: 20),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProfileError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
