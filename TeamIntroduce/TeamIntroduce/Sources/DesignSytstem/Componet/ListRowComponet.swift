//
//  ListRowComponet.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import SwiftUI

struct ListRowComponet: View {
  private var color: Color
  private var image: ImageAsset
  private var title: String
  private var subContent: String
  private var blogUrl: String
  private var showArrow: Bool
  private var arrowAction: () -> Void = {}

  init(
    color: Color,
    image: ImageAsset,
    title: String,
    subContent: String,
    blogUrl: String,
    showArrow: Bool,
    arrowAction: @escaping () -> Void
  ) {
    self.color = color
    self.image = image
    self.title = title
    self.subContent = subContent
    self.blogUrl = blogUrl
    self.showArrow = showArrow
    self.arrowAction = arrowAction
  }

    var body: some View {
      VStack {
        HStack {
          Circle()
            .fill(color)
            .frame(width: 35, height: 35)
            .overlay {
              Image(asset: image)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            }

          VStack(alignment: .leading, spacing: .zero) {
            Text(title)
              .pretendardFont(family: .SemiBold, size: 14)
              .foregroundStyle(.basicBlack)

            Spacer()
              .frame(height: 4)

            Text(subContent)
              .pretendardFont(family: .Regular, size: 12)
              .foregroundStyle(.textSecondary)

            if !blogUrl.isEmpty {
              Text(blogUrl)
                .pretendardFont(family: .Regular, size: 10)
                .foregroundStyle(.textSecondary100)
            }


          }

          Spacer()

          if showArrow {
            Image(asset: .rightArrow)
              .resizable()
              .scaledToFit()
              .frame(width: 12, height: 12)
              .onTapGesture {
                arrowAction()
              }
          }


        }
      }
      .padding(.vertical, 16)
      .padding(.horizontal, 15)
      .frame(height: 69)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(.staticWhite)
          .shadow( color: .shadowColor, radius: 1)
      )

    }
}

#Preview {
  ListRowComponet(
    color: .blue10,
    image: .people,
    title: "팀소개",
    subContent: "우리 팀의 특징과 목표",
    blogUrl: "",
    showArrow: true,
    arrowAction: {}
  )
}
