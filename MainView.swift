import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: AddShiftView()) {
                    MainButton(title: "Додати зміну")
                }
                NavigationLink(destination: LastKPIView()) {
                    MainButton(title: "Останній KPI")
                }
                NavigationLink(destination: MonthlyKPIView()) {
                    MainButton(title: "KPI за місяць")
                }
                NavigationLink(destination: CalendarView()) {
                    MainButton(title: "Календар")
                }
            }
            .navigationTitle("KPI Tracker")
        }
    }
}

struct MainButton: View {
    let title: String
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal, 20)
    }
}
