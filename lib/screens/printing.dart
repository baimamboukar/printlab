import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:silver_printings/models/models.dart';
import 'package:silver_printings/utils/utils.dart';
import 'package:silver_printings/widgets/widgets.dart';

class Printing extends StatefulWidget {
  const Printing({Key key}) : super(key: key);

  @override
  _PrintingState createState() => _PrintingState();
}

int _currentStep = 0;

class _PrintingState extends State<Printing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Printing Services",
            style: GoogleFonts.ruluko(
                fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Stepper(
          currentStep: _currentStep,
          type: StepperType.horizontal,
          onStepContinue: () {
            setState(() {
              if (_currentStep < 5) {
                _currentStep = _currentStep + 1;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (_currentStep > 0) {
                _currentStep = _currentStep - 1;
              }
            });
          },
          steps: [
            Step(
                title: Text("File"),
                content: Column(
                  children: [
                    Center(
                      child: Container(
                          height:
                              ScreenSize().getScreenSize(context).height * 0.4,
                          width:
                              ScreenSize().getScreenSize(context).width * 0.90,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [BoxShadow()]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LineIcons.archiveFile,
                                size: 54.0,
                              ),
                              Text("No file selected....",
                                  style: TextStyle(fontSize: 20.0))
                            ],
                          )),
                    ),
                    const SizedBox(height: 20.0),
                    OutlinedButton.icon(
                      onPressed: () {
                        final document = Document.pick();
                      },
                      icon: Icon(LineIcons.fileImport),
                      label: Text("Choose file"),
                    )
                  ],
                )),
            Step(
                title: Text("Details"),
                content: Center(child: detailsBuilder())),
            Step(title: Text("Confirm"), content: confirmationBuilder()),
            Step(
                title: Text("Payment"),
                content: Center(child: Text("Invoke Payment APIs")))
          ]),
    ));
  }
}

Widget detailsBuilder() {
  return Expanded(
      child: Column(
    children: [
      Center(child: Text("GIVE DETAILS")),
      InputBox(icon: LineIcons.phone, hintText: "Phone number"),
      InputBox(icon: LineIcons.mapMarker, hintText: "Rond Point Bastos, 526"),
      FlutterSlider(
        min: 1,
        max: 100,
        tooltip: FlutterSliderTooltip(custom: (value) {
          return Text("$value Copies");
        }),
        trackBar: FlutterSliderTrackBar(
          inactiveTrackBar: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black12,
            border: Border.all(width: 3, color: Colors.blue),
          ),
          activeTrackBar: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue.withOpacity(0.5)),
        ),
        values: [10.0, 20.0, 30.0, 40.0, 50.0],
      ),
      Container(
        height: 180.0,
        child: ListView(
          primary: true,
          scrollDirection: Axis.horizontal,
          children: [
            buildFormat("A4", 80.0, 55.0),
            buildFormat("A3", 100.0, 75.0),
            buildFormat("A2", 120.0, 85.0),
            buildFormat("A1", 140.0, 105.0),
          ],
        ),
      )
    ],
  ));
}

Widget buildFormat(String name, double height, double width) {
  bool isSelected = false;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        isSelected = true;
        print("tapped");
      },
      onTapCancel: () {
        isSelected = false;
      },
      child: Expanded(
        child: Column(
          children: [
            Card(
                child: Container(
                    child: Center(
                      child: Text(name),
                    ),
                    height: height,
                    width: height,
                    color: isSelected ? Colors.cyan : Colors.grey.shade200)),
          ],
        ),
      ),
    ),
  );
}

Widget confirmationBuilder() {
  return Expanded(
      child: Container(
    height: 482.0,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Logo(font: 28.0), Text("Order N* 8113-2021-10-05")],
            ),
            const SizedBox(height: 30.0),
            Text("Names: Mr Ubah Johnson"),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(LineIcons.pdfFile, color: Colors.red),
                Text("Document: weddingcard.pdf"),
                Text("180 pages"),
              ],
            ),
            const SizedBox(height: 30.0),
            Text("250 copies with colour"),
            const SizedBox(height: 30.0),
            Text("Delevering adress: Rond Point Nglonkak, Regionale"),
            const SizedBox(height: 30.0),
            Text("Phone number: (+237) 699982255"),
            const SizedBox(height: 30.0),
            Container(
              height: 150.0,
              width: 300.0,
              color: Colors.cyan.shade300,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Price: "), Text("XAF 12,500")]),
                      const SizedBox(height: 10.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Delevry fee: "), Text("XAF 1500")]),
                      const SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                              child:
                                  Icon(LineIcons.paypal, color: Colors.purple)),
                          CircleAvatar(
                              child:
                                  Icon(LineIcons.stripe, color: Colors.blue)),
                          CircleAvatar(
                              child: Icon(LineIcons.creditCard,
                                  color: Colors.black))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  ));
}
