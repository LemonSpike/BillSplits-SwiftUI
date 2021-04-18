//
//  BindingStateToView.swift
//  WeSplit
//
//  Created by Pranav Kasetti on 01/11/2020.
//  Copyright © 2020 Pranav Kasetti. All rights reserved.
//

import SwiftUI

struct BindingStateToView: View {

  @State private var name: String = ""

  var body: some View {
    Form {
      TextField("Enter your name: ", text: $name)
      Text("Your name is \(name)!")
    }
  }
}

struct BindingStateToView_Previews: PreviewProvider {
    static var previews: some View {
        BindingStateToView()
    }
}
