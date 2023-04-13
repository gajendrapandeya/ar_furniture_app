import 'package:freezed_annotation/freezed_annotation.dart';

part 'district.freezed.dart';

@freezed
abstract class District with _$District {
  const factory District({
    required int districtId,
    required int provinceId,
    required String districtName,
  }) = _District;
}

const List<District> districts = [
  District(
    districtId: 1,
    provinceId: 1,
    districtName: 'Bhaktapur',
  ),
  District(
    districtId: 2,
    provinceId: 1,
    districtName: 'Dhading',
  ),
  District(
    districtId: 3,
    provinceId: 1,
    districtName: 'Kathmandu',
  ),
  District(
    districtId: 4,
    provinceId: 1,
    districtName: 'Kavrepalanchowk',
  ),
  District(
    districtId: 5,
    provinceId: 1,
    districtName: 'Lalitpur',
  ),
  District(
    districtId: 6,
    provinceId: 1,
    districtName: 'Makwanpur',
  ),
  District(
    districtId: 7,
    provinceId: 1,
    districtName: 'Nuwakot',
  ),
  District(
    districtId: 8,
    provinceId: 1,
    districtName: 'Ramechap',
  ),
  District(
    districtId: 9,
    provinceId: 1,
    districtName: 'Rasuwa',
  ),
  District(
    districtId: 10,
    provinceId: 1,
    districtName: 'Sindhuli',
  ),
  District(
    districtId: 11,
    provinceId: 1,
    districtName: 'Sindhupalchowk',
  ),
  District(
    districtId: 12,
    provinceId: 2,
    districtName: 'Gorkha',
  ),
  District(
    districtId: 14,
    provinceId: 2,
    districtName: 'Kaski',
  ),
  District(
    districtId: 15,
    provinceId: 2,
    districtName: 'Lamjung',
  ),
  District(
    districtId: 16,
    provinceId: 2,
    districtName: 'Manang',
  ),
  District(
    districtId: 17,
    provinceId: 2,
    districtName: 'Mustang',
  ),
  District(
    districtId: 18,
    provinceId: 2,
    districtName: 'Myagdi',
  ),
  District(
    districtId: 19,
    provinceId: 2,
    districtName: 'Nawalpur',
  ),
  District(
    districtId: 20,
    provinceId: 2,
    districtName: 'Parbat',
  ),
  District(
    districtId: 21,
    provinceId: 2,
    districtName: 'Syangja',
  ),
  District(
    districtId: 22,
    provinceId: 2,
    districtName: 'Tanahun',
  ),
  District(
    districtId: 23,
    provinceId: 3,
    districtName: 'Dailekh',
  ),
  District(
    districtId: 25,
    provinceId: 3,
    districtName: 'Humla',
  ),
  District(
    districtId: 25,
    provinceId: 3,
    districtName: 'Jajarkot',
  ),
  District(
    districtId: 26,
    provinceId: 3,
    districtName: 'Jumla',
  ),
  District(
    districtId: 27,
    provinceId: 3,
    districtName: 'Kalikot',
  ),
  District(
    districtId: 28,
    provinceId: 3,
    districtName: 'Mugu',
  ),
  District(
    districtId: 29,
    provinceId: 3,
    districtName: 'Salyan',
  ),
  District(
    districtId: 30,
    provinceId: 3,
    districtName: 'Surkhet',
  ),
  District(
    districtId: 31,
    provinceId: 3,
    districtName: 'Dolpa',
  ),
  District(
    districtId: 32,
    provinceId: 3,
    districtName: 'Western Rukum',
  ),
  District(
    districtId: 33,
    provinceId: 4,
    districtName: 'Arghakhanchi',
  ),
  District(
    districtId: 13,
    provinceId: 4,
    districtName: 'Banke',
  ),
  District(
    districtId: 72,
    provinceId: 4,
    districtName: 'Bardia',
  ),
  District(
    districtId: 73,
    provinceId: 4,
    districtName: 'Dang',
  ),
  District(
    districtId: 74,
    provinceId: 4,
    districtName: 'Eastern Rukum',
  ),
  District(
    districtId: 34,
    provinceId: 4,
    districtName: 'Gulmi',
  ),
  District(
    districtId: 35,
    provinceId: 4,
    districtName: 'Kapilvastu',
  ),
  District(
    districtId: 36,
    provinceId: 4,
    districtName: 'Nawalparasi East',
  ),
  District(
    districtId: 37,
    provinceId: 4,
    districtName: 'Nawalparasi West',
  ),
  District(
    districtId: 38,
    provinceId: 4,
    districtName: 'Palpa',
  ),
  District(
    districtId: 39,
    provinceId: 4,
    districtName: 'Parasi',
  ),
  District(
    districtId: 40,
    provinceId: 4,
    districtName: 'Pyuthan',
  ),
  District(
    districtId: 41,
    provinceId: 4,
    districtName: 'Rolpa',
  ),
  District(
    districtId: 42,
    provinceId: 4,
    districtName: 'Rupandehi',
  ),
  District(
    districtId: 43,
    provinceId: 5,
    districtName: 'Bara',
  ),
  District(
    districtId: 44,
    provinceId: 5,
    districtName: 'Dhanusha',
  ),
  District(
    districtId: 45,
    provinceId: 5,
    districtName: 'Mohottari',
  ),
  District(
    districtId: 46,
    provinceId: 5,
    districtName: 'Parsa',
  ),
  District(
    districtId: 47,
    provinceId: 5,
    districtName: 'Rautahat',
  ),
  District(
    districtId: 48,
    provinceId: 5,
    districtName: 'Saptari',
  ),
  District(
    districtId: 49,
    provinceId: 5,
    districtName: 'Sarlahi',
  ),
  District(
    districtId: 50,
    provinceId: 5,
    districtName: 'Siraha',
  ),
  District(
    districtId: 51,
    provinceId: 6,
    districtName: 'Bhojpur',
  ),
  District(
    districtId: 52,
    provinceId: 6,
    districtName: 'Dhankuta',
  ),
  District(
    districtId: 53,
    provinceId: 6,
    districtName: 'Ilam',
  ),
  District(
    districtId: 54,
    provinceId: 6,
    districtName: 'Jhapa',
  ),
  District(
    districtId: 55,
    provinceId: 6,
    districtName: 'Khotang',
  ),
  District(
    districtId: 56,
    provinceId: 6,
    districtName: 'Morang',
  ),
  District(
    districtId: 57,
    provinceId: 6,
    districtName: 'Okhaldhunga',
  ),
  District(
    districtId: 58,
    provinceId: 6,
    districtName: 'Panchthar',
  ),
  District(
    districtId: 59,
    provinceId: 6,
    districtName: 'Sankhuawasabha',
  ),
  District(
    districtId: 60,
    provinceId: 6,
    districtName: 'Solukhumbu',
  ),
  District(
    districtId: 61,
    provinceId: 6,
    districtName: 'Sunsari',
  ),
  District(
    districtId: 62,
    provinceId: 6,
    districtName: 'Taplejung',
  ),
  District(
    districtId: 63,
    provinceId: 6,
    districtName: 'Terhathum',
  ),
  District(
    districtId: 64,
    provinceId: 6,
    districtName: 'Udayapur',
  ),
  District(
    districtId: 65,
    provinceId: 7,
    districtName: 'Achham',
  ),
  District(
    districtId: 66,
    provinceId: 7,
    districtName: 'Baitadi',
  ),
  District(
    districtId: 67,
    provinceId: 7,
    districtName: 'Dadeldhura',
  ),
  District(
    districtId: 68,
    provinceId: 7,
    districtName: 'Darchula',
  ),
  District(
    districtId: 69,
    provinceId: 7,
    districtName: 'Doti',
  ),
  District(
    districtId: 70,
    provinceId: 7,
    districtName: 'Kailali',
  ),
  District(
    districtId: 71,
    provinceId: 7,
    districtName: 'Kanchanpur',
  ),
  District(
    districtId: 75,
    provinceId: 7,
    districtName: 'Bajhang',
  ),
  District(
    districtId: 76,
    provinceId: 7,
    districtName: 'Bajura',
  )
];
