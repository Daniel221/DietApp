import 'package:equatable/equatable.dart';

class Sub extends Equatable {
	final String? label;
	final String? tag;
	final String? schemaOrgTag;
	final double? total;
	final bool? hasRdi;
	final double? daily;
	final String? unit;

	const Sub({
		this.label, 
		this.tag, 
		this.schemaOrgTag, 
		this.total, 
		this.hasRdi, 
		this.daily, 
		this.unit, 
	});

	factory Sub.fromJson(Map<String, dynamic> json) => Sub(
				label: json['label'] as String?,
				tag: json['tag'] as String?,
				schemaOrgTag: json['schemaOrgTag'] as String?,
				total: (json['total'] as num?)?.toDouble(),
				hasRdi: json['hasRDI'] as bool?,
				daily: (json['daily'] as num?)?.toDouble(),
				unit: json['unit'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'label': label,
				'tag': tag,
				'schemaOrgTag': schemaOrgTag,
				'total': total,
				'hasRDI': hasRdi,
				'daily': daily,
				'unit': unit,
			};

	@override
	List<Object?> get props {
		return [
				label,
				tag,
				schemaOrgTag,
				total,
				hasRdi,
				daily,
				unit,
		];
	}
}
