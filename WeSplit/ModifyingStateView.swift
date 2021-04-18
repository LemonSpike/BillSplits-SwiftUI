//
//  ModifyingStateView.swift
//  WeSplit
//
//  Created by Pranav Kasetti on 01/11/2020.
//  Copyright © 2020 Pranav Kasetti. All rights reserved.
//

import SwiftUI

struct ModifyingStateView: View {

  @State private var tapCount = 0

  var body: some View {
    Button("Tap Count: \(tapCount)") {
      self.tapCount += 1
    }
  }
}

struct ModifyingStateView_Previews: PreviewProvider {
  static var previews: some View {
    ModifyingStateView()
  }
}
