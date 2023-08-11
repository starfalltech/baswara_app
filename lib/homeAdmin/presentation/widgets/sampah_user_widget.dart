import 'package:baswara_app/core/color_value.dart';
import 'package:baswara_app/homeAdmin/domain/repositories/admin_repository.dart';
import 'package:baswara_app/homeAdmin/presentation/widgets/user_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../core/utility.dart';
import '../../../widget/no_internet_dialog.dart';
import '../manager/admin_bloc.dart';

class SampahUserWidget extends StatelessWidget {
  const SampahUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: BlocProvider(
        create: (context) =>
            AdminBloc(RepositoryProvider.of<AdminRepository>(context))..add(GetAlluser()),
        child: BlocBuilder<AdminBloc, AdminState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(
                  const Duration(),
                  () {
                    BlocProvider.of<AdminBloc>(context).add(GetAlluser());
                  },
                );
                return;
              },
              child: Stack(
                children: [
                  ListView(),
                  BlocConsumer<AdminBloc, AdminState>(
                    listener: (context, state) {
                      if (state is NoConnection) {
                        context.loaderOverlay.hide();
                        showDialog(
                            context: context,
                            builder: (context) => const NoInternetDialog());
                      }
                      if (state is SuccesProductCRUD) {
                        context.loaderOverlay.hide();
                        BlocProvider.of<AdminBloc>(context).add(GetAlluser());
                      }
                      if (state is LoadingAdminState) {
                        context.loaderOverlay.show();
                      }
                      if (state is FailureAdminState) {
                        context.loaderOverlay.hide();
                        Utility(context).showSnackbar(state.msg);
                      }
                    },
                    builder: (context, state) {
                      if (state is SuccesGetAllUser) {
                        context.loaderOverlay.hide();
                        return Container(
                          margin: const EdgeInsets.only(
                              top: 20, left: 16, right: 16),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: const BoxDecoration(
                                  color: Color(0xffE2FAE1),
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "No",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        "Nama",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: Text(
                                          "Saldo",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: Text(
                                          "Aksi",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.data.length,
                                  itemBuilder: (c, index) => UserItemWidget(
                                    index: index,
                                    user: state.data[index],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
