// import 'package:flutter/material.dart';

// import '../../../widgets/login_signin_tabar.dart';

// class AuthScreen extends StatelessWidget {
//   const AuthScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       resizeToAvoidBottomInset: true,
//       // ! makes the screen scrollable when typing forms. it removes overflow problem
//       body: SingleChildScrollView(
//         // ! very important. column needs to be given a fixed height when its inside a scroll view
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             children: [
//               const Expanded(
//                 flex: 3,
//                 child: SizedBox(),
//               ),
//               // ! main content of screen.
//               Expanded(
//                 flex: 5,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(26),
//                         topRight: Radius.circular(26),
//                         bottomLeft: Radius.circular(26),
//                         bottomRight: Radius.circular(26),
//                       ),
//                     ),
//                     // * container styling
//                     child: const LoginSigninTabBar(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }