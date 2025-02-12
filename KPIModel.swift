import Foundation

struct KPIModel: Identifiable {
    let id = UUID()
    let date: String
    let product: String
    let collectedBoxes: Int
    let workTime: String
    let kpi: Double
}
