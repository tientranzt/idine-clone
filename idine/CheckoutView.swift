//
//  CheckoutView.swift
//  idine
//
//  Created by tientran on 8/9/20.
//

import SwiftUI

struct CheckoutView: View {
    // state of view
    @EnvironmentObject var order: Order
    static let tipAmounts = [10, 15, 20, 25, 0]
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    
    // computed properties for calculate total prices
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                // animaltion() use for binding value change
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine loyalty card")
                }

                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
                
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                    
                }.pickerStyle(SegmentedPickerStyle()) // segment style
            }
            
            Section(header:
                Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
                        .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    self.showingPaymentAlert.toggle()
                }
                .alert(isPresented: $showingPaymentAlert) {
                    Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") – thank you!"), dismissButton: .default(Text("OK")))

                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

//struct CheckoutView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckoutView()
//    }
//}
