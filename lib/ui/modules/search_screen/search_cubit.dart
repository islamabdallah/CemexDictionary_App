import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  static SearchCubit get(context) => BlocProvider.of(context);

  List<String>  items = ['test1','test2','test3'];
  List<String> selectedItems =[];

  SearchCubit() : super(SearchInitial());

  getItems(){
    items = ['test1','test2','test3'];
  }

  onItemCheckedChange(item,checked){
    print(checked);
    if(!checked){
      selectedItems.add(item);
    } else{
      selectedItems.remove(item);
    }

    print(selectedItems);
    emit(ItemCheckedChange());
  }

}
