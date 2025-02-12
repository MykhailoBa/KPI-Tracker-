import SwiftUI

struct AddShiftView: View {
    @State private var product: String = ""
    @State private var collectedBoxes: String = ""
    @State private var workTime: String = ""

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
                .keyboardType(.numberPad)
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
    }
    
    func saveShift() {
        // Тут буде логіка збереження даних
    }
}
