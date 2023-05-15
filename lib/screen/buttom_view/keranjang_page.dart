import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/colors.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("KERANJANG SAYA",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(
                      "(99)",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.15,
                          color: tulisanColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    bool isChecked = true;
                    return KeranjanItem(
                      isChecked: isChecked,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Total:",
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14.73,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.25,
                          color: tulisanColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Text(
                        "Rp. 100.000",
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 14.73,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.25,
                            color: tulisanColor),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: aksenColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "Checkout",
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 12.73,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.25,
                              color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class KeranjanItem extends StatefulWidget {
  late bool isChecked;
  KeranjanItem({super.key, required this.isChecked});

  @override
  State<KeranjanItem> createState() => _KeranjanItemState();
}

class _KeranjanItemState extends State<KeranjanItem> {
  @override
  Widget build(BuildContext context) {
    bool isItemCheck = false;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: kotakColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                Checkbox(
                    value: widget.isChecked,
                    activeColor: primerColor,
                    onChanged: (value) {
                      setState(() {
                        widget.isChecked = value!;
                        isItemCheck = value;
                      });
                    }),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "GetHealth+ Dramaga Bogor",
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.25,
                      color: tulisanColor),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              bool isRight = isItemCheck;
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 3.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Divider(
                        height: 10,
                        thickness: 2,
                        color: Color(0xffA1D1E0),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isRight,
                            activeColor: primerColor,
                            onChanged: (value) {
                              setState(() {
                                isRight = value!;
                              });
                            }),
                        Container(
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: const Icon(
                              Icons.local_shipping_outlined,
                              size: 60,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Paracetamol',
                                      style: GoogleFonts.plusJakartaSans(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.25,
                                          color: tulisanColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: aksenColor,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Text(
                                    'Variasi: xxxx ',
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 10.7,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1.25,
                                        color: tulisanColor),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 11.69,
                                      width: 10.52,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            side: const BorderSide(
                                                width: 0.5, color: primerColor),
                                            padding: const EdgeInsets.all(0)),
                                        onPressed: () {
                                          // if (count != 0) {
                                          //   setState(() {
                                          //     count--;
                                          //   });
                                          // }
                                        },
                                        child: const Center(
                                          child: Text(
                                            '-',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 9),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "99",
                                      style: GoogleFonts.plusJakartaSans(
                                          fontSize: 9.7,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.25,
                                          color: tulisanColor),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    SizedBox(
                                      height: 11.69,
                                      width: 10.52,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          side: const BorderSide(
                                              width: 0.5, color: primerColor),
                                          padding: const EdgeInsets.all(0),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            " count = count + 1";
                                          });
                                        },
                                        child: const Center(
                                          child: Text(
                                            '+',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 9),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 12,
                                    ),
                                    const Icon(
                                      Icons.delete,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
