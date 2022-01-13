
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/screens/web_view.dart';

Widget buildArticlsItems(articles,context){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> WebViewScreen(articles['url'])

      ));
    },
    child: Padding(
      padding: const EdgeInsetsDirectional.only(start: 15, top: 10, end: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                  image: NetworkImage(
                      "${articles['urlToImage']}"),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${articles['title']}",
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 30,
                ),
                // ignore: prefer_const_constructors
                Text(
                  "${articles['publishedAt']}",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keybordType,
  required String lable,
  required IconData prefix,
  required validateText,
  Function? sufixPressed,
  Function? onTap,
  Function? onChange,
  Function? onSubmitted,
  bool obsecureText = false,
  IconData? sufix,
}) =>
    TextFormField(
        keyboardType: keybordType,
        obscureText: obsecureText,
        onFieldSubmitted: (value){
          onSubmitted!(value);
        },
        onChanged: (value){
          onChange!(value);
        },
        validator: (String? value) {
    if (value!.isEmpty) {
    return validateText;
    }

    return null;
    },
        controller: controller,
        onTap: () {
          onTap!();
        },
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: const TextStyle(color: Colors.grey,),
          prefixIcon: Icon(prefix,color: Colors.grey,),
          suffixIcon: sufix != null
              ? IconButton(
            icon: Icon(sufix,color: Colors.grey,),
            onPressed: () {
              sufixPressed!();
            },
          )
              : null,
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
          ),
        ));
