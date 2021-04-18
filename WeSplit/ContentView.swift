//
//  ContentView.swift
//  WeSplit
//
//  Created by Pranav Kasetti on 11/07/2020.
//  Copyright © 2020 Pranav Kasetti. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = ""
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 2
  let tipPercentages = [10,25,15,32,81]

    var body: some View {
      NavigationView {
        Form {
          Section {
            TextField("Amount", text: $checkAmount)
              .keyboardType(.decimalPad)
            Picker("Number of people", selection: $numberOfPeople) {
              ForEach(2 ..< 100) {
                Text("\($0) people")
              }
            }
          }

          Section {
            Text("$\(checkAmount)")
          }
        }
        .navigationBarTitle("WeSplit")
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
