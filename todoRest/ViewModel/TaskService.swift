import Foundation

class TaskService: ObservableObject{
    @Published var tasks: [TaskItem] = []
    func addTask(title:String){
        let task = TaskItem(title: title)
        tasks.append(task)
    }
    
    func toggleTask(_ task: TaskItem) {
           if let index = tasks.firstIndex(where: { $0.id == task.id }) {
               tasks[index].isCompleted.toggle()
           }
       }

       func deleteTask(at offsets: IndexSet) {
           tasks.remove(atOffsets: offsets)
       }
}
