import 'package:equatable/equatable.dart';

class Self extends Equatable {
	final String? href;
	final String? title;

	const Self({this.href, this.title});

	factory Self.fromJson(Map<String, dynamic> json) => Self(
				href: json['href'] as String?,
				title: json['title'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'href': href,
				'title': title,
			};

	@override
	List<Object?> get props => [href, title];
}
