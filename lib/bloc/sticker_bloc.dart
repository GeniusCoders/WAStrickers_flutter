import 'dart:async';
import 'dart:convert';

import 'package:WAStickers/models/sticker_packs_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';
import 'package:meta/meta.dart';

import '../utils.dart';

part 'sticker_event.dart';
part 'sticker_state.dart';

class StickerBloc extends Bloc<StickerEvent, StickerState> {
  StickerBloc() : super(StickerInitial());

  @override
  Stream<StickerState> mapEventToState(
    StickerEvent event,
  ) async* {
    if (event is GetAllPackSticker) {
      yield LoadingState();
      String _data =
          await rootBundle.loadString("sticker_packs/all_packs.json");
      final response = json.decode(_data);
      StickerPackModel _pack = StickerPackModel.fromJson(response);
      yield AllStickerPack(_pack);
    }

    if (event is GetFeaturedSticker) {
      yield LoadingState();
      String _data =
          await rootBundle.loadString("sticker_packs/featured_pack.json");
      final response = json.decode(_data);
      StickerPackModel _pack = StickerPackModel.fromJson(response);
      yield FeaturedStickerPack(_pack);
    }

    if (event is AddSticker) {
      yield LoadingState();
      try {
        WhatsAppStickers().addStickerPack(
          packageName: WhatsAppPackage.Consumer,
          stickerPackIdentifier: event.id,
          stickerPackName: event.name,
          listener: (action, result, {error}) => processResponse(
            action: action,
            result: result,
            error: error,
            successCallback: () async* {
              yield StickerAdded();
            },
            context: event.context,
          ),
        );
      } catch (e) {
        yield StickerAddedFailed(error: e.toString());
      }
    }
  }
}
