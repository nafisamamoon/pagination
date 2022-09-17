// import 'package:flutter/material.dart';
// import 'package:mytests/shop-multi-user/apiresponse.dart';
// import 'package:mytests/shop-multi-user/constant.dart';
// import 'package:mytests/shop-multi-user/user-model.dart';
// import 'package:mytests/shop-multi-user/user-service.dart';
// class Login extends StatefulWidget {
//   const Login({ Key? key }) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final GlobalKey<FormState> formkey=GlobalKey<FormState>();
//   TextEditingController txtEmail=TextEditingController();
//   TextEditingController txtPassword=TextEditingController();
//   bool load=false;
//   void _loginUser()async{
// ApiResponse response=await login(txtEmail.text, txtPassword.text);
// if(response.error == null){
// _saveAndRedirectToHome(response.data as User);
// }else{
//   setState(() {
//     load=false;
//   });
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}')));
// }
//   }
//   void _saveAndRedirectToHome(User user)async{
// // SharedPreferences pref=await SharedPreferences.getInstance();
// await pref.setString('token', user.token ?? '');
// await pref.setInt('userId', user.id ?? 0);
// // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Home()), (route) => false);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//         centerTitle: true,
//       ),
//       body: Form(
//         key: formkey,
//         child: ListView(
//           padding: EdgeInsets.all(30),
//           children: [
//             TextFormField(
//               controller: txtEmail,
//               validator: (val)=>val!.isEmpty ? 'invalid email address': null,
//               keyboardType: TextInputType.emailAddress,
// decoration: kInputDecoration('Email')
//             ),
//             SizedBox(height: 10,),
//              TextFormField(
//               controller: txtPassword,
//               validator: (val)=>val!.isEmpty ? 'required': null,
//               keyboardType: TextInputType.emailAddress,
// decoration: kInputDecoration('Password')
//             ),
//             SizedBox(height: 10,),
//             load ? Center(child: CircularProgressIndicator(),):
//             kTextButton('Login', (){
//               if(formkey.currentState!.validate()){
//   setState(() {
//     load=true;
//     _loginUser();
//   });
// }
//             }),
          
//              SizedBox(height: 10,),
//             kLoginRegisterHint('Dont have an account?', 'Register', (){
//               //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Register()), (route) => false);
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }