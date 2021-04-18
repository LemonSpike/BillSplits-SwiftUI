//
//  ArrayOfLoopView.swift
//  WeSplit
//
//  Created by Pranav Kasetti on 01/11/2020.
//  Copyright © 2020 Pranav Kasetti. All rights reserved.
//

import SwiftUI

struct ArrayOfLoopView: View {

  private var students = ["Harry", "Jennifer", "Lauren", "Pranab"]

  @State private var selectedStudent = 0

  var body: some View {
    NavigationView {
      VStack {
        Picker("Select your student", selection: $selectedStudent) {
          ForEach(0 ..< students.count) {
            Text(self.students[$0])
          }
        }
        Text("You chose: Student # \(selectedStudent)")
        Form {
          Picker("heres a title", selection: $selectedStudent) {
            ForEach(0..<students.count) {
              Text(self.students[$0])
            }
          }
        }
      }
    }
  }
}

struct ArrayOfLoopView_Previews: PreviewProvider {
  static var previews: some View {
    ArrayOfLoopView()
      .previewDevice("iPad Air (4th generation)")
  }
}
