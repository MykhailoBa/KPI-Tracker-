import Foundation

struct KPI: Identifiable {
    var id = UUID()
    var date: Date
    var shift: String
    var kpiPercentage: Double
}
