// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mp_media.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MpMediaAdapter extends TypeAdapter<MpMedia> {
  @override
  final int typeId = 1;

  @override
  MpMedia read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MpMedia(
      tmdbID: fields[0] as int,
      title: fields[1] as String,
      posterUrl: fields[2] as String,
      backdropUrl: fields[3] as String,
      averageVote: fields[4] as double,
      releaseDate: fields[5] as String,
      overview: fields[6] as String,
      isMovie: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MpMedia obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.tmdbID)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterUrl)
      ..writeByte(3)
      ..write(obj.backdropUrl)
      ..writeByte(4)
      ..write(obj.averageVote)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.isMovie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MpMediaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
