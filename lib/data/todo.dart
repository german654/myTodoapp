/*********************************************
 * Nombre: todo.dart
 * Propósito: Modelo de datos para representar una tarea (Todo)
 *            con funcionalidades de serialización y clonación
 *
 * Autor: Walter Stefano
 * Fecha de creación: 2024-03-15
 * Última modificación: 2024-03-15
 * Versión: 1.0.0
 *********************************************/

/// Clase que representa una tarea (Todo) en la aplicación Todo-Clean
///
/// Esta clase proporciona la estructura de datos básica para las tareas,
/// incluyendo título, subtítulo y estado de completado.
/// También incluye métodos para serialización JSON y clonación.
class Todo {
	final String title;
	final String subtitle;
	bool isDone;
	/// Constructor por defecto
	Todo({
		this.title = '',
		this.subtitle = '',
		this.isDone = false
	});
	/// Crea una copia de la tarea con campos opcionales actualizados
	Todo copyWith({
    String? title,
		String? subtitle,
		bool? isDone,
  }) {
    return Todo(
      title: title ?? this.title,
			subtitle: subtitle ?? this.subtitle,
			isDone: isDone ?? this.isDone,
    );
  }
	/// Crea una instancia de [Todo] desde un Map JSON
	factory Todo.fromJson(Map<String, dynamic> json) {
		return Todo(
			title: json['title'],
			subtitle: json['subtitle'],
			isDone: json['isDone']
		);
  }
	/// Convierte la instancia de [Todo] a un Map JSON
	Map<String, dynamic> toJson() {
		return {	
			'title': title,
			'subtitle': subtitle,
			'isDone': isDone
		};
  }
	/// Proporciona una representación en string del objeto [Todo]
	@override
  String toString() {
    return '''Todo: {
			title: $title\n
			subtitle: $subtitle\n
			isDone: $isDone\n
		}''';
  }
}