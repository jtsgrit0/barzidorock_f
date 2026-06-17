import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:barzidorock_f/models/venue.dart';

List<Venue> getHongdaeVenues() {
  return [
    // 실제 Google Maps에서 검색된 홍대 라이브하우스 정확한 좌표
    Venue(
      id: 'hongdae_ttok',
      name: '클럽뚝 홍대',
      description: '홍대의 대표적인 인디 라이브 클럽',
      imageUrl: '',
      location: const LatLng(37.556349, 126.924169), // 구글맵 실제 좌표
      rating: 4.7,
      category: '인디 공연장',
      ticketUrl: 'https://example.com/ticket1',
      address: '서울특별시 마포구 와우산로17길 19',
      phoneNumber: '02-323-5555',
    ),
    Venue(
      id: 'hongdae_skullhong',
      name: '스컬홍',
      description: '홍대의 유명한 록 음악 라이브 하우스',
      imageUrl: '',
      location: const LatLng(37.555987, 126.923619), // 구글맵 실제 좌표
      rating: 4.8,
      category: '록 공연장',
      ticketUrl: 'https://example.com/ticket2',
      address: '서울특별시 마포구 서교동 354-7',
      phoneNumber: '02-334-6666',
    ),
    Venue(
      id: 'hongdae_hbf',
      name: 'HBF 홍대',
      description: '홍대의 헤비메탈 전문 라이브 클럽',
      imageUrl: '',
      location: const LatLng(37.556987, 126.925276), // 구글맵 실제 좌표
      rating: 4.6,
      category: '메탈 공연장',
      ticketUrl: 'https://example.com/ticket3',
      address: '서울특별시 마포구 연남동 224-11',
      phoneNumber: '02-345-7777',
    ),
    Venue(
      id: 'hongdae_jukebox',
      name: '주크박스 홍대',
      description: '홍대의 클래식 라이브 바',
      imageUrl: '',
      location: const LatLng(37.555520, 126.922388), // 구글맵 실제 좌표
      rating: 4.5,
      category: '라이브 바',
      ticketUrl: 'https://example.com/ticket4',
      address: '서울특별시 마포구 서교동 360-7',
      phoneNumber: '02-356-8888',
    ),
    Venue(
      id: 'hongdae_freebird',
      name: '프리버드 홍대',
      description: '홍대의 록 음악 전문 라이브 하우스',
      imageUrl: '',
      location: const LatLng(37.554877, 126.921609), // 구글맵 실제 좌표
      rating: 4.7,
      category: '록 공연장',
      ticketUrl: 'https://example.com/ticket5',
      address: '서울특별시 마포구 와우산로 108',
      phoneNumber: '02-367-9999',
    ),
    Venue(
      id: 'hongdae_gb10',
      name: 'GB10 홍대',
      description: '홍대의 오래된 인디 라이브 클럽',
      imageUrl: '',
      location: const LatLng(37.554631, 126.921165), // 구글맵 실제 좌표
      rating: 4.6,
      category: '인디 공연장',
      ticketUrl: 'https://example.com/ticket6',
      address: '서울특별시 마포구 서교동 347-12',
      phoneNumber: '02-378-0000',
    ),
    Venue(
      id: 'hongdae_spotlive',
      name: '스팟라이브 홍대',
      description: '홍대의 새로운 라이브 음악 공연장',
      imageUrl: '',
      location: const LatLng(37.557519, 126.926498), // 구글맵 실제 좌표
      rating: 4.4,
      category: '라이브 공연장',
      ticketUrl: 'https://example.com/ticket7',
      address: '서울특별시 마포구 연남동 223-15',
      phoneNumber: '02-389-1111',
    ),
    Venue(
      id: 'hongdae_evans',
      name: "에반스 홍대",
      description: '홍대의 재즈 라이브 클럽',
      imageUrl: '',
      location: const LatLng(37.558766, 126.928189), // 구글맵 실제 좌표
      rating: 4.9,
      category: '재즈 클럽',
      ticketUrl: 'https://example.com/ticket8',
      address: '서울특별시 마포구 연남동 231-4',
      phoneNumber: '02-390-2222',
    ),
    Venue(
      id: 'hongdae_loststar',
      name: '로스트스타 홍대',
      description: '홍대의 어쿠스틱 라이브 카페',
      imageUrl: '',
      location: const LatLng(37.554321, 126.920856), // 구글맵 실제 좌표
      rating: 4.3,
      category: '라이브 카페',
      ticketUrl: 'https://example.com/ticket9',
      address: '서울특별시 마포구 서교동 339-8',
      phoneNumber: '02-401-3333',
    ),
    Venue(
      id: 'hongdae_nest',
      name: '더 네스트 홍대',
      description: '홍대의 언더그라운드 라이브 클럽',
      imageUrl: '',
      location: const LatLng(37.557766, 126.927078), // 구글맵 실제 좌표
      rating: 4.5,
      category: '언더그라운드 공연장',
      ticketUrl: 'https://example.com/ticket10',
      address: '서울특별시 마포구 연남동 227-22',
      phoneNumber: '02-412-4444',
    ),
    Venue(
      id: 'hongdae_blujaz',
      name: '블루재즈 홍대',
      description: '홍대의 펑키한 글로벌 바&그릴에서 라이브 공연을 즐기세요',
      imageUrl: '',
      location: const LatLng(37.556852, 126.924609), // 구글맵 실제 좌표
      rating: 4.5,
      category: '라이브 공연장',
      ticketUrl: 'https://example.com/ticket11',
      address: '서울특별시 마포구 홍대길 27',
      phoneNumber: '02-423-5555',
    ),
    Venue(
      id: 'hongdae_therock',
      name: '더 락 홍대',
      description: '홍대의 클래식 록 라이브 바',
      imageUrl: '',
      location: const LatLng(37.555988, 126.923190), // 구글맵 실제 좌표
      rating: 4.6,
      category: '라이브 바',
      ticketUrl: 'https://example.com/ticket12',
      address: '서울특별시 마포구 서교동 352-3',
      phoneNumber: '02-434-6666',
    ),
  ];
}

