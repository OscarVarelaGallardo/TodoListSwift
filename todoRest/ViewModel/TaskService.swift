import Foundation

class TaskService: ObservableObject{
    static let baseURL = "http://localhost:3000"
    
    @Published var tasks: [TaskItem] = []
    
    static func addTask(id: Int, completion: @escaping (Bool) -> Void){
        guard let url = URL(string: "\(baseURL)/notes/\(id)") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
