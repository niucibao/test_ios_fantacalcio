# test_ios_fantacalcio

## Descrizione

Il progetto è un'applicazione iOS che utilizza un UITabBarController per gestire due schermate principali. Il primo view controller contiene una UITableView che mostra una lista di giocatori. I dati dei giocatori vengono fetchati tramite chiamate REST e vengono visualizzati insieme alle relative foto, nomi e squadra. Inoltre, è presente una barra di ricerca per filtrare la lista dei giocatori i quali nomi iniziano con i caratteri cercati. In questa schemata è anche possibile salvare i giocatori preferiti.
 Il secondo view controller utilizza CoreData per gestire i giocatori preferiti, che vengono salvati localmente e mostrati in questa schermata.

## Requisiti di Sistema

- iOS 13.0 o versioni successive
- Xcode 11 o versioni successive
- Linguaggio: Swift
- Framework: UIKit
- Persistence: CoreData

## Installazione

1. Clona o scarica il repository dall'URL: https://github.com/niucibao/test_ios_fantacalcio.git
2. Apri il progetto in Xcode.
3. Assicurati che i file di dipendenza siano correttamente inclusi nel progetto.
4. Esegui l'applicazione utilizzando il simulatore o un dispositivo iOS collegato.

## Configurazione

1. Assicurati che il tuo dispositivo o simulatore iOS abbia una connessione Internet attiva per poter fetchare i dati dei giocatori tramite chiamate REST.

## Utilizzo

1. Avvia l'applicazione sul tuo dispositivo o simulatore iOS.
2. Verrà visualizzata la schermata principale con un UITabBarController che mostra due tab.
3. La lista  dei giocatori sarà preselezionata.
4. La lista dei giocatori verrà caricata tramite chiamate REST e mostrata in una UITableView.
5. Scorri verso l'alto e verso il basso per visualizzare tutti i giocatori nella lista.
6. Utilizza la barra di ricerca per filtrare la lista dei giocatori in base al nome o al cognome.
7. Tocca il pulsante a destra per salvare un giocatore come preferito.
8. Seleziona la seconda tab per accedere alla schermata dei giocatori preferiti.
9. I giocatori preferiti, salvati tramite CoreData, verranno visualizzati in questa schermata.
10. L'applicazione salverà i giocatori preferiti in CoreData per un accesso futuro.

## Struttura del Progetto

Il progetto è organizzato secondo la seguente struttura:

- **Model**: Contiene la definizione dei modelli dati per i giocatori e le relative informazioni.
- **View**: Contiene le UITableViewCell custom 
- **ViewModel**: Contiene le implementazioni dei ViewModel per ogni schermata e i protocolli da loro utilizzati.
- **Controller**: Contiene i controller per le due schermate principali, che gestiscono il flusso delle schermate e comunicano con i ViewModel.
- **Networking**: Contiene le implementazioni per le chiamate REST e il parsing dei dati JSON per ottenere i giocatori.
- **Persistence**: Contiene le implementazioni per la gestione di CoreData per salvare i giocatori preferiti.
- **Utils**: Contiene i files con le extensions delle classi native

## Dipendenze


- Non sono presenti librerie esterne

## Licenza

Il progetto è rilasciato con la licenza Nicola Lauritano.

## Contatti

Per domande o feedback, puoi contattare Nicola Lauritano all'indirizzo email niucibao@gmail.com .
