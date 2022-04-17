import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../shared/constants.dart';
import '../cubit/add_question_cubit.dart';
import 'package:image_picker/image_picker.dart';

class AddQuestionScreen extends StatefulWidget {
  static const String routeName = 'AddQuestionScreen';

  const AddQuestionScreen({Key? key}) : super(key: key);

  AddQuestionScreenState createState() => AddQuestionScreenState();
}

class AddQuestionScreenState extends State<AddQuestionScreen> {
  final _key = new GlobalKey<FormFieldState<String>>();
  final shipmentNoController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddQuestionCubit(),
      child: BlocConsumer<AddQuestionCubit, AddQuestionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AddQuestionCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text('Add question'),
              centerTitle: true,
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.send))
              ],
            ),
            floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.send),),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            label: Text('Category'),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, color: mainColor),
                            // prefixText: 'Question: ',
                            icon: const Icon(
                              Icons.spoke,
                              size: 26,
                              color: mainColor,
                            ),
                            filled: true,
                            fillColor: Color(0xFFF5F5F5),
                            isDense: true,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onChanged: (item){},
                          items: [
                            DropdownMenuItem<String>(
                              value: 'test',
                              child: Text('test'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            label: Text('Question'),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, color: mainColor),
                            // prefixText: 'Question: ',
                            icon: const Icon(
                              Icons.question_answer,
                              size: 26,
                              color: mainColor,
                            ),
                            filled: true,
                            fillColor: Color(0xFFF5F5F5),
                            isDense: true,
                            enabledBorder: InputBorder.none,
                            // focusedBorder: InputBorder.none,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        TextFormField(
                          maxLines: 4,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            label: Text('Description'),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, color: mainColor),
                            // prefixText: 'Question: ',
                            icon: const Icon(
                              Icons.article,
                              size: 26,
                              color: mainColor,
                            ),
                            filled: true,
                            fillColor: Color(0xFFF5F5F5),
                            isDense: true,
                            enabledBorder: InputBorder.none,
                            // focusedBorder: InputBorder.none,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          // alignment: AlignmentDirectional.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                side: BorderSide(color: Colors.red, width: 1),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                              onPressed: () async {
                                cubit.pickImages();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.photo_library,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'addImage'.tr(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        buildGridView(context),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildGridView(context) {
    var cubit = AddQuestionCubit.get(context);
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(cubit.images.length, (index) {
        if (true) {
          // var uploadModel = TripCubit.get(context).images[index];
          var uploadModel = cubit.images[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            elevation: 4,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image(
                  image: FileImage(uploadModel),
                  fit: BoxFit.cover,
                  // width: 100,
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    width: 25,
                    height: 25,
                    child: IconButton(
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.remove_circle,
                        size: 20,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        cubit.removeImage(index);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
