//
//  CollabStyleEditView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/14/25.
//
import SwiftUI

struct CollabStyleEditView: View {
  @Binding var collabStyle: String


  var body: some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("협업스타일")
        .pretendardFont(family: .semiBold, size: 14)

      TextField("협업스타일", text: $collabStyle, axis: .vertical)
        .pretendardFont(family: .regular, size: 13)
        .foregroundStyle(.textSecondary100)
        .lineSpacing(5)
        .lineLimit(1...10)
        .cardStyle()
    }
  }
}
