# WCS Mobil

## Local development
There is a deploy script for local development purposes.
You only need Docker installed on your machine to use this script.

1. Install Docker Desktop (or server)
https://docs.docker.com/engine/install
2. Start Docker Desktop 

After Docker started successfully you can start backend:
```bash
$ ergast/ergast.sh backend
```

## Run
To run application you can set an API url as run argument. If not
provided it's defaults to `https://ergast.com/api/f1`.

### Command line
Run with ergast.com API
```bash
flutter run
```

Run with local backend
```bash
flutter run --dart-define API_URL=https://localhost:8000/api/f1
```

### IntelliJ
Add to `Additional run args` in run configuration
```
--dart-define API_URL=https://ergast.com/api/f1
```

### VSCode
```json
{
    "configurations": [
        {
            "name": "Flutter (lib/main.dart)",
            "type": "dart",
            "request": "launch",
            "program": "lib/main.dart",
            "args":[
                "--dart-define",
                "API_URL=https://ergast.com/api/f1"
            ]
        }
    ]
}
```

## Mock

You can start the app without backend by using mock data. To do so:
```bash
flutter run lib/main_mock.dart --release 
```

## Widgetbook

You can start widgetbook to see widgets:
```bash
flutter run lib/main_widgetbook.dart --release 
```