import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../util/colors.dart';

class UlasanPage extends StatelessWidget {
  const UlasanPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: kotakColor, borderRadius: BorderRadius.circular(12)),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.home,
                  color: primerColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "GetHealth+ Dramaga Bogor",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(6.0),
            child: Divider(
              height: 10,
              thickness: 2,
              color: Color(0xffA1D1E0),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return const UlasanItem();
            },
          ),
        ],
      ),
    );
  }
}

class UlasanItem extends StatelessWidget {
  const UlasanItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Panadol Paracetamol/Panadol Biru 60gr",
                        style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xff6BBD44),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text('Resep Terverifikasi',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.white)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                                color: primerColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Beri Ulasan",
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 10.93,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.25,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Divider(
            height: 10,
            thickness: 2,
            color: Color(0xffA1D1E0),
          ),
        ),
      ],
    );
  }
}
