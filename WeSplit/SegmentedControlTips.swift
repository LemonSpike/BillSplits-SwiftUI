//
//  SegmentedControlTips.swift
//  WeSplit
//
//  Created by Pranav Kasetti on 29/03/2021.
//  Copyright © 2021 Pranav Kasetti. All rights reserved.
//

import SwiftUI

struct SegmentedControlTips: View {
  @State private var checkAmount = ""
  @State private var numberOfPeople = "2"
  @State private var tipPercentage = 2
  let tipPercentages = [10,25,15,32,81]

  var grandTotal: Double {
    let tipSelection = Double(tipPercentages[tipPercentage])
    let orderAmount = Double(checkAmount) ?? 0
    let tipValue = orderAmount / 100 * tipSelection
    let total = orderAmount + tipValue
    return total
  }

  var totalPerPerson: Double {
    let doubleNumberPeeps = Double(numberOfPeople) ?? 0
    let peopleCount = doubleNumberPeeps
    let amountPerPerson = grandTotal / peopleCount

    return amountPerPerson
  }

  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad)
          Section {
            Picker("Tip percentage", selection: $tipPercentage) {
              ForEach(0 ..< tipPercentages.count) {
                Text("\(self.tipPercentages[$0])%")
              }
            }.pickerStyle(SegmentedPickerStyle())
          }
//          Picker("Number of people", selection: $numberOfPeople) {
//            ForEach(2 ..< 100) {
//              Text("\($0) people")
//            }
//          }
          TextField("Number of people", text: $numberOfPeople)
        }

        Section(header: Text("Amount per person:")) {
          Text("$\(totalPerPerson, specifier: "%.2f")")
        }

        Section(header: Text("Total Amount")) {
          Text("$\(grandTotal, specifier: "%.2f")")
        }
      }
      .navigationBarTitle("WeSplit")
    }
  }
}

struct SegmentedControlTips_Previews: PreviewProvider {
  static var previews: some View {
    SegmentedControlTips()
  }
}
