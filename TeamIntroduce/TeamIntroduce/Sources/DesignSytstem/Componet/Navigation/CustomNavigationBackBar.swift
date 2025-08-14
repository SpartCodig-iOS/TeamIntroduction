//
//  CustomNavigationBackBar.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/12/25.
//

import SwiftUI

 struct CustomNavigationBackBar: View {
  private var buttonAction: () -> Void = { }
  private var text: String


  init(
    text: String = "",
    buttonAction: @escaping () -> Void
  ) {
    self.buttonAction = buttonAction
    self.text = text
  }

   var body: some View {
    HStack {
      Image(asset: .leftArrow)
        .resizable()
        .scaledToFit()
        .frame(width: 10, height: 20)
        .foregroundStyle(.staticWhite)

      Spacer()
        .frame(width: 20)

      if !text.isEmpty {
        Text(text)
          .pretendardFont(family: .regular, size: 14)
          .foregroundStyle(.textPrimary)
      }

      Spacer()


    }
    .padding(.horizontal, 30)
    .onTapGesture {
      buttonAction()
    }
  }
}