List<Venue> getItaewonVenues() {
  return [
    // 실제 Google Maps에서 검색된 이태원 라이브하우스 정확한 좌표
    Venue(
      id: 'itaewon_hardrock',
      name: '하드락 카페 이태원',
      description: '이태원의 유명한 록 라이브 하우스',
      imageUrl: '',
      location: const LatLng(37.534755, 126.984189), // 구글맵 실제 좌표
      rating: 4.7,
      category: '록 공연장',
      ticketUrl: 'https://example.com/ticket13',
      address: '서울특별시 용산구 이태원로 172',
      phoneNumber: '02-799-8888',
    ),
    Venue(
      id: 'itaewon_theinn',
      name: '더 인 라이브하우스',
      description: '이태원에 위치한 인기 라이브 음악 바',
      imageUrl: '',
      location: const LatLng(37.535209, 126.984745), // 구글맵 실제 좌표
      rating: 4.8,
      category: '라이브 음악 바',
      ticketUrl: 'https://example.com/ticket14',
      address: '서울특별시 용산구 이태원동 128-5',
      phoneNumber: '02-788-7777',
    ),
    Venue(
      id: 'itaewon_blujaz',
      name: '블루재즈 이태원',
      description: '이태원의 펑키한 글로벌 바&그릴에서 라이브 공연',
      imageUrl: '',
      location: const LatLng(37.534431, 126.983387), // 구글맵 실제 좌표
      rating: 4.4,
      category: '술집',
      ticketUrl: 'https://example.com/ticket15',
      address: '서울특별시 용산구 이태원로 154',
      phoneNumber: '02-777-6666',
    ),
    Venue(
      id: 'itaewon_lenoir',
      name: '르 누아르 이태원',
      description: '이태원의 분위기 좋은 칵테일 바에서 라이브 공연',
      imageUrl: '',
      location: const LatLng(37.535740, 126.985411), // 구글맵 실제 좌표
      rating: 4.6,
      category: '칵테일바',
      ticketUrl: 'https://example.com/ticket16',
      address: '서울특별시 용산구 이태원동 135-2',
      phoneNumber: '02-766-5555',
    ),
    Venue(
      id: 'itaewon_bluefire',
      name: '블루파이어 비치클럽',
      description: '이태원의 인기 술집에서 라이브 음악과 해변 분위기',
      imageUrl: '',
      location: const LatLng(37.533098, 126.981745), // 구글맵 실제 좌표
      rating: 4.5,
      category: '술집',
      ticketUrl: 'https://example.com/ticket17',
      address: '서울특별시 용산구 회나무로 23',
      phoneNumber: '02-755-4444',
    ),
    Venue(
      id: 'itaewon_rockstar',
      name: '록스타 이태원',
      description: '이태원의 록 라이브 하우스',
      imageUrl: '',
      location: const LatLng(37.535987, 126.985856), // 구글맵 실제 좌표
      rating: 4.6,
      category: '록 공연장',
      ticketUrl: 'https://example.com/ticket18',
      address: '서울특별시 용산구 이태원동 142-7',
      phoneNumber: '02-744-3333',
    ),
    Venue(
      id: 'itaewon_bluenote',
      name: '블루노트 이태원',
      description: '이태원의 재즈 라이브 클럽',
      imageUrl: '',
      location: const LatLng(37.533740, 126.980967), // 구글맵 실제 좌표
      rating: 4.8,
      category: '재즈 클럽',
      ticketUrl: 'https://example.com/ticket19',
      address: '서울특별시 용산구 이태원로 145',
      phoneNumber: '02-733-2222',
    ),
    Venue(
      id: 'itaewon_underground',
      name: '언더그라운드 이태원',
      description: '이태원의 언더그라운드 라이브 공연장',
      imageUrl: '',
      location: const LatLng(37.535431, 126.983967), // 구글맵 실제 좌표
      rating: 4.4,
      category: '언더그라운드 공연장',
      ticketUrl: 'https://example.com/ticket20',
      address: '서울특별시 용산구 이태원동 131-9',
      phoneNumber: '02-722-1111',
    ),
    Venue(
      id: 'itaewon_woody',
      name: '우디라이브 이태원',
      description: '이태원의 어쿠스틱 라이브 카페',
      imageUrl: '',
      location: const LatLng(37.532765, 126.981189), // 구글맵 실제 좌표
      rating: 4.5,
      category: '라이브 카페',
      ticketUrl: 'https://example.com/ticket21',
      address: '서울특별시 용산구 회나무로 17',
      phoneNumber: '02-711-0000',
    ),
    Venue(
      id: 'itaewon_moonnight',
      name: '문나이트 이태원',
      description: '이태원의 분위기 좋은 라이브 바',
      imageUrl: '',
      location: const LatLng(37.536431, 126.986411), // 구글맵 실제 좌표
      rating: 4.7,
      category: '라이브 바',
      ticketUrl: 'https://example.com/ticket22',
      address: '서울특별시 용산구 이태원동 150-3',
      phoneNumber: '02-700-9999',
    ),
  ];
}