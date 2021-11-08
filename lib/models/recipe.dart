import 'package:equatable/equatable.dart';

import 'digest.dart';
import 'ingredient.dart';
import 'total_daily.dart';
import 'total_nutrients.dart';

class Recipe extends Equatable {
	final String? uri;
	final String? label;
	final String? image;
	final String? source;
	final String? url;
	final String? shareAs;
	final int? yield;
	final List<String>? dietLabels;
	final List<String>? healthLabels;
	final List<String>? cautions;
	final List<String>? ingredientLines;
	final List<Ingredient>? ingredients;
	final double? calories;
	final double? totalWeight;
	final int? totalTime;
	final List<String>? cuisineType;
	final List<String>? mealType;
	final List<String>? dishType;
	final TotalNutrients? totalNutrients;
	final TotalDaily? totalDaily;
	final List<Digest>? digest;

	const Recipe({
		this.uri, 
		this.label, 
		this.image, 
		this.source, 
		this.url, 
		this.shareAs, 
		this.yield, 
		this.dietLabels, 
		this.healthLabels, 
		this.cautions, 
		this.ingredientLines, 
		this.ingredients, 
		this.calories, 
		this.totalWeight, 
		this.totalTime, 
		this.cuisineType, 
		this.mealType, 
		this.dishType, 
		this.totalNutrients, 
		this.totalDaily, 
		this.digest, 
	});

	factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
				uri: json['uri'] as String?,
				label: json['label'] as String?,
				image: json['image'] as String?,
				source: json['source'] as String?,
				url: json['url'] as String?,
				shareAs: json['shareAs'] as String?,
				yield: json['yield'] as int?,
				dietLabels: json['dietLabels'] as List<String>?,
				healthLabels: json['healthLabels'] as List<String>?,
				cautions: json['cautions'] as List<String>?,
				ingredientLines: json['ingredientLines'] as List<String>?,
				ingredients: (json['ingredients'] as List<dynamic>?)
						?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
						.toList(),
				calories: (json['calories'] as num?)?.toDouble(),
				totalWeight: (json['totalWeight'] as num?)?.toDouble(),
				totalTime: json['totalTime'] as int?,
				cuisineType: json['cuisineType'] as List<String>?,
				mealType: json['mealType'] as List<String>?,
				dishType: json['dishType'] as List<String>?,
				totalNutrients: json['totalNutrients'] == null
						? null
						: TotalNutrients.fromJson(json['totalNutrients'] as Map<String, dynamic>),
				totalDaily: json['totalDaily'] == null
						? null
						: TotalDaily.fromJson(json['totalDaily'] as Map<String, dynamic>),
				digest: (json['digest'] as List<dynamic>?)
						?.map((e) => Digest.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'uri': uri,
				'label': label,
				'image': image,
				'source': source,
				'url': url,
				'shareAs': shareAs,
				'yield': yield,
				'dietLabels': dietLabels,
				'healthLabels': healthLabels,
				'cautions': cautions,
				'ingredientLines': ingredientLines,
				'ingredients': ingredients?.map((e) => e.toJson()).toList(),
				'calories': calories,
				'totalWeight': totalWeight,
				'totalTime': totalTime,
				'cuisineType': cuisineType,
				'mealType': mealType,
				'dishType': dishType,
				'totalNutrients': totalNutrients?.toJson(),
				'totalDaily': totalDaily?.toJson(),
				'digest': digest?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props {
		return [
				uri,
				label,
				image,
				source,
				url,
				shareAs,
				yield,
				dietLabels,
				healthLabels,
				cautions,
				ingredientLines,
				ingredients,
				calories,
				totalWeight,
				totalTime,
				cuisineType,
				mealType,
				dishType,
				totalNutrients,
				totalDaily,
				digest,
		];
	}
}
