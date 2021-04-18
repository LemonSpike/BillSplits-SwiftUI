//
//  SwiftUIView.swift
//  WeSplit
//
//  Created by Pranav Kasetti on 21/11/2020.
//  Copyright © 2020 Pranav Kasetti. All rights reserved.
//

import SwiftUI

struct ReadingTextField: View {

  @State private var checkAmount = ""
  @State private var numberOfPeople = 2
  @State private var tipPercentage = "20"

  let tipPercentages = ["10", "15", "20", "25", "0"]

  var tipValue: Double {
    let orderAmount = Double(checkAmount) ?? 0
    let tipSelection = Double(tipPercentage) ?? 0
    return orderAmount / 100 * tipSelection
  }

  var totalAmount: Double {
    let orderAmount = Double(checkAmount) ?? 0
    return orderAmount + tipValue
  }

  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let amountPerPerson = totalAmount / peopleCount
    return amountPerPerson
  }

  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad)
        }
        Section(header: Text("What tip % do you want to leave?")) {
          TextField("Tip percentage", text: $tipPercentage)
        }
        Section {
          Picker("Number of people", selection: $numberOfPeople) {
            ForEach(2 ..< 100) {
              Text("\($0) people")
            }
          }
        }
        Section(header: Text("Amount per person")) {
          Text("$\(totalPerPerson, specifier: "%.2f")")
        }
        Section(header: Text("Check")) {
          Text("Check amount: $\(checkAmount)")
          Text("Tip amount: $\(tipValue, specifier: "%.2f")")
          Text("Total amount: $\(totalAmount, specifier: "%.2f")")
            .background(tipValue > 0 ? Color.clear : .red)
        }
      }
      .navigationBarTitle("WeSplit")
    }
  }
}

struct ReadingTextField_Previews: PreviewProvider {
  static var previews: some View {
    ReadingTextField()
  }
}
