//
//  BlogView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/12/25.
//
import SwiftUI

struct BlogView: View {
  var isEditing: Bool
  @Binding var blogURL: String

  var body: some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("블로그")
        .pretendardFont(family: .semiBold, size: 14)

      if isEditing {
        TextField("블로그 URL", text: $blogURL)
          .pretendardFont(family: .regular, size: 13)
          .cardStyle()
      } else {
        Text(blogURL)
          .pretendardFont(family: .regular, size: 13)
          .cardStyle()
      }
    }
  }
}
