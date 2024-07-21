import 'package:equatable/equatable.dart';

import 'source.dart';

class CategoresModel extends Equatable {
  final String? status;
  final List<Source>? sources;

  const CategoresModel({this.status, this.sources});

  factory CategoresModel.fromJson(Map<String, dynamic> json) {
    return CategoresModel(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'sources': sources?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, sources];
}
