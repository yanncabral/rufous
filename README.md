# Rufus

Base de um aplicativo Flutter multiplataforma para, futuramente, gravar imagens ISO em unidades USB, inspirado no [Rufus](https://rufus.ie/).

> Projeto independente, sem afiliação com o Rufus original. Esta versão contém apenas a estrutura inicial Flutter: ainda não detecta dispositivos nem grava imagens.

## Plataformas

Estrutura gerada para Windows, macOS, Linux, Android, iOS e Web. A presença de um projeto de plataforma não garante suporte futuro à gravação USB: essa funcionalidade depende de APIs nativas, permissões e restrições de cada sistema. O navegador, em particular, não oferece acesso genérico a discos físicos.

## Desenvolvimento

Instale o [FVM](https://fvm.app/documentation/getting-started/installation) e os pré-requisitos da plataforma de destino. O SDK Flutter é gerenciado pelo FVM, sem depender de uma instalação global do Flutter.

A versão está fixada em `.fvmrc` (Flutter **3.47.9**, a stable mais recente na configuração inicial). O diretório `.fvm/` é local e não deve ser versionado.

```sh
fvm install
fvm flutter doctor
fvm flutter pub get
fvm flutter run -d linux # ou windows, macos, chrome, ou o ID de um dispositivo
```

Para atualizar explicitamente para a stable mais recente e fixar a nova versão:

```sh
fvm use stable --pin
```

Os builds de Windows, macOS e iOS exigem os respectivos sistemas operacionais e toolchains.

## Verificação

```sh
fvm dart format --output=none --set-exit-if-changed lib test
fvm flutter analyze
fvm flutter test
fvm flutter build web
```
