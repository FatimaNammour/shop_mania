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
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                  Icons.arrow_back_ios), // Different icon for back button
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: ReactiveForm(
              formGroup: context.read<SearchBloc>().form,
              child: AppTextField(
                formName: "searchText",
                onChanged: (_) {},
                onFocus: () {},
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                fieldfocusNode: FocusNode(),
                autoFocus: true,
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
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

                        // avatar: CircleAvatar(
                        //   backgroundColor: Colors.grey.shade800,
                        //   child: const Text('AB'),
                        // ),
                        label: const Text('Aaron Burr'),
                      ),
                      Chip(
                        onDeleted: () {},
                        deleteIcon: const Icon(Icons.close),

                        // avatar: CircleAvatar(
                        //   backgroundColor: Colors.grey.shade800,
                        //   child: const Text('AB'),
                        // ),
                        label: const Text('Aaron Burr'),
                      ),
                      Chip(
                        onDeleted: () {},
                        deleteIcon: const Icon(Icons.close),

                        // avatar: CircleAvatar(
                        //   backgroundColor: Colors.grey.shade800,
                        //   child: const Text('AB'),
                        // ),
                        label: const Text('Aaron Burr'),
                      ),
                      Chip(
                        onDeleted: () {},
                        deleteIcon: const Icon(Icons.close),

                        // avatar: CircleAvatar(
                        //   backgroundColor: Colors.grey.shade800,
                        //   child: const Text('AB'),
                        // ),
                        label: const Text('Aaron Burr'),
                      ),
                      Chip(
                        onDeleted: () {},
                        deleteIcon: const Icon(Icons.close),

                        // avatar: CircleAvatar(
                        //   backgroundColor: Colors.grey.shade800,
                        //   child: const Text('AB'),
                        // ),
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
                    child: ListView(
                  children: const [
                    PobularSearchCard(
                      imagePath: "assets/jeans.jpg",
                      title: "title",
                      resultStatus: ResultStatus.hot,
                      subTitle: "subTitle",
                    ),
                    PobularSearchCard(
                      imagePath: "assets/jeans.jpg",
                      title: "title",
                      resultStatus: ResultStatus.neww,
                      subTitle: "subTitle",
                    ),
                    PobularSearchCard(
                      imagePath: "assets/jeans.jpg",
                      title: "title",
                      resultStatus: ResultStatus.pobular,
                      subTitle: "subTitle",
                    ),
                    PobularSearchCard(
                      imagePath: "assets/jeans.jpg",
                      title: "title",
                      resultStatus: ResultStatus.neww,
                      subTitle: "subTitle",
                    ),
                    PobularSearchCard(
                      imagePath: "assets/jeans.jpg",
                      title: "title",
                      resultStatus: ResultStatus.hot,
                      subTitle: "subTitle",
                    ),
                  ],
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
