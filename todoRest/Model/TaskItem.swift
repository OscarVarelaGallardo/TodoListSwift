import Foundation

struct TaskItem:Identifiable,Codable{
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}
