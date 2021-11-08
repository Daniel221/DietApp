import 'package:equatable/equatable.dart';

class Vitc extends Equatable {
	final String? label;
	final double? quantity;
	final String? unit;

	const Vitc({this.label, this.quantity, this.unit});

	factory Vitc.fromJson(Map<String, dynamic> json) => Vitc(
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
