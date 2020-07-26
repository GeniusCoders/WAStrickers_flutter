import 'package:WAStickers/bloc/sticker_bloc.dart';
import 'package:WAStickers/data/all_pack.dart';
import 'package:WAStickers/data/featured.dart';
import 'package:WAStickers/models/sticker_packs_model.dart';
import 'package:WAStickers/pages/home_page/widgets/featured_banners.dart';
import 'package:WAStickers/pages/home_page/widgets/home_pack_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/container_title.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StickerPackModel featuredStickerList;
  StickerPackModel allStickerList;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<StickerBloc>(context).add(GetFeaturedSticker());
    BlocProvider.of<StickerBloc>(context).add(GetAllPackSticker());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StickerBloc, StickerState>(
      listener: (context, state) {
        if (state is AllStickerPack) {
          final data = state.stickerPackModel;
          allStickerList = data;
        }
        if (state is FeaturedStickerPack) {
          final data = state.stickerPackModel;
          featuredStickerList = data;
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (allStickerList != null && featuredStickerList != null) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FeaturedBanner(),
                  SizedBox(
                    height: 10,
                  ),
                  ContainerTitle(
                    str: 'Featured',
                    stickerPackModel: featuredStickerList,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  HomePackList(
                    data: featuredData,
                    stickerPackModel: featuredStickerList,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ContainerTitle(
                    str: 'All Packs',
                    stickerPackModel: allStickerList,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  HomePackList(
                    data: allPackData,
                    stickerPackModel: allStickerList,
                  )
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
