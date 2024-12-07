
import 'package:flutter/cupertino.dart';
import '../styles/colors.dart';
import 'dashedLine.dart';

class CutTicket extends StatefulWidget {
  const CutTicket({super.key});

  @override
  State<CutTicket> createState() => _CutTicketState();
}

class _CutTicketState extends State<CutTicket> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 15,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topRight: Radius.circular(100),bottomRight:Radius.circular(100) ),
            color: mainBlack,
          ),
        ),
        Expanded(
          child: DashedLine(
            color: thirdBlack,
            dashSpace: 7,
            dashWidth: 10,
          ),
        ),
        Container(
          height: 20,
          width: 15,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(100),bottomLeft:Radius.circular(100) ),
            color: mainBlack,
          ),
        ),
      ],
    );
  }
}
