part of 'sticker_bloc.dart';

@immutable
abstract class StickerEvent {}

class GetFeaturedSticker extends StickerEvent {}

class GetAllPackSticker extends StickerEvent {}

class AddSticker extends StickerEvent {
  final String id;
  final String name;
  final BuildContext context;
  AddSticker({@required this.id, @required this.name, @required this.context});
}
