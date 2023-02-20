import 'package:freezed_annotation/freezed_annotation.dart';

part 'hot_deal.freezed.dart';
part 'hot_deal.g.dart';

@freezed
class HotDeal with _$HotDeal {
  const factory HotDeal({
    required final String id,
    required final String imageUrl,
    required final String description,
    required final String hashTag,
  }) = _HotDeal;

  factory HotDeal.fromJson(Map<String, dynamic> json) =>
      _$HotDealFromJson(json);
}

const hotDealsList = [
  HotDeal(
    id: '1',
    imageUrl:
        'https://images.unsplash.com/photo-1616693153250-bb03055788eb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmxhY2slMjBzb2ZhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    description: 'Hot deals\n40% Off ',
    hashTag: '#Home Essentials',
  ),
  HotDeal(
    id: '2',
    imageUrl:
        'https://images.unsplash.com/photo-1553443175-e1ce8896d8f3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJsYWNrJTIwZGluaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    description: 'hot deals\n20% off',
    hashTag: '#Dining Essentials',
  ),
  HotDeal(
    id: '3',
    imageUrl:
        'https://images.unsplash.com/photo-1560170505-43f55e57739d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGxhbXB8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    description: 'Hot Deals\n80% off',
    hashTag: '#Learning',
  )
];
