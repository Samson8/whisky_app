import 'package:whisky_app/models/history_model.dart';
import 'package:whisky_app/models/tasting_model.dart';

class BottleModel {
  final int? id;
  final String? imageUrl;
  final String? distillery;
  final String? region;
  final String? country;
  final String? type;
  final String? ageStatement;
  final String? filled;
  final String? bottled;
  final String? caskNumber;
  final String? abv;
  final String? cask;
  final String? finish;
  final int? available;
  final int? total;
  final History? history;
  final List<TastingNote>? tastingNotes;

  BottleModel({
    this.id,
    this.distillery,
    this.region,
    this.country,
    this.type,
    this.ageStatement,
    this.filled,
    this.bottled,
    this.caskNumber,
    this.abv,
    this.cask,
    this.finish,
    this.history,
    this.tastingNotes,
    this.imageUrl,
    this.available,
    this.total,
  });
  factory BottleModel.fromJson(Map<String, dynamic> json) {
    return BottleModel(
      id: json['id'],
      distillery: json['distillery'],
      region: json['region'],
      country: json['country'],
      type: json['type'],
      ageStatement: json['ageStatement'],
      filled: json['filled'],
      bottled: json['bottled'],
      caskNumber: json['caskNumber'],
      abv: json['abv'],
      cask: json['cask'],
      finish: json['finish'],
      history: History.fromJson(json['history']),
      imageUrl: json['imageUrl'],
      available: json['available'],
      total: json['total'],
      tastingNotes: (json['tastingNotes']['communityNotes'] as List)
          .map((note) => TastingNote.fromJson(note))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'distillery': distillery,
      'region': region,
      'country': country,
      'type': type,
      'ageStatement': ageStatement,
      'filled': filled,
      'bottled': bottled,
      'caskNumber': caskNumber,
      'abv': abv,
      'cask': cask,
      'finish': finish,
      'available': available,
      'total': total,
      'history': history?.toJson(),
      'tastingNotes': {
        'communityNotes': tastingNotes?.map((note) => note.toJson()).toList(),
      },
      'imageUrl': imageUrl,
    };
  }
}
