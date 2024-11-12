/*********************************************
 * Nombre: todo_state.dart
 * Propósito: Define el estado y la estructura de datos
 *            para el manejo de todos en el BLoC
 *
 * Autor: Walter Stefano
 * Fecha de creación: 2024-03-15
 * Última modificación: 2024-03-15
 * Versión: 1.0.0
 *********************************************/

part of 'todo_bloc.dart';

/// Enum que define los posibles estados de la gestión de todos
///
/// [initial]: Estado inicial cuando se crea el BLoC
/// [loading]: Estado durante la carga o procesamiento de todos
/// [success]: Estado cuando una operación se completa exitosamente
/// [error]: Estado cuando ocurre un error en alguna operación
enum TodoStatus { initial, loading, success, error }

/// Clase que representa el estado del BLoC de todos
class TodoState extends Equatable {
	final List<Todo> todos;
	final TodoStatus status;

	/// Constructor const para crear una instancia inmutable de [TodoState]
	///
	/// Por defecto, inicia con:
	/// - Una lista vacía de todos
	/// - Estado inicial
	const TodoState({
		this.todos = const <Todo>[],
		this.status = TodoStatus.initial
	});

	/// Crea una nueva instancia de [TodoState] con valores opcionales actualizados
	TodoState copyWith({
    TodoStatus? status,
    List<Todo>? todos,
  }) {
    return TodoState(
			todos: todos ?? this.todos,
      status: status ?? this.status,
    );
  }

	/// Crea una instancia de [TodoState] desde un Map JSON
	@override
  factory TodoState.fromJson(Map<String, dynamic> json) {
    try {
      var listOfTodos = (json['todo'] as List<dynamic>)
				.map((e) => Todo.fromJson(e as Map<String, dynamic>))
				.toList();

      return TodoState(
				todos: listOfTodos,
				status: TodoStatus.values.firstWhere(
					(element) => element.name.toString() == json['status']
				)
			);
    } catch (e) {
			rethrow;
    }
  }
	/// Convierte el estado actual a un Map JSON
	Map<String, dynamic> toJson() {
		return {
			'todo': todos,
			'status': status.name
		};
	}
	/// Define los campos que se utilizarán para comparaciones de igualdad
	@override
  List<Object?> get props => [todos, status];
}