import 'package:equatable/equatable.dart';

class Fams extends Equatable {
	final String? label;
	final double? quantity;
	final String? unit;

	const Fams({this.label, this.quantity, this.unit});

	factory Fams.fromJson(Map<String, dynamic> json) => Fams(
				label: json['label'] as String?,
				quantity: (json['quantity'] as num?)?.toDouble(),
				unit: json['unit'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'label': label,
				'quantity': quantity,
				'unit': unit,
			};

	@override
	List<Object?> get props => [label, quantity, unit];
}
