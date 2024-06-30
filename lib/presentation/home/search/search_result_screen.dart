import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shop_mania/business_logic/main_home/search/search_bloc.dart';
import 'package:shop_mania/core/theme.dart';
import 'package:shop_mania/core/widgets/app_text_field.dart';

import '../widgets/arrifal_card.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

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
                suffixIcon: const Icon(Icons.sort),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Chip(
                          label: Text("All"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Chip(
                          label: Text("Latest"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Chip(
                          label: Text("Most Popular"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Chip(
                          label: Text("Cheapest"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: 90,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                            leading: Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage("imagePath"),
                                      fit: BoxFit.fill),
                                  color: ConstColors.fieldFilled),
                            ),
                            subtitle: const Text("tyguiyui"),
                            title: const Text("title"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: ConstColors.fieldFilled,
                                )))
                      ],
                    )),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 10,
                              childAspectRatio: 100 / 130),
                      itemBuilder: (context, int index) {
                        return const ArrifalCard(
                          productName: "Product name",
                          storeName: "store name",
                          price: "2151",
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
