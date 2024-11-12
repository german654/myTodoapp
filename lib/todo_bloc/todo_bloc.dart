/*********************************************
 * Nombre del archivo: todo_bloc.dart
 * Propósito: Este archivo define la lógica del BLoC (Business Logic
 *            Component) para gestionar el estado de las tareas en la
 *            aplicación. Maneja los eventos relacionados con las tareas
 *            (iniciar, agregar, eliminar, alterar) y actualiza el estado
 *            de las tareas en consecuencia.
 *
 * Autor: [nombre_del_autor]
 * Fecha de creación: [fecha]
 * Última modificación: [fecha]
 * Versión: 1.0.0
 **********************************************/


import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import '../data/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

/// `TodoBloc` es el BLoC que gestiona los eventos relacionados con las
/// tareas y actualiza el estado de las tareas en consecuencia. Extiende
/// `HydratedBloc` para persistir el estado de manera automática.
class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<TodoStarted>(_onStarted);
		on<AddTodo>(_onAddTodo);
		on<RemoveTodo>(_onRemoveTodo);
		on<AlterTodo>(_onAlterTodo);
  }

	/// Maneja el evento `TodoStarted`, que se usa para iniciar la lista de tareas.
	void _onStarted(
		TodoStarted event,
		Emitter<TodoState> emit,
	) {
		if(state.status == TodoStatus.success) return;
		emit(
			state.copyWith(
				todos: state.todos,
				status: TodoStatus.success
			)
		);
	}

	/// Maneja el evento `AddTodo`, que se usa para agregar una tarea a la lista.
	void _onAddTodo(
		AddTodo event,
		Emitter<TodoState> emit,
	) {
		emit(
			state.copyWith(
				status: TodoStatus.loading
			)
		);
		try {
			List<Todo> temp = [];
			temp.addAll(state.todos);
		  temp.insert(0, event.todo);
			emit(
				state.copyWith(
					todos: temp,
					status: TodoStatus.success
				)
			);
		} catch (e) {
		  emit(
				state.copyWith(
					status: TodoStatus.error
				)
			);
		}
	}

	/// Maneja el evento `RemoveTodo`, que se usa para eliminar una tarea de la lista.
	void _onRemoveTodo(
		RemoveTodo event,
		Emitter<TodoState> emit,
	) {
		emit(
			state.copyWith(
				status: TodoStatus.loading
			)
		);
		try {
			state.todos.remove(event.todo);
			emit(
				state.copyWith(
					todos: state.todos,
					status: TodoStatus.success
				)
			);
		} catch (e) {
		  emit(
				state.copyWith(
					status: TodoStatus.error
				)
			);
		}
	}

	/// Maneja el evento `AlterTodo`, que se usa para alternar el estado de completado
	void _onAlterTodo(
		AlterTodo event,
		Emitter<TodoState> emit,
	) {
		emit(
			state.copyWith(
				status: TodoStatus.loading
			)
		);
		try {
			state.todos[event.index].isDone = !state.todos[event.index].isDone;
			emit(
				state.copyWith(
					todos: state.todos,
					status: TodoStatus.success
				)
			);
		} catch (e) {
		  emit(
				state.copyWith(
					status: TodoStatus.error
				)
			);
		}
	}

	/// Método para deserializar el estado desde JSON. Este método es parte de la
	@override
	 TodoState? fromJson(Map<String, dynamic> json) {
		return TodoState.fromJson(json);
	 }

	/// Método para serializar el estado a JSON. Este método es parte de la
	@override
	 Map<String, dynamic>? toJson(TodoState state) {
		 return state.toJson();
	 }
}
