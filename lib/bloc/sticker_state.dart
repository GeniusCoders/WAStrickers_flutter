part of 'sticker_bloc.dart';

@immutable
abstract class StickerState {}

class StickerInitial extends StickerState {}

class LoadingState extends StickerState {}

class AllStickerPack extends StickerState {
  final StickerPackModel stickerPackModel;

  AllStickerPack(this.stickerPackModel);
}

class FeaturedStickerPack extends StickerState {
  final StickerPackModel stickerPackModel;

  FeaturedStickerPack(this.stickerPackModel);
}

class StickerAdded extends StickerState {}

class StickerAddedFailed extends StickerState {
  final String error;

  StickerAddedFailed({required this.error});
}
