part of 'sticker_bloc.dart';

@immutable
abstract class StickerEvent {}

class GetFeaturedSticker extends StickerEvent {}

class GetAllPackSticker extends StickerEvent {}
