import SwiftUI

struct MonthlyKPIView: View {
    @State private var monthlyKPI: String = "Немає даних"

    var body: some View {
        VStack {
            Text("Середній KPI за місяць")
                .font(.title)
                .padding()

            Text(monthlyKPI)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.green)
                .padding()

            Spacer()
        }
        .navigationTitle("KPI за місяць")
        .onAppear(perform: calculateMonthlyKPI)
    }

    func calculateMonthlyKPI() {
        let shifts = ShiftStorage.shared.loadShifts()
        var totalKPI: Double = 0
        var count: Int = 0

        for shift in shifts {
            if let product = shift["product"] as? String,
               let collectedBoxes = shift["collectedBoxes"] as? Int,
               let workTime = shift["workTime"] as? String {
                
                let kpi = KPICalculator.calculateKPI(product: product, collectedBoxes: collectedBoxes, workTime: workTime)
                totalKPI += kpi
                count += 1
            }
        }

        if count > 0 {
            monthlyKPI = "\(round((totalKPI / Double(count)) * 10) / 10)%"
        } else {
            monthlyKPI = "Немає змін"
        }
    }
}
