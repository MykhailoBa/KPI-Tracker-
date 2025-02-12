import Foundation

class KPIViewModel: ObservableObject {
    @Published var kpis: [KPI] = []

    func addKPI(kpi: KPI) {
        kpis.append(kpi)
    }
}
