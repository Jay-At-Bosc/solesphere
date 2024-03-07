import 'dart:convert';

class OnboardingItem {
  final String image;
  final String title;
  final String subtitle;

  OnboardingItem({required this.image, required this.title, required this.subtitle});

  factory OnboardingItem.fromMap(Map<String, dynamic> map) {
    return OnboardingItem(
      image: map['image'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
    );
  }

  factory OnboardingItem.fromJson(String source) => OnboardingItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
