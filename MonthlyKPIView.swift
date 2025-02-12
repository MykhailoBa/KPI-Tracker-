import SwiftUI

struct MonthlyKPIView: View {
    var body: some View {
        VStack {
            Text("Середній KPI за місяць: 94.6%")
                .font(.largeTitle)
                .padding()
            
            Spacer()
        }
        .navigationTitle("KPI за місяць")
    }
}
