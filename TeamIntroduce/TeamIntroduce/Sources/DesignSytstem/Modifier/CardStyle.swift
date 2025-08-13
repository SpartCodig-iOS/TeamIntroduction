//
//  CardStyle.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/12/25.
//

import SwiftUI

struct CardStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(15)
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(.staticWhite)
      )
      .overlay(
        RoundedRectangle(cornerRadius: 16)
          .stroke(.borderInactive, lineWidth: 0.5)
      )
      .shadow(color: .shadowDefault, radius: 3, x: 0, y: 1)
  }
}

extension View {
  public func cardStyle() -> some View {
    modifier(CardStyle())
  }
}
