//
//  ContentView.swift
//  iOS-WeSplit
//
//  Created by Sunimal Herath on 23/3/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocus: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount/100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        
        return amountPerPerson
    }
    
    // TODO
    /**
        1. Show the total tip amount below the tip percentage selection
        2. Add clear button to the TextField
        3. Keep the TextField empty when the app loads
        4. After entering the amount currency sign does not show in the TextField unless user navigates to the "Number of people" and comes back.
     */
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "AUD")
                    )
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocus)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Text(
                        totalPerPerson,
                        format: .currency(code: Locale.current.currency?.identifier ?? "AUD")
                    )
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocus {
                    Button("Done") {
                        amountIsFocus = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
