//
//  SettingView.swift
//  SwiftUIForm
//
//  Created by Hyemi Byun on 3/31/21.
//

import SwiftUI

struct SettingView: View {
    private var displayOrders = ["Alphabetical", "Show Favorite First", "Show Check-in First"]
    @State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("SORT PREFERENCE")){
                    Picker(selection: $selectedOrder, label: Text("Display Order")){
                        ForEach(0..<displayOrders.count, id: \.self){
                            Text(self.displayOrders[$0])
                        }
                    }
                }
                Section(header: Text("FILTER PREFERENCE")){
                    Toggle(isOn: $showCheckInOnly) {
                        Text("Filters")
                    }
                    Stepper(onIncrement: {
                        self.maxPriceLevel += 1
                        if self.maxPriceLevel > 5{
                            self.maxPriceLevel = 5
                        }
                    }, onDecrement: {
                        self.maxPriceLevel -= 1
                        if self.maxPriceLevel < 1{
                            self.maxPriceLevel = 1
                        }
                    }){
                        Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
        .overlay(
            HStack{
                Spacer()
                VStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(.black)
                    })
                    .padding(.trailing, 320)
                    .padding(.top, 10)
        
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                            .font(.headline)
                            .foregroundColor(.black)
                    })
                    .padding(.leading, 240)
                    .padding(.top, -27)
                }
            }
        )
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
