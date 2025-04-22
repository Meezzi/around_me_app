# 🗺️ Around Me App

Flutter 기반 위치 기반 장소 검색 앱입니다.

<br>

검색창에 검색어를 입력하면 5개의 장소를 표시합니다.

<br>

또한, 사용자의 **현재 위치**를 기반으로 **행정 주소**를 조회한 뒤, 해당 주소를 활용해 **Naver Search API로 주변 장소를 검색**합니다.

<br>

## 🚀 주요 기능

- 📍 현재 위치 좌표 가져오기 (`geolocator`)
- 🏙️ VWORLD API로 좌표 → 행정 주소 변환
- 🔍 네이버 장소 검색 API 연동
- 🧭 GPS 버튼 클릭 시 현재 위치 기반 주변 장소 자동 검색
- ☁️ Riverpod으로 상태 관리

<br>

## 🖼️ 화면 구성

- `HomeScreen`: 검색창 + 장소 리스트 + GPS 버튼 (`Icons.gps_fixed`)

<br>

## 🔧 사용 기술 스택

- **Flutter** + Dart
- **Riverpod**: 상태 관리
- **Geolocator**: 위치 권한 및 현재 위치
- **VWORLD API**: 좌표 → 주소 변환
- **Naver Search API**: 장소 검색
- **Dio**: HTTP 요청
- **Flutter Dotenv**: 환경 변수(.env) 관리

<br>

## 📦 프로젝트 구조
```
lib/
├── core/
│   ├── error/             # CustomException 정의
│   ├── geolocator/        # 현재 위치 불러오기
│   └── result/            # Result<T> 패턴
│
├── data/
│   ├── model/             # Place 모델
│   └── repository/        # LocationRepository 및 구현체
│
├── theme/                 # 라이트, 다크 테마
│
├── ui/
│   └── pages/             # ViewModel, 위젯, Home Screen
│       └── home/           

```

## ✨ 트러블 슈팅
[API 키 숨기기](https://sfida.tistory.com/129)
[회고](https://sfida.tistory.com/127)

<br>
