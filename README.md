# Środowisko pracy


## Wymagania stanowiska

- System operacyjny Windows/Linux/MacOS
- Docker - najnowsza wersja

# Dostęp do Bazy Danych i tworzenie własnych zmiennych środowiskowych

Dodawanie własnych zmiennych środowiskowych jest możliwe po utworzeniu pliku konfiguracyjnego ```.env``` w lokalizacji ```/web```. Przykład w pliku ```.env.example```


# Uruchamianie - DOCKER

- Utwórz plik .env w katalogu /web

- Start projektu

```
docker compose up -d
```

- Zatrzymanie projektu

```
docker compose down
```