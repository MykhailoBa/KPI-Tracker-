import Foundation

class KPICalculator {
    static func calculateKPI(product: String, collectedBoxes: Int, workTime: String) -> Double {
        let norms: [String: (palletsPerHour: Double, boxesPerPallet: Int)] = [
            "JS": (9, 55),
            "MS": (5, 45),
            "Waitrose": (9, 55),
            "Ocado": (5, 45),
            "Маркет": (11, 65)
        ]
        
        guard let norm = norms[product], let workTimeMinutes = timeStringToMinutes(workTime) else { return 0 }
        
        let workTimeHours = Double(workTimeMinutes) / 60.0
        let actualPalletsPerHour = Double(collectedBoxes) / Double(norm.boxesPerPallet) / workTimeHours
        let kpi = (actualPalletsPerHour / norm.palletsPerHour) * 100
        
        return round(kpi * 10) / 10  // Округлення до 1 знака
    }

    static func timeStringToMinutes(_ time: String) -> Int? {
        let components = time.split(separator: ":").compactMap { Int($0) }
        guard components.count == 2 else { return nil }
        return components[0] * 60 + components[1]
    }
}
