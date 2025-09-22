import 'package:book_app/features/search/presentation/views/widgets/search_resalt_list_view.dart';
import 'package:book_app/features/search/presentation/views/widgets/search_result_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import '../search_cubit/search_cubit.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          CustomSearchTextField(
            onSubmitted: (data)  {
              BlocProvider.of<SearchCubit>(context)
                  .fetchSearchResult(bookName: data);
              controller.clear();
            },
            controller: controller,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Search Result', style: Styles.textStyle18)),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child:
            SearchResultListViewBlocBuilder()
               ),

        ],
      ),
    );
  }
}
