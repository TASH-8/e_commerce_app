import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_app/core/theming/colors_manger.dart';
import 'package:e_commerce_app/core/theming/text_styles.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/appbar_builder.dart';
import 'package:e_commerce_app/features/more/presentation/bloc/logout_bloc.dart';
import 'package:e_commerce_app/features/more/presentation/widgets/more_actions_lists.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/side_custom_padding.dart';
import 'package:e_commerce_app/core/widgets/custom_list_tile_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: buildHomeScreenAppBar(
          backgroundColor: Colors.grey.shade100,
          context: context,
        ),
      ),
      backgroundColor: ColorManger.greyshade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SidesCustomPadding(
              child: AutoSizeText(
                Constants.MORE,
                style: TextStyles.font35CustomGreyBold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            SidesCustomPadding(
              child: CustomListTilesActions(
                items: moreItems1,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            SidesCustomPadding(
              child: CustomListTilesActions(
                items: moreItems2,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Center(
              child: BlocConsumer<LogoutBloc, LogoutState>(
                listener: (context, state) {
                  if (state.status == LogoutStatus.error) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.bottomSlide,
                      title: Constants.ERROR,
                      desc: state.messege,
                    ).show();
                  } else if (state.status == LogoutStatus.success) {
                    context.pushReplacement('/login');
                  } else if (state.status == LogoutStatus.loading) {
                    //make it later
                  }
                },
                builder: (context, state) {
                  return TextButton(
                    onPressed: () async {
                      context.read<LogoutBloc>().add(LogUserOutEvent());
                    },
                    child: const AutoSizeText(
                      Constants.LOGOUT,
                      textAlign: TextAlign.center,
                      style: TextStyles.font16RedAccentNormal,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
