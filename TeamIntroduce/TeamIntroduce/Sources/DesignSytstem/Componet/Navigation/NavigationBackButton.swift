//
//  NavigationBackButton.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/12/25.
//

import SwiftUI

 struct NavigationBackButton: View {
  var buttonAction: () -> Void = { }

   init(
    buttonAction: @escaping () -> Void
  ) {
    self.buttonAction = buttonAction
  }

   var body: some View {
    HStack {
      Image(asset: .leftArrow)
        .resizable()
        .scaledToFit()
        .frame(width: 10, height: 20)
        .foregroundStyle(.gray400)


      Spacer()

    }
    .padding(.horizontal, 20)
    .onTapGesture {
      buttonAction()
    }
  }
}


