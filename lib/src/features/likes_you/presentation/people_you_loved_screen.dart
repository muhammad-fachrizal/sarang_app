import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_app/src/common_widgets/people_you_loved_card_widget.dart';
import 'package:sarang_app/src/features/likes_you/presentation/bloc/people_loved/people_loved_bloc.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class PeopleYouLovedScreen extends StatefulWidget {
  static const String routeName = '/people-you-loved';
  const PeopleYouLovedScreen({super.key});

  @override
  State<PeopleYouLovedScreen> createState() => _PeopleYouLovedScreenState();
}

class _PeopleYouLovedScreenState extends State<PeopleYouLovedScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PeopleLovedBloc>().add(OnPeopleLovedEventCalled());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'People You\nLoved',
          textAlign: TextAlign.center,
          style: getWhiteTextStyle(
            fontWeight: FontWeightManager.semiBold,
            fontSize: FontSizeManager.f20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: AppSize.s30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: AppSize.s50,
          ),
          BlocBuilder<PeopleLovedBloc, PeopleLovedState>(
            builder: (context, state) {
              if (state is PeopleLovedLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PeopleLovedLoaded) {
                final users = state.userMatch;
                return users.isEmpty
                    ? Center(
                        child: Text(
                          'No Data User Match',
                          style: getWhiteTextStyle(),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return PeopleYouLovedCardWidget(
                              user: users[index],
                            );
                          },
                          itemCount: users.length,
                        ),
                      );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
