import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shop_mania/business_logic/main_home/search/search_bloc.dart';
import 'package:shop_mania/core/constant/enums.dart';
import 'package:shop_mania/core/widgets/app_text_field.dart';
import 'package:shop_mania/presentation/home/search/pobular_search_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, currentState) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons
                          .arrow_back_ios), // Different icon for back button
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: ReactiveForm(
                        formGroup: context.read<SearchBloc>().form,
                        child: AppTextField(
                          formName: "searchText",
                          onChanged: (_) {},
                          onFocus: () {},
                          onSubmitted: (_) {
                            Navigator.of(context).pushNamed(
                              '/SearchResultScreen',
                            );
                          },
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          fieldfocusNode: FocusNode(),
                          autoFocus: true,
                          prefixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Last Search",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(onPressed: () {}, child: const Text("Clear All"))
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.start,
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      Chip(
                        onDeleted: () {},
                        deleteIcon: const Icon(Icons.close),
                        label: const Text('Aaron Burr'),
                      ),
                      Chip(
                        onDeleted: () {},
                        deleteIcon: const Icon(Icons.close),
                        label: const Text('Aaron Burr'),
                      ),
                      Chip(
                        onDeleted: () {},
                        deleteIcon: const Icon(Icons.close),
                        label: const Text('Aaron Burr'),
                      ),
                      Chip(
                        onDeleted: () {},
                        deleteIcon: const Icon(Icons.close),
                        label: const Text('Aaron Burr'),
                      ),
                      Chip(
                        onDeleted: () {},
                        deleteIcon: const Icon(Icons.close),
                        label: const Text('Aaron Burr'),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Pobular Search",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Expanded(
                    child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 4,
                  ),
                  itemBuilder: (context, index) => const PobularSearchCard(
                    imagePath: "assets/jeans.jpg",
                    title: "title",
                    resultStatus: ResultStatus.hot,
                    subTitle: "subTitle",
                  ),
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
