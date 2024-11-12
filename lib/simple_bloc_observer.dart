/*********************************************
 * Nombre del archivo: simple_bloc_observer.dart
 * Propósito: Este archivo define un observador personalizado de BLoC
 *            que permite registrar información detallada sobre los
 *            eventos, cambios y transiciones dentro de los BLoCs en la
 *            aplicación. Es útil para depuración y monitoreo de BLoC.
 *
 * Autor: Walter Stefano
 * Fecha de creación: 2024-03-15
 * Última modificación: 2024-03-15
 * Versión: 1.0.0
 **********************************************/

import 'dart:developer';
import 'package:bloc/bloc.dart';

/// `SimpleBlocObserver` extiende de `BlocObserver`
/// Esta clase personaliza el comportamiento de los observadores de BLoC
/// para interceptar y registrar eventos, cambios y errores dentro de los BLoCs.
class SimpleBlocObserver extends BlocObserver {
  /// Método llamado cuando se crea un BLoC.
  @override
	void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- bloc: ${bloc.runtimeType}');
  }

  /// Método llamado cuando se emite un evento dentro de un BLoC.
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  /// Método llamado cuando cambia el estado del BLoC.
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  /// Método llamado cuando hay una transición de estado en el BLoC.
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  /// Método llamado cuando ocurre un error dentro de un BLoC.
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  /// Método llamado cuando se cierra un BLoC.
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose -- bloc: ${bloc.runtimeType}');
  }
}
