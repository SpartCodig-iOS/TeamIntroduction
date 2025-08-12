//
//  ListRowComponet.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import SwiftUI

struct ListRowComponet: View {
  // 기존 프로퍼티
  private var color: Color
  private var image: ImageAsset
  private var title: String
  private var subContent: String
  private var blogUrl: String
  private var showArrow: Bool
  private var moreInfoItem: MoreInfoItem

  // 선택 전달 (부모가 소유)
  @Binding private var selection: MoreInfoItem

  // 선택 시 추가 작업이 필요하면 사용 (옵셔널)
  private var arrowAction: ((MoreInfoItem) -> Void)?

  init(
    color: Color,
    image: ImageAsset,
    title: String,
    subContent: String,
    blogUrl: String,
    showArrow: Bool,
    moreInfoItem: MoreInfoItem,
    selection: Binding<MoreInfoItem>,
    arrowAction: ((MoreInfoItem) -> Void)? = nil
  ) {
    self.color = color
    self.image = image
    self.title = title
    self.subContent = subContent
    self.blogUrl = blogUrl
    self.showArrow = showArrow
    self.moreInfoItem = moreInfoItem
    self._selection = selection
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

        VStack(alignment: .leading, spacing: 0) {
          Text(title)
            .pretendardFont(family: .SemiBold, size: 14)
            .foregroundStyle(.basicBlack)

          Spacer().frame(height: 4)

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
          // 👉 버튼으로 만들어 터치영역/접근성 강화
          Button {
            selection = moreInfoItem           // ✅ 선택 상태 갱신
            arrowAction?(moreInfoItem)         // 필요 시 추가 콜백
          } label: {
            Image(asset: .rightArrow)
              .resizable()
              .scaledToFit()
              .frame(width: 12, height: 12)
              .padding(10)                     // 터치영역 확장
          }
          .buttonStyle(.plain)
          .contentShape(Rectangle())
          .accessibilityLabel(Text("\(title) 열기"))
        }
      }
    }
    .padding(.vertical, 16)
    .padding(.horizontal, 15)
    .frame(height: 69)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(.staticWhite)
        .shadow(color: .shadowColor, radius: 1)
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
    moreInfoItem: .teamBlog,
    selection: .constant(.teamBlog),
    arrowAction: { item in

    }
  )
}
