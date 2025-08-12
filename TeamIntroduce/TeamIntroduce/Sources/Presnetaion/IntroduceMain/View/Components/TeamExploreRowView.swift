//
//  TeamExploreRowView.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import SwiftUI


struct TeamExploreRowView: View {

  private let item: TeamExploreItem

  init(item: TeamExploreItem) {
    self.item = item
  }

  var body: some View {
    HStack {
      Image(asset: item.imageName)
        .frame(width: 42, height: 42)

      VStack(alignment: .leading, spacing: 4) {
        Text(item.title)
          .pretendardFont(family: .semiBold, size: 14)
          .foregroundStyle(.textPrimary)

        Text(item.subtitle)
          .pretendardFont(family: .regular, size: 12)
          .foregroundStyle(.textSecondary)
      }

      Spacer()

      Image("ArrowRight")
        .foregroundStyle(Color(hex: "717182"))
    }
    .padding(16)
    .background(Color.staticWhite)
    .clipShape(RoundedRectangle(cornerRadius: 12))
    .shadow(radius: 1)
  }
}

#Preview {
  VStack {
    TeamExploreRowView(item: .introduction)
    TeamExploreRowView(item: .agreement)
    TeamExploreRowView(item: .blog)
  }
}
