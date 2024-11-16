# Sisal

Esercizio di sviluppo di un'applicazione mobile per la visualizzazione di notizie, collegamenti ad app terze e avere la possibilità di condividere immagini.

## Assunzioni Personali

1. In base alla richiesta ho deciso di salvare localmente le immagini scelte dalla libreria o dalla fotocamera, utilizzando le `shared_preferences`, memorizzando l'immagine in base64.

2. Il logo era di dimensioni troppo piccole (400x400), dunque ho effettuato un up-scaling dell'immagine a 1024x1024 e generato le icone grazie a [App Icon Generator](https://appicon.co/).

3. Nel tab della visualizzazione delle notizie, ho deciso di implementare un `Pull to Refresh` per aggiornare le notizie manualmente (immaginando un classico utilizzo).

## Architettura

Il progetto è strutturato utilizzando l'architettura Clean Architecture, basata sulle `features`.

Ogni `feature` è composta da tre parti principali:

- `data`: Contiene le repository (chiamate API) e i provider per distribuire i dati.
- `domain`: Contiene le entità della feature.
- `presentation`: Contiene esclusivamente i widget UI.

Il progetto utilizza [Riverpod](https://pub.dev/packages/flutter_riverpod) per la gestione dello stato e [Retrofit](https://pub.dev/packages/retrofit) per la generazione delle repository.

## Pacchetti Utilizzati

Il progetto utilizza i seguenti pacchetti:

### Dipendenze Principali

- `flutter`: SDK di Flutter.
- `flutter_riverpod`: ^2.6.1 - Un framework per la gestione dello stato.
- `riverpod_annotation`: ^2.6.1 - Annotazioni per Riverpod.
- `freezed_annotation`: ^2.4.4 - Annotazioni per Freezed.
- `json_annotation`: ^4.9.0 - Un pacchetto per la serializzazione JSON.
- `retrofit`: ^4.4.1 - Un generatore di client HTTP basato su annotazioni.
- `go_router`: ^14.6.0 - Un pacchetto per la navigazione.
- `xml`: ^6.5.0 - Un pacchetto per la decodifica di XML.
- `dio`: ^5.7.0 - Un potente client HTTP per Dart.
- `html_unescape`: ^2.0.0 - Un pacchetto per decodificare entità HTML.
- `cached_network_image`: ^3.4.1 - Un widget per visualizzare immagini da URL con caching.
- `webview_flutter`: ^4.10.0 - Un widget per visualizzare contenuti web.
- `url_launcher`: ^6.3.1 - Un pacchetto per lanciare URL.
- `image_picker`: ^1.1.2 - Un pacchetto per selezionare immagini dalla galleria o dalla fotocamera.
- `shared_preferences`: ^2.3.3 - Un pacchetto per memorizzare dati semplici localmente.

### Dipendenze di Sviluppo

- `flutter_test`: SDK di Flutter per i test.
- `flutter_lints`: ^4.0.0 - Un insieme di regole di linting raccomandate per Flutter.
- `riverpod_generator`: ^2.6.2 - Generatore di codice per Riverpod.
- `build_runner`: ^2.4.13 - Un pacchetto per eseguire generatori di codice.
- `custom_lint`: ^0.7.0 - Un pacchetto per creare regole di linting personalizzate.
- `riverpod_lint`: ^2.6.2 - Regole di linting per Riverpod.
- `freezed`: ^2.5.7 - Un pacchetto per la generazione di classi immutabili.
- `json_serializable`: ^6.8.0 - Un pacchetto per la serializzazione JSON.
- `retrofit_generator`: ^9.1.5 - Generatore di codice per Retrofit.
- `go_router_builder`: ^2.7.1 - Un pacchetto per la generazione di router.

## Configurazione del Progetto

### FVM

Il progetto utilizza FVM per gestire le versioni di Flutter. Per installare la versione di Flutter corretta, esegui il seguente comando:

```sh
fvm install
```

In questo modo, verrà installata la versione di Flutter specificata nel file `.fvmrc` (`3.24.3`).

### iOS

Per configurare il progetto iOS, assicurati di avere CocoaPods installato. Esegui `pod install` nella directory `ios` per installare le dipendenze necessarie.

## Avvio del Progetto

Per avviare il progetto, esegui i seguenti comandi:

```sh
flutter pub get
flutter run
```

Made with ❤️ by [Dario Varriale](https://www.linkedin.com/in/dario-varriale/).