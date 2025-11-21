#  📓 Widgetbook
Esta herramienta permite crear un catálogo interactivo de todos los widgets de la aplicación. Es ideal para documentar y probar componentes de UI de manera aislada.

## 🏗️ Agregar un [USECASE](https://docs.widgetbook.io/use-cases/overview)
Usaremos una estructura de archivos similar a la de la aplicacion. 
``` 
vitam_usuario/
├── pubspec.yaml
├── lib/
├   └── features/
├       └── profile/
├── ...
└── widgetbook/
    ├── pubspec.yaml
    ├── lib/
    ├   └── features/
    ├       └── profile/
    └── ...
```
1. Entramos a la carpeta [Widgetbook](widgetbook/README.md)
    ``` bash
    cd widgetbook
    ```
    *  Si no existe la carpeta donde crearemos el USECASE, la creamos
        ``` bash
        mkdir nombre_feature
        ```
    * Agregamos el archivo del USECASE
        ``` bash
        touch nombre_usecase.dart
        ```
2. Agregamos el USECASE. Aqui un ejemplo basico
    ``` dart
    import 'package:flutter/material.dart';
    import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

    // Importa el widget desde tu aplicación
    import 'package:your_app/cool_button.dart';

    @widgetbook.UseCase(name: 'Default', type: CoolButton)
    Widget buildCoolButtonUseCase(BuildContext context) {
        return CoolButton(
            // Puedes agregar parámetros con valores por defecto
            text: 'Click me',
            onPressed: () {},
        );
    }
    ```
3. Agregamos nuestro USECASE a la configuración
    ``` bash
    dart run build_runner build -d
    ```
4. Correr la app
    * Corre tu emulador
    * Ejecuta el siguiente comando
        ``` bash
        flutter run
        ``` 
### 🔧 Comandos Útiles
``` bash 
# Generar código con watch mode (regenera automáticamente)
dart run build_runner watch -d

# Limpiar archivos generados
dart run build_runner clean

```

### 🚀 Comandos Flutter
``` bash
r  # Hot reload. 🔥🔥🔥
R  # Hot restart.
h  # List all available interactive commands.
d  # Detach (terminate "flutter run" but leave application running).
c  # Clear the screen
q  # Quit (terminate the application on the device).
```
