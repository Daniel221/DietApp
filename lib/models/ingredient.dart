import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
	final String? text;
	final double? quantity;
	final String? measure;
	final String? food;
	final double? weight;
	final String? foodCategory;
	final String? foodId;
	final String? image;

	const Ingredient({
		this.text, 
		this.quantity, 
		this.measure, 
		this.food, 
		this.weight, 
		this.foodCategory, 
		this.foodId, 
		this.image, 
	});

	factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
				text: json['text'] as String?,
				quantity: (json['quantity'] as num?)?.toDouble(),
				measure: json['measure'] as String?,
				food: json['food'] as String?,
				weight: (json['weight'] as num?)?.toDouble(),
				foodCategory: json['foodCategory'] as String?,
				foodId: json['foodId'] as String?,
				image: json['image'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'text': text,
				'quantity': quantity,
				'measure': measure,
				'food': food,
				'weight': weight,
				'foodCategory': foodCategory,
				'foodId': foodId,
				'image': image,
			};

	@override
	List<Object?> get props {
		return [
				text,
				quantity,
				measure,
				food,
				weight,
				foodCategory,
				foodId,
				image,
		];
	}
}
