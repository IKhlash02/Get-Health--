import 'package:flutter/material.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildText extends StatelessWidget {
  final String deskripsi;
  final String indikasi;
  final bool isReadmore;
  final String komposisi;
  final String kontraindikasi;
  final String aturanPakai;
  final String efekSamping;
  final String perhatian;

  const BuildText({
    super.key,
    required this.deskripsi,
    required this.isReadmore,
    required this.indikasi,
    required this.komposisi,
    required this.kontraindikasi,
    required this.aturanPakai,
    required this.efekSamping,
    required this.perhatian,
  });

  @override
  Widget build(BuildContext context) {
    final lines = isReadmore ? null : 4;
    return RichText(
        maxLines: lines,
        overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
            text: "Deskripsi",
            style: GoogleFonts.montserrat(
                fontSize: 16.64,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n\n$deskripsi",
            style: GoogleFonts.plusJakartaSans(
                fontSize: 12.73,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n\nINDIKASI",
            style: GoogleFonts.montserrat(
                fontSize: 16.64,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n$indikasi",
            style: GoogleFonts.plusJakartaSans(
                fontSize: 12.73,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n\nKOMPOSISI",
            style: GoogleFonts.montserrat(
                fontSize: 16.64,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n$komposisi",
            style: GoogleFonts.plusJakartaSans(
                fontSize: 12.73,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n\nKONTRAINDIKASI",
            style: GoogleFonts.montserrat(
                fontSize: 16.64,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n$kontraindikasi",
            style: GoogleFonts.plusJakartaSans(
                fontSize: 12.73,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n\nATURAN PAKAI",
            style: GoogleFonts.montserrat(
                fontSize: 16.64,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n$aturanPakai",
            style: GoogleFonts.plusJakartaSans(
                fontSize: 12.73,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n\nPERHATIAN",
            style: GoogleFonts.montserrat(
                fontSize: 16.64,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n$perhatian",
            style: GoogleFonts.plusJakartaSans(
                fontSize: 12.73,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n\nEFEK SAMPING",
            style: GoogleFonts.montserrat(
                fontSize: 16.64,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
          TextSpan(
            text: "\n$efekSamping",
            style: GoogleFonts.plusJakartaSans(
                fontSize: 12.73,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                color: AppColors.textColor),
          ),
        ]));
  }
}
