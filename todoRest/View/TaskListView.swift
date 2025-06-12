

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var taskService = TaskService()
    @State private var newTaskTitle = ""

    var body: some View {
        
        VStack {
            HStack {
                Button("Salir") {
                    appState.logout()
                }
                Spacer()
            }
            .padding()
           
            HStack {
                TextField("Escribe una tarea...", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minWidth: 300)
                
                Button("Agregar") {
                    guard !newTaskTitle.isEmpty else { return }
                    taskService.addTask(title: newTaskTitle)
                    newTaskTitle = ""
                }
            }
           

            List {
                ForEach(taskService.tasks) { task in
                    HStack {
                        Button(action: {
                            taskService.toggleTask(task)
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                        .buttonStyle(BorderlessButtonStyle())

                        Text(task.title)
                            .strikethrough(task.isCompleted)
                    }
                }
                .onDelete(perform: taskService.deleteTask)
            }
            .frame(minWidth: 400, minHeight: 300)
        }
        .padding()
    }
}

#Preview {
    TaskListView()
}
