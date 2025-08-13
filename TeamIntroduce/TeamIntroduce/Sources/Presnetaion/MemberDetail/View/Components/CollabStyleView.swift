//
//  CollabStyleView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/12/25.
//
import SwiftUI

struct CollabStyleView: View {
  var isEditing: Bool 
  @Binding var collabStyle: String

  
  var body: some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("협업스타일")
        .pretendardFont(family: .semiBold, size: 14)

      if isEditing {
        TextField("협업스타일", text: $collabStyle, axis: .vertical)
          .pretendardFont(family: .regular, size: 13)
          .foregroundStyle(.textSecondary100)
          .lineSpacing(5)
          .lineLimit(1...10)
          .cardStyle()
      } else {
        Text(collabStyle)
          .pretendardFont(family: .regular, size: 13)
          .foregroundStyle(.textSecondary100)
          .lineSpacing(5)
          .cardStyle()
      }
    }
  }
}
