# TMDB Movie App

Flutter + Riverpod을 사용한 영화 검색 앱

## 🎬 주요 기능

- 영화 목록 조회 (현재 상영작)
- 실시간 검색 (1초 debouncing)
- 정렬 (평점/인기도/개봉일)
- Grid/List 뷰 전환

## 🏗️ 아키텍처

Clean Architecture + Riverpod

```
lib/movie/
├── data/         # DataSource, Repository 구현, Model
├── domain/       # Entity, Repository 인터페이스, UseCase
└── presentation/ # Provider, UI
```

## 📦 주요 패키지

- `riverpod` + `hooks_riverpod` - 상태 관리
- `dio` - HTTP 클라이언트
- `dartz` - Either (에러 처리)
- `mockito` - 테스트

## 🚀 시작하기

### 1. 의존성 설치
```bash
flutter pub get
```

### 2. 코드 생성
한 번만 빌드
```bash
flutter pub run build_runner build
```

파일 변경 감지하며 자동 빌드 (watch 모드)
```bash
flutter pub run build_runner watch
```

기존 생성 파일 삭제 후 재빌드
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. API 키 설정

`.env.apikey` 파일 생성:
```
TMDB_API_KEY=your_api_key_here
```

### 4. 실행
```bash
flutter run
```

## 🧪 테스트

```bash
flutter test
```

- Domain Layer: UseCase 단위 테스트
- Data Layer: Repository, DataSource 테스트
- Presentation Layer: Provider 테스트

