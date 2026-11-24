# Система управления онлайн-курсами

[![CI в ветке main](https://github.com/vlloikov/online-course-manager/actions/workflows/ci.yml/badge.svg?branch=main&event=push)](https://github.com/vlloikov/online-course-manager/actions/workflows/ci.yml)
[![C++17](https://img.shields.io/badge/C%2B%2B-17-00599C?logo=cplusplus&logoColor=white)](#сборка-и-запуск)
[![CMake](https://img.shields.io/badge/build-CMake-064F8C?logo=cmake&logoColor=white)](#сборка-и-запуск)
[![Лицензия MIT](https://img.shields.io/badge/license-MIT-2E7D32)](LICENSE)

Сквозной учебный проект на C++, вариант 12. Консольное приложение предназначено для ведения списка курсов и студентов, записи на курсы и работы с оценками.

Основные сущности проекта — курс, студент, преподаватель и запись на курс.

## Лабораторная работа № 1

При запуске программа выводит название проекта.

## Сборка и запуск

Для сборки нужны CMake 3.25 или новее и компилятор с поддержкой C++17, например GCC. Выполни команды из корня проекта.

```bash
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build --parallel
./build/online-course-manager
```

Ожидаемый вывод

```text
Система управления онлайн-курсами
```

В CLion открой корневой `CMakeLists.txt` как проект и запусти цель `online-course-manager`.

## Проверки

После сборки запусти CTest.

```bash
ctest --test-dir build --output-on-failure --no-tests=error
```

Тест `startup_greeting` проверяет код завершения программы и точный вывод приветствия. GitHub Actions выполняет сборку, тест и проверку форматирования в PR в `main` и после пуша в `main`.

Чтобы применить правила из `.clang-format` к исходному файлу, выполни `clang-format -i main.cpp`. В CI используется `clang-format-18`.

### Локальные Git-хуки

После клонирования один раз включи хуки из директории `.githooks`.

```bash
git config --local core.hooksPath .githooks
```

Хукам нужны Bash, `clang-format`, CMake и компилятор. Для форматирования хук сначала ищет `clang-format-18`, как в CI, и при необходимости использует `clang-format` из `PATH`.

- `pre-commit` проверяет пробельные ошибки и форматирование версий C++-файлов, добавленных в индекс.
- `pre-push` собирает и тестирует отправляемый коммит во временной директории. Это позволяет проверять даже ветку, которая сейчас не открыта локально.

При ошибке Git прерывает коммит или пуш. Встроенный Git-клиент CLion использует ту же локальную настройку репозитория.
