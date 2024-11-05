
# DogApp - Documentazione del Progetto

## 1. Introduzione

### Descrizione del Progetto
**DogApp** è stata realizzata per soddisfare i requisiti della prova, che prevedevano la creazione di un'app dedicata alle razze canine. L'app consente di esplorare diverse razze di cani, visualizzare immagini casuali e salvare le razze preferite.

Il back-end dell'app è fornito dalle API disponibili su [dog.ceo](https://dog.ceo/dog-api/), un servizio gratuito per la gestione di dati e immagini di varie razze di cani.

## 2. Funzionalità Principali

Le funzionalità richieste e implementate sono le seguenti:

- **Random image by breed**: Visualizzazione di un'immagine casuale di una specifica razza.
- **Images list by breed**: Visualizzazione di una lista di immagini per una razza selezionata.
- **Random image by breed and sub-breed**: Visualizzazione di un'immagine casuale di una razza e sottorazza.
- **Images list by breed and sub-breed**: Elenco di immagini per una specifica razza e sottorazza.
- **Favorite list of breeds**: Possibilità di aggiungere e visualizzare una lista di razze preferite.

  ![Richiesta del progetto](https://res.cloudinary.com/dncsxih9p/image/upload/v1730799047/DogApp/ab6x9x7c9t7uqejaew0c.png))


## 3. Tecnologie Utilizzate

Il progetto è stato sviluppato principalmente con:

- **Flutter**: Per creare un'applicazione cross-platform.
- **goRouter**: Per la gestione della navigazione tra le diverse schermate dell'app.
- **http**: Per eseguire chiamate alle API e recuperare i dati e le immagini delle razze canine.

```dart
  //#########################################################################
  // First fetch for the entire list of breeds
  //#########################################################################

  Future<List<ListOfDogs>> fetchDog() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      Map<String, dynamic> breeds = jsonResponse['message'];

      List<ListOfDogs> listofDogs = [];
      breeds.forEach((key, value) {
        listofDogs.add(ListOfDogs(name: key));
      });

      return listofDogs;
    } else {
      throw Exception("Failed to load dogs");
    }
  }

  //  End
```

## 4. Architettura del Progetto

Il progetto è organizzato per mantenere un ordine chiaro tra file e cartelle, garantendo una facile reperibilità e manutenzione dei vari componenti.

La struttura del codice è stata progettata per essere semplice e leggibile, suddividendo le parti principali in:

- **Custom Widgets**: Contiene i widget personalizzati per l'interfaccia.
- **API Calls**: Modulo per gestire tutte le chiamate API.
- **Models**: Definizione dei modelli di dati, che facilitano il parsing e la gestione delle informazioni ottenute dalle API.

Questa separazione dei componenti aumenta la manutenibilità e la personalizzazione del progetto, minimizzando il codice duplicato e migliorando la leggibilità.

_Esempio di struttura delle cartelle:_

```
lib/
├── widgets/
│   └── custom_widget.dart
├── api/
│   └── api_call.dart
├── models/
│   └── breed_model.dart
└── main.dart
```

## 5. Guida all'Installazione e Configurazione

Per installare e configurare il progetto, seguire i passaggi:

1. Clonare la repository:
   ```bash
   git clone https://github.com/Robert-Crivat/DogApp
   cd DogApp
   ```

2. Installare le dipendenze:
   ```bash
   flutter pub get
   ```

3. Avviare l'app:
   ```bash
   flutter run
   ```

## 6. Sfide Affrontate e Soluzioni

Le principali sfide affrontate durante lo sviluppo di DogApp hanno riguardato:

- **Pulizia del Codice**: Un obiettivo importante è stato mantenere il codice pulito e riutilizzabile, ottimizzando al massimo i componenti già realizzati.
- **Utilizzo di goRouter**: Durante la prova, ho utilizzato per la prima volta **goRouter** per la gestione della navigazione. È stata una scoperta positiva grazie alla flessibilità e semplicità di utilizzo di questa libreria.

Le API fornite da [dog.ceo](https://dog.ceo/dog-api/) erano ben documentate, facilitando l'integrazione senza particolari problemi.

## 7. Possibili Espansioni Future

In futuro, alcune funzionalità aggiuntive potrebbero migliorare l'app:

- **Ricerca avanzata**: Aggiungere una funzione di ricerca che consenta di filtrare le razze per caratteristiche specifiche.
- **Galleria per preferiti**: Una galleria visiva delle immagini salvate come preferite.
- **Notifiche**: Notifiche push per aggiornamenti su nuove razze o sottorazze aggiunte.

## Ringraziamenti

Ringrazio per l'opportunità fornita, che mi ha permesso di esplorare nuove librerie come goRouter e approfondire le integrazioni API.
