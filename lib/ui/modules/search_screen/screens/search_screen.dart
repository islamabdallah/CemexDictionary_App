import 'package:faq_cemex/ui/modules/search_screen/components/my_chip.dart';
import 'package:faq_cemex/ui/modules/search_screen/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/firebase/push_notification_service.dart';
import '../../../shared/components/animated_list.dart';
import '../../../shared/components/question_widget.dart';
import '../../../shared/models/question.dart';
import '../components/multiselect.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = 'SearchScreen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {

    PushNotificationService.init(context);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = SearchCubit.get(context);
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List<Question> questions = [
          Question(
            id: 0,
            questionTitle: 'How ...........',
          ),
          Question(
            id: 0,
            questionTitle: 'what ...........',
          ),
          Question(
            id: 0,
            questionTitle: 'Is ...........',
          ),
          Question(
            id: 0,
            questionTitle: 'What methods of payment does Cemex accept?',
          ),
          Question(
            id: 0,
            questionTitle: 'What methods of payment does Cemex accept?',
          ),
          Question(
            id: 0,
            questionTitle: 'What methods of payment does Cemex accept?',
          ),
          Question(
            id: 0,
            questionTitle: 'What methods of payment does Cemex accept?',
          ),
          Question(
            id: 0,
            questionTitle: 'What methods of payment does Cemex accept?',
          ),
        ];
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
            children: [
                Container(
                  color: Color(0xFFFE4747),
                  height: 300,
                ),
                Container(
                  margin: EdgeInsets.only(top: 160),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          topLeft: Radius.circular(8))),
                  padding: EdgeInsets.all(16),
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          offset: Offset(0, 4),
                                          color: Colors.black26)
                                    ]),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Ask A Question",
                                    isDense: true,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Icon(
                                        Icons.search,
                                        size: 26,
                                      ),
                                    ),
                                    prefixIconConstraints:
                                        BoxConstraints(maxWidth: 50),
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              // overlayColor:MaterialStateProperty.all(Colors.transparent) ,
                              // focusColor: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return MultiSelectDialog();
                                  },
                                );
                              },
                              child: Ink(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 10)],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Icon(
                                  Icons.filter_list_alt,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8,),

                        Wrap(
                          children: cubit.selectedItems
                              .map((item) => Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:  8.0),
                                    child: MyChip(label: item),
                                  ))
                              .toList(),
                        ),
                        SizedBox(height: 8,),
                        SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Search'),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11))),
                            )),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          'Top Question',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        StaggeredAnimatedList(questions: questions),
                      ],
                    ),
                  ),
                ),
            ],
          ),
              )),
        );
      },
    );
  }
}
