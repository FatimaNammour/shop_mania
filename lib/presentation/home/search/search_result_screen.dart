import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shop_mania/business_logic/main_home/search/search_bloc.dart';
import 'package:shop_mania/core/theme.dart';
import 'package:shop_mania/core/widgets/app_text_field.dart';

import '../widgets/arrifal_card.dart';
import '../widgets/slider_widget.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, currentState) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
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
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          fieldfocusNode: FocusNode(),
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    enableDrag: true,
                                    showDragHandle: true,
                                    context: context,
                                    builder: (context) => Container(
                                          decoration: const BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left: Radius.circular(20),
                                                      right:
                                                          Radius.circular(20))),
                                          child: ListView(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            children: [
                                              Center(
                                                child: Text("Filter By",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Price",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                  const Text("\$0-\$80"),
                                                ],
                                              ),
                                              SliderTheme(
                                                data: const SliderThemeData(
                                                  trackHeight: 2,
                                                  thumbColor: ConstColors.white,
                                                  thumbShape: AppSliderShape(
                                                      thumbRadius: 10),
                                                  valueIndicatorShape:
                                                      PaddleSliderValueIndicatorShape(),
                                                ),
                                                child: Slider(
                                                  value: 10,
                                                  min: 0,
                                                  max: 100,
                                                  divisions: 5,
                                                  label: 10.round().toString(),
                                                  onChanged: (double value) {
                                                    // setState(() {
                                                    //   _currentValue = value;
                                                    // });
                                                  },
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Color",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                  const Text("Black"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 50,
                                                child: ListView.separated(
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const SizedBox(
                                                    width: 30,
                                                  ),
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Container(
                                                      width: 20.0,
                                                      height: 20.0,
                                                      decoration:
                                                          const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: ConstColors
                                                                  .fieldFilled),
                                                    );
                                                  },
                                                  itemCount: 6,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Lcation",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 50,
                                                child: ListView.separated(
                                                  itemCount: 6,
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const SizedBox(
                                                    width: 20,
                                                  ),
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          ChipTheme(
                                                    data: ChipThemeData(
                                                        labelStyle:
                                                            const TextStyle(
                                                                color: ConstColors
                                                                    .primary),
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                                side:
                                                                    BorderSide(
                                                                  color: ConstColors
                                                                      .fieldFilled,
                                                                )),
                                                        color:
                                                            WidgetStateProperty
                                                                .all<Color>(
                                                          ConstColors.white,
                                                        )),
                                                    child: const Chip(
                                                      label: Text("Cheapest"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 30),
                                              ElevatedButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                      "Apply filter"))
                                            ],
                                          ),
                                        ));
                              },
                              icon: const Icon(Icons.sort)),
                          onTapSuffixIcon: () {},
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
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
                                      image: AssetImage("assets/jeans.jpg"),
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
