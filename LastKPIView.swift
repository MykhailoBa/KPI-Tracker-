import SwiftUI

struct AddShiftView: View {
    @State private var product: String = ""
    @State private var collectedBoxes: String = ""
    @State private var workTime: String = ""
    @State private var showAlert = false

    var body: some View {
        VStack {
            TextField("Продукт", text: $product)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Кількість боксів", text: $collectedBoxes)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Час роботи (год:хв)", text: $workTime)
                .keyboardType(.numbersAndPunctuation)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: saveShift) {
                Text("Зберегти зміну")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
        }
        .navigationTitle("Додати зміну")
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Збережено"), message: Text("Зміна успішно додана!"), dismissButton: .default(Text("OK")))
        }
    }
    
    func saveShift() {
        guard let boxes = Int(collectedBoxes) else { return }
        
        let kpi = KPICalculator.calculateKPI(product: product, collectedBoxes: boxes, workTime: workTime)
        
        ShiftStorage.shared.saveShift(product: product, collectedBoxes: boxes, workTime: workTime)
        
        print("✅ Додано зміну: \(product), \(boxes) боксів, \(workTime), KPI: \(kpi)%")
        
        showAlert = true
    }
}
