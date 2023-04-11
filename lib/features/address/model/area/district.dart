import 'package:freezed_annotation/freezed_annotation.dart';

part 'district.freezed.dart';

@freezed
abstract class District with _$District {
  const factory District({
    required int districtId,
    required int stateId,
    required String districtName,
  }) = _District;
}

const List<District> districts = [
  District(
    districtId: 1,
    stateId: 1,
    districtName: 'Bhaktapur',
  ),
  District(
    districtId: 2,
    stateId: 1,
    districtName: 'Dhading',
  ),
  District(
    districtId: 3,
    stateId: 1,
    districtName: 'Kathmandu',
  ),
  District(
    districtId: 4,
    stateId: 1,
    districtName: 'Kavrepalanchowk',
  ),
  District(
    districtId: 5,
    stateId: 1,
    districtName: 'Lalitpur',
  ),
  District(
    districtId: 6,
    stateId: 1,
    districtName: 'Makwanpur',
  ),
  District(
    districtId: 7,
    stateId: 1,
    districtName: 'Nuwakot',
  ),
  District(
    districtId: 8,
    stateId: 1,
    districtName: 'Ramechap',
  ),
  District(
    districtId: 9,
    stateId: 1,
    districtName: 'Rasuwa',
  ),
  District(
    districtId: 10,
    stateId: 1,
    districtName: 'Sindhuli',
  ),
  District(
    districtId: 11,
    stateId: 1,
    districtName: 'Sindhupalchowk',
  ),
  District(
    districtId: 12,
    stateId: 2,
    districtName: 'Gorkha',
  ),
  District(
    districtId: 14,
    stateId: 2,
    districtName: 'Kaski',
  ),
  District(
    districtId: 15,
    stateId: 2,
    districtName: 'Lamjung',
  ),
  District(
    districtId: 16,
    stateId: 2,
    districtName: 'Manang',
  ),
  District(
    districtId: 17,
    stateId: 2,
    districtName: 'Mustang',
  ),
  District(
    districtId: 18,
    stateId: 2,
    districtName: 'Myagdi',
  ),
  District(
    districtId: 19,
    stateId: 2,
    districtName: 'Nawalpur',
  ),
  District(
    districtId: 20,
    stateId: 2,
    districtName: 'Parbat',
  ),
  District(
    districtId: 21,
    stateId: 2,
    districtName: 'Syangja',
  ),
  District(
    districtId: 22,
    stateId: 2,
    districtName: 'Tanahun',
  ),
  District(
    districtId: 23,
    stateId: 3,
    districtName: 'Dailekh',
  ),
  District(
    districtId: 25,
    stateId: 3,
    districtName: 'Humla',
  ),
  District(
    districtId: 25,
    stateId: 3,
    districtName: 'Jajarkot',
  ),
  District(
    districtId: 26,
    stateId: 3,
    districtName: 'Jumla',
  ),
  District(
    districtId: 27,
    stateId: 3,
    districtName: 'Kalikot',
  ),
  District(
    districtId: 28,
    stateId: 3,
    districtName: 'Mugu',
  ),
  District(
    districtId: 29,
    stateId: 3,
    districtName: 'Salyan',
  ),
  District(
    districtId: 30,
    stateId: 3,
    districtName: 'Surkhet',
  ),
  District(
    districtId: 31,
    stateId: 3,
    districtName: 'Dolpa',
  ),
  District(
    districtId: 32,
    stateId: 3,
    districtName: 'Western Rukum',
  ),
  District(
    districtId: 33,
    stateId: 4,
    districtName: 'Arghakhanchi',
  ),
  District(
    districtId: 13,
    stateId: 4,
    districtName: 'Banke',
  ),
  District(
    districtId: 72,
    stateId: 4,
    districtName: 'Bardia',
  ),
  District(
    districtId: 73,
    stateId: 4,
    districtName: 'Dang',
  ),
  District(
    districtId: 74,
    stateId: 4,
    districtName: 'Eastern Rukum',
  ),
  District(
    districtId: 34,
    stateId: 4,
    districtName: 'Gulmi',
  ),
  District(
    districtId: 35,
    stateId: 4,
    districtName: 'Kapilvastu',
  ),
  District(
    districtId: 36,
    stateId: 4,
    districtName: 'Nawalparasi East',
  ),
  District(
    districtId: 37,
    stateId: 4,
    districtName: 'Nawalparasi West',
  ),
  District(
    districtId: 38,
    stateId: 4,
    districtName: 'Palpa',
  ),
  District(
    districtId: 39,
    stateId: 4,
    districtName: 'Parasi',
  ),
  District(
    districtId: 40,
    stateId: 4,
    districtName: 'Pyuthan',
  ),
  District(
    districtId: 41,
    stateId: 4,
    districtName: 'Rolpa',
  ),
  District(
    districtId: 42,
    stateId: 4,
    districtName: 'Rupandehi',
  ),
  District(
    districtId: 43,
    stateId: 5,
    districtName: 'Bara',
  ),
  District(
    districtId: 44,
    stateId: 5,
    districtName: 'Dhanusha',
  ),
  District(
    districtId: 45,
    stateId: 5,
    districtName: 'Mohottari',
  ),
  District(
    districtId: 46,
    stateId: 5,
    districtName: 'Parsa',
  ),
  District(
    districtId: 47,
    stateId: 5,
    districtName: 'Rautahat',
  ),
  District(
    districtId: 48,
    stateId: 5,
    districtName: 'Saptari',
  ),
  District(
    districtId: 49,
    stateId: 5,
    districtName: 'Sarlahi',
  ),
  District(
    districtId: 50,
    stateId: 5,
    districtName: 'Siraha',
  ),
  District(
    districtId: 51,
    stateId: 6,
    districtName: 'Bhojpur',
  ),
  District(
    districtId: 52,
    stateId: 6,
    districtName: 'Dhankuta',
  ),
  District(
    districtId: 53,
    stateId: 6,
    districtName: 'Ilam',
  ),
  District(
    districtId: 54,
    stateId: 6,
    districtName: 'Jhapa',
  ),
  District(
    districtId: 55,
    stateId: 6,
    districtName: 'Khotang',
  ),
  District(
    districtId: 56,
    stateId: 6,
    districtName: 'Morang',
  ),
  District(
    districtId: 57,
    stateId: 6,
    districtName: 'Okhaldhunga',
  ),
  District(
    districtId: 58,
    stateId: 6,
    districtName: 'Panchthar',
  ),
  District(
    districtId: 59,
    stateId: 6,
    districtName: 'Sankhuawasabha',
  ),
  District(
    districtId: 60,
    stateId: 6,
    districtName: 'Solukhumbu',
  ),
  District(
    districtId: 61,
    stateId: 6,
    districtName: 'Sunsari',
  ),
  District(
    districtId: 62,
    stateId: 6,
    districtName: 'Taplejung',
  ),
  District(
    districtId: 63,
    stateId: 6,
    districtName: 'Terhathum',
  ),
  District(
    districtId: 64,
    stateId: 6,
    districtName: 'Udayapur',
  ),
  District(
    districtId: 65,
    stateId: 7,
    districtName: 'Achham',
  ),
  District(
    districtId: 66,
    stateId: 7,
    districtName: 'Baitadi',
  ),
  District(
    districtId: 67,
    stateId: 7,
    districtName: 'Dadeldhura',
  ),
  District(
    districtId: 68,
    stateId: 7,
    districtName: 'Darchula',
  ),
  District(
    districtId: 69,
    stateId: 7,
    districtName: 'Doti',
  ),
  District(
    districtId: 70,
    stateId: 7,
    districtName: 'Kailali',
  ),
  District(
    districtId: 71,
    stateId: 7,
    districtName: 'Kanchanpur',
  ),
  District(
    districtId: 75,
    stateId: 7,
    districtName: 'Bajhang',
  ),
  District(
    districtId: 76,
    stateId: 7,
    districtName: 'Bajura',
  )
];
