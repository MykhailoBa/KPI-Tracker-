import Foundation

class ShiftStorage {
    static let shared = ShiftStorage()
    private let key = "savedShifts"

    func saveShift(product: String, collectedBoxes: Int, workTime: String) {
        let shiftData = ["product": product, "collectedBoxes": collectedBoxes, "workTime": workTime] as [String : Any]
        var shifts = loadShifts()
        shifts.append(shiftData)
        UserDefaults.standard.set(shifts, forKey: key)
    }

    func loadShifts() -> [[String: Any]] {
        return UserDefaults.standard.array(forKey: key) as? [[String: Any]] ?? []
    }
}
