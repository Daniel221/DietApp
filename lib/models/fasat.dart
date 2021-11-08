import 'package:equatable/equatable.dart';

class Fasat extends Equatable {
	final String? label;
	final double? quantity;
	final String? unit;

	const Fasat({this.label, this.quantity, this.unit});

	factory Fasat.fromJson(Map<String, dynamic> json) => Fasat(
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
