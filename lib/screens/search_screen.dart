import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componentes/components.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_status.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  String? onchangevalue;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: defaultFormField(
                            controller: searchController,
                            validateText: "Input Search",
                            keybordType: TextInputType.text,
                            lable: "search",
                            obsecureText: false,
                            prefix: Icons.search,
                            onSubmitted: (value) {
                              NewsCubit.get(context).getSearch(value);
                            }
                      ),)
                    ],
                  ),
                ),
                ConditionalBuilder(
                  condition: list.length > 0,
                  builder: (context) => Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            buildArticlsItems(list[index], context),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount: 10),
                  ),
                  fallback: (BuildContext context) => Center(
                    child: Container(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
