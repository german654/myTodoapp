/*********************************************
 * Nombre del archivo: todo_event.dart
 * Propósito: Este archivo define los eventos relacionados con el
 *            manejo de tareas dentro de un BLoC. Cada evento se utiliza
 *            para manejar una acción específica en la lista de tareas
 *            como iniciar la lista, agregar, eliminar o modificar tareas.
 *
 * Autor: Walter Stefano
 * Fecha de creación: 2024-03-15
 * Última modificación: 2024-03-15
 * Versión: 1.0.0
 *********************************************/

part of 'todo_bloc.dart';

/// `TodoEvent` es la clase base abstracta para todos los eventos
/// relacionados con las tareas. Extiende `Equatable` para facilitar
/// la comparación entre instancias de eventos.
@immutable
abstract class TodoEvent extends Equatable {
	const TodoEvent();

	@override
  List<Object?> get props => [];
}

/// Evento que representa la acción de iniciar la lista de tareas.
class TodoStarted extends TodoEvent {}
/// Evento que representa la acción de agregar una tarea a la lista.
class AddTodo extends TodoEvent {
	final Todo todo;

	const AddTodo(this.todo);

	@override
  List<Object?> get props => [todo];
}
/// Evento que representa la acción de eliminar una tarea de la lista.
class RemoveTodo extends TodoEvent {
	final Todo todo;

	const RemoveTodo(this.todo);

	@override
  List<Object?> get props => [todo];
}
/// Evento que representa la acción de modificar una tarea en la lista.
class AlterTodo extends TodoEvent {
	final int index;

	const AlterTodo(this.index);

	@override
  List<Object?> get props => [index];
}