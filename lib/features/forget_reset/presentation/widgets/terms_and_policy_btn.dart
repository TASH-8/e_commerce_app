import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class TermsAndPolicyBTN extends StatelessWidget {
  const TermsAndPolicyBTN({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle terms of service click
      },
      child: const AutoSizeText(
        Constants.TermsAndPolicy,
        style: TextStyles.font15redAccentBold,
        textAlign: TextAlign.center,
        maxLines: 1,
      ),
    );
  }
}
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:e_commerce_app/core/theming/text_styles.dart';
// import 'package:e_commerce_app/core/utils/constants.dart';
// import 'package:flutter/material.dart';

// class TermsAndPolicyBTN extends StatelessWidget {
//   const TermsAndPolicyBTN({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _showTermsAndPolicyDialog(context);
//       },
//       child: const AutoSizeText(
//         Constants.TermsAndPolicy,
//         style: TextStyles.font15redAccentBold,
//         textAlign: TextAlign.center,
//         maxLines: 1,
//       ),
//     );
//   }

//   void _showTermsAndPolicyDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "Terms and Services",
//                   style: TextStyles.font31BlackBold,
//                 ),
//                 const SizedBox(height: 16.0),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Text(
//                       'dddddddddddddddddddddddddddddddddddddddddd jkkkkkkkkkkkkkkkkkkkkkkkk dffffff', // Replace with full terms text
//                       style: TextStyles.font17GreyNormal,
//                       textAlign: TextAlign.justify,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:  Colors.redAccent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   child: const Text("Close"),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
