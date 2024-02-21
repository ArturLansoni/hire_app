coverage:
	flutter test --coverage && genhtml coverage/lcov.info -o coverage/html

clean:
	flutter clean && rm pubspec.lock

localization:
	flutter gen-l10n