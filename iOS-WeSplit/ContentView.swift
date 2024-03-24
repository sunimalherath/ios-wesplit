//
//  ContentView.swift
//  iOS-WeSplit
//
//  Created by Sunimal Herath on 23/3/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State var name = ""
    
    var students = ["John", "Jane", "Michelle"]
    @State private var selectedStudent = "Michelle"
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                
                Section {
                    Text("Hello There")
                    Button("Tap Count: \(tapCount)") {
                        tapCount+=1
                    }
                }
                
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    ForEach(0..<5) { number in
                        Text("Row \(number)")
                    }
                }
                
                Section {
                    ForEach(0..<5) {
                        Text("Row \($0)")
                    }
                }
            }
            .navigationTitle("Swift UI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
