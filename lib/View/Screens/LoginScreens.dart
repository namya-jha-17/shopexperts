import 'package:cocktail/Model/UserResponse.dart';
import 'package:cocktail/View/Screens/ListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/User.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
 final  TextEditingController emailcontroller=TextEditingController();
 final TextEditingController passwordController =TextEditingController();
UserApiService userApiService =UserApiService();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [

          Text("Login Here"),
          TextFormField(
            controller: emailcontroller,
            decoration: InputDecoration(hintText: "email"),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(hintText: "password"),
          ),

          ElevatedButton(onPressed: ()async{
           List<User> user= await  userApiService.getData();
           for(int i=0;i<user.length;i++){
            if (emailcontroller.text==user[i].email)
           {
            if (passwordController.text==user[i].password){
              Navigator.push
                (
                context, MaterialPageRoute(
                  builder: (context)=>ListScreen(),),);
            }

           }

           }
          }, child: Text("Login"))
        ],

    ),
    );
  }
}
