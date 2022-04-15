import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:localize_and_translate/localize_and_translate.dart';

import 'add_question_cubit.dart';
import 'package:image_picker/image_picker.dart';


class TripWidget extends StatefulWidget {
  static const String routeName = 'TripWidget';

  TripWidgetState createState() => TripWidgetState();
}

class TripWidgetState extends State<TripWidget> {
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
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // alignment: AlignmentDirectional.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              side: BorderSide(color: Colors.red, width: 1),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5))),
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
          );
        },
      ),
    );
  }

  Widget createBtn(context) {
    return Center(
        child: Container(
            width: 80,
            height: 45,
            child: ElevatedButton(
              child: new Text(
                'send'.tr(),
              ),
              onPressed: () {
                if (!_key.currentState!.validate()) return;
                //
              },
            )));
  }

  Widget profileImageContainer(context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 54.0,
          child: CircleAvatar(
            radius: 50.0,
            // backgroundImage:
            // FileImage(TripCubit.get(context).profileImage!),
          ),
        ),
        CircleAvatar(
          radius: 22.0,
          child: IconButton(
            icon: CircleAvatar(
              radius: 20.0,
              child: Icon(
                Icons.camera_alt,
                size: 16.0,
              ),
            ),
            onPressed: () {
              // TripCubit.get(context).getProfileImage();
            },
          ),
        ),
      ],
    );
  }

  Widget buildGridView(context) {
    var cubit = AddQuestionCubit.get(context);
    return GridView.count(
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
              // clipBehavior: Clip.,
              children: <Widget>[
                Image(
                  image: FileImage(uploadModel),
                  fit: BoxFit.cover,
                  width: 100,
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
        //   else {
        //   //   return Card(
        //   //     child: IconButton(
        //   //       icon: Icon(Icons.add),
        //   //       onPressed: () {
        //   //         TripCubit.get(context).getProfileImage(context);
        //   //       },
        //   //     ),
        //   //   );
        //   // }
      }),
    );
  }
}
