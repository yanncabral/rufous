# Rufus

Base de um aplicativo Flutter multiplataforma para, futuramente, gravar imagens ISO em unidades USB, inspirado no [Rufus](https://rufus.ie/).

> Projeto independente, sem afiliação com o Rufus original. Esta versão contém apenas a estrutura inicial Flutter: ainda não detecta dispositivos nem grava imagens.

## Plataformas

Estrutura gerada para Windows, macOS, Linux, Android, iOS e Web. A presença de um projeto de plataforma não garante suporte futuro à gravação USB: essa funcionalidade depende de APIs nativas, permissões e restrições de cada sistema. O navegador, em particular, não oferece acesso genérico a discos físicos.

## Desenvolvimento

Instale o [Flutter estável](https://docs.flutter.dev/get-started/install) e os pré-requisitos da plataforma de destino. Confira o ambiente com `flutter doctor`.

```sh
flutter pub get
flutter run -d linux # ou windows, macos, chrome, ou o ID de um dispositivo
```

Os builds de Windows, macOS e iOS exigem os respectivos sistemas operacionais e toolchains.

## Verificação

```sh
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
flutter build web
```
