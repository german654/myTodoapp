/*********************************************
 * Nombre: main.dart
 * Propósito: Punto de entrada principal de la aplicación  de tareas (Todo App).
 *           Inicializa la configuracion de almacenamiento, observadores de BLoC ,
 *           el estado global y la UI inicial de la aplicación
 *
 * Autor: Walter Stefano
 * Fecha de creación: 2024-03-15
 * Última modificación: 2024-03-15
 * Versión: 1.0.0
 *********************************************/

// Importaciones del framework Flutter
import 'package:flutter/material.dart';

// Importaciones relacionadas con el estado (BLoC)
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// Importaciones de utilidades y servicios
import 'package:path_provider/path_provider.dart';

// Importaciones locales de la aplicación
import 'package:flutter_todo_clean/home.dart';
import 'package:flutter_todo_clean/simple_bloc_observer.dart';
import 'todo_bloc/todo_bloc.dart';

/// Punto de entrada principal de la aplicación
///
/// Inicializa los servicios necesarios como HydratedBloc para
/// persistencia de estado y configura el observador de BLoC
/// antes de lanzar la aplicación
void main() async {
  // Asegura que los widgets de Flutter estén inicializados
  WidgetsFlutterBinding.ensureInitialized();

  // Configura el almacenamiento persistente para HydratedBloc
  // Esto permite que el estado persista entre reinicios de la app
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  // Configura el observador personalizado para debugging de BLoC
  Bloc.observer = SimpleBlocObserver();

  // Inicia la aplicación con el widget raíz
  runApp(const MainApp());
}

/// Widget principal de la aplicación
///
/// Configura el tema global, proveedores de estado y la estructura
/// básica de la aplicación usando MaterialApp
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Desactiva el banner de debug en la esquina
      debugShowCheckedModeBanner: false,

      title: 'Todo App',

      // Configuración del tema global de la aplicación
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          // Colores principales para superficies
          surface: Colors.white,
          onSurface: Colors.black,

          // Colores primarios para elementos destacados
          primary: Colors.yellowAccent,
          onPrimary: Colors.black,

          // Colores secundarios para acciones adicionales
          secondary: Colors.lightGreen,
          onSecondary: Colors.white,
        ),
      ),

      // Configuración del estado global y pantalla inicial
      home: BlocProvider<TodoBloc>(
        // Crea una nueva instancia del TodoBloc y dispara el evento inicial
        create: (context) => TodoBloc()
          ..add(
            TodoStarted(),
          ),
        // Pantalla principal de la aplicación
        child: const HomeScreen(),
      ),
    );
  }
}
