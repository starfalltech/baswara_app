import 'package:baswara_app/core/color_value.dart';
import 'package:baswara_app/homeUser/presentation/widgets/riwayat_berlangsung_widget.dart';
import 'package:baswara_app/homeUser/presentation/widgets/riwayat_selesai_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RiwayatUserWidget extends StatefulWidget {
  const RiwayatUserWidget({super.key});

  @override
  State<RiwayatUserWidget> createState() => _RiwayatUserWidgetState();
}

class _RiwayatUserWidgetState extends State<RiwayatUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorValue.primary,
            bottom: const TabBar(
              indicatorPadding: EdgeInsets.only(bottom: 8),
              tabs: [
                Tab(
                  text: "Berlangsung",
                ),
                Tab(
                  text: "Selesai",
                ),
              ],
            ),
            centerTitle: true,
            title: Text(
              'Riwayat',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          body: const TabBarView(
            children: [
              RiwayatBerlangsungWidget(),
              RiwayatSelesaiWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
