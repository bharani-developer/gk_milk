import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gk_milk/utils/colors.dart' as c;

// ignore: must_be_immutable
// class BankingButton extends StatefulWidget {
//   static String tag = '/BankingButton';
//   var textContent;
//   VoidCallback onPressed;
//   var isStroked = false;
//   var height = 50.0;
//   var radius = 5.0;

//   BankingButton({required this.textContent, required this.onPressed, this.isStroked = false, this.height = 45.0, this.radius = 5.0});

//   @override
//   BankingButtonState createState() => BankingButtonState();
// }

// class BankingButtonState extends State<BankingButton> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onPressed,
//       child: Container(
//         height: widget.height,
//         padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
//         alignment: Alignment.center,
//         child: Text(
//           widget.textContent.toUpperCase(),
//           style: boldTextStyle(color: widget.isStroked ? c.primary : c.whitePureColor),
//         ).center(),
//         decoration: widget.isStroked
//             ? boxDecoration(
//                 bgColor: Colors.transparent,
//                 color: c.primary,
//               )
//             : boxDecoration(bgColor: c.Secondary, radius: widget.radius),
//       ),
//     );
//   }
// }

// Widget bankingOption(var icon, var heading, Color color) {
//   return Container(
//     padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
//     child: Row(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Image.asset(icon, color: color, height: 20, width: 20),
//             16.width,
//             Text(heading, style: primaryTextStyle()),
//           ],
//         ).expand(),
//         Icon(Icons.keyboard_arrow_right, color: c.TextColorSecondary),
//       ],
//     ),
//   );
// }

class TopCard extends StatelessWidget {
  final String name;
  final String acno;
  final String bal;

  const TopCard(
      {Key? key, required this.name, required this.acno, required this.bal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: context.height(),
      color: context.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.account_balance_wallet,
                        color: c.primary, size: 30)
                    .paddingOnly(top: 8, left: 8),
                Text(name, style: primaryTextStyle(size: 18))
                    .paddingOnly(left: 8, top: 8)
                    .expand(),
                const Icon(Icons.info, color: c.greyColor, size: 20)
                    .paddingOnly(right: 8)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Account Number", style: secondaryTextStyle(size: 16))
                  .paddingOnly(left: 8, top: 8, bottom: 8),
              Text(acno, style: primaryTextStyle(color: c.textColorYellow))
                  .paddingOnly(right: 8, top: 8, bottom: 8),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Balance", style: secondaryTextStyle(size: 16))
                  .paddingOnly(left: 8, top: 8, bottom: 8),
              Text(bal, style: primaryTextStyle(color: c.textLightGreenColor))
                  .paddingOnly(right: 8, top: 8, bottom: 8),
            ],
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
// class EditText extends StatefulWidget {
//   var isPassword;
//   var isSecure;
//   var fontSize;
//   var textColor;
//   var fontFamily;
//   var text;
//   var maxLine;
//   TextEditingController? mController;

//   VoidCallback? onPressed;

//   EditText({
//     var this.fontSize = textSizeNormal,
//     var this.textColor = c.TextColorPrimary,
//     var this.fontFamily = fontRegular,
//     var this.isPassword = true,
//     var this.isSecure = false,
//     var this.text = "",
//     var this.mController,
//     var this.maxLine = 1,
//   });

//   @override
//   State<StatefulWidget> createState() {
//     return EditTextState();
//   }
// }

// class EditTextState extends State<EditText> {
//   @override
//   Widget build(BuildContext context) {
//     if (!widget.isSecure) {
//       return TextField(
//         controller: widget.mController,
//         obscureText: widget.isPassword,
//         cursorColor: c.primary,
//         maxLines: widget.maxLine,
//         style: primaryTextStyle(),
//         decoration: InputDecoration(
//           hintText: widget.text,
//           hintStyle: primaryTextStyle(),
//           focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: c.primary, width: 0.5)),
//           enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: c.TextColorSecondary, width: 0.5)),
//         ),
//       );
//     } else {
//       return TextField(
//         controller: widget.mController,
//         obscureText: widget.isPassword,
//         cursorColor: c.primary,
//         style: primaryTextStyle(),
//         decoration: InputDecoration(
//             hintText: widget.text,
//             hintStyle: primaryTextStyle(),
//             suffixIcon: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   widget.isPassword = !widget.isPassword;
//                 });
//               },
//               child: Icon(
//                 widget.isPassword ? Icons.visibility : Icons.visibility_off,
//                 color: c.TextColorSecondary,
//               ),
//             ),
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: c.TextColorSecondary, width: 0.5),
//             ),
//             focusedBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: c.primary, width: 0.5),
//             )),
//       );
//     }
//   }
// }

// Widget headerView(var title, double height, BuildContext context) {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Icon(
//               Icons.chevron_left,
//               size: 25,
//               color: appStore.isDarkModeOn ? white : c.blackColor,
//             ).paddingAll(6).paddingOnly(top: spacing_standard).onTap(() {
//               finish(context);
//             }).paddingOnly(left: spacing_standard, right: spacing_standard_new, top: spacing_standard_new, bottom: spacing_standard),
//           ],
//         ),
//         Text(
//           title,
//           style: boldTextStyle(size: 30),
//         ).paddingOnly(left: spacing_standard_new, right: spacing_standard),
//       ],
//     ),
//   );
// }

// BoxDecoration boxDecoration({double radius = 2, Color color =Colors.transparent, Color? bgColor, var showShadow = false}) {
//   return BoxDecoration(
//     color: bgColor ?? appStore.scaffoldBackground,
//     boxShadow: showShadow ? defaultBoxShadow(shadowColor: shadowColorGlobal) : [BoxShadow(color: Colors.transparent)],
//     border: Border.all(color: color),
//     borderRadius: BorderRadius.all(Radius.circular(radius)),
//   );
// }
