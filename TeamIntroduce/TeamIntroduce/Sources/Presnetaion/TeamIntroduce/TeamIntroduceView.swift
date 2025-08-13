//
//  TeamIntroduceView.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/12/25.
//

import SwiftUI


struct TeamIntroduceView: View {
  @ObservedObject var coordinator: IntroduceCoordinator

  // 현재까지 보여줄 수 있는 최대 인덱스
  @State private var currentMaxIndex: Int = -1

  // 소개 아이템 배열
  private let introduceItems: [IntroduceItem] = [
    .init(image: .teamInfroducePerson, title: "다양성 존중", subtitle: "각자의 강점과 개성을 인정하고 서로 보완하며 성장합니다."),
    .init(image: .teamInfroduceAccident, title: "창의적 사고", subtitle: "새로운 아이디어를 자유롭게 제안하고 실험하는 문화를 추구 합니다."),
    .init(image: .teamInfroduceHeart, title: "따뜻한 소통", subtitle: "솔직하고 건설적인 피드백으로 서로를 도우며 성장합니다."),
    .init(image: .teamInfroduceCircle, title: "목표지향", subtitle: "명확한 목표를 설정하고 함께 달성해나가는 팀워크를 발휘합니다.")
  ]

  var body: some View {
    ZStack {
      Color.staticWhite
        .edgesIgnoringSafeArea(.all)

      VStack {
        Spacer().frame(height: 14)

        CustomNavigationBackBar(text: "팀소개") {
          coordinator.goBack()
        }

        Spacer().frame(height: 20)

        teamIntorduceHeader()
        teamIntroduceList()
        introduceList()

        Spacer()
      }
    }
  }
}

extension TeamIntroduceView {
  // 타이틀 박스
  @ViewBuilder
  private func teamIntorduceHeader() -> some View {
    VStack {
      Text("우리 팀의 궁극적인 목표")
        .pretendardFont(family: .semiBold, size: 16)
        .foregroundStyle(.gray60)

      Image(asset: .teamiIntroduce)
        .resizable()
        .scaledToFit()
        .frame(width: 56, height: 56)

      Spacer().frame(height: 10)

      HStack {
        Spacer()
        TypingText(
          text: "안녕하세요 1조입니다! 👋",
          font: .pretendardFontFamily(family: .bold, size: 16),
          perChar: 0.06,
          startDelay: 0.15,
          showsCursor: false
        )
        Spacer()
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(.staticWhite)
        .shadow(color: .shadowColor, radius: 2)
    )
    .padding(.horizontal, 16)
  }

  // 팀 특징 타이틀
  @ViewBuilder
  fileprivate func teamIntroduceList() -> some View {
    HStack {
      Text("우리 팀만의 특징")
        .pretendardFont(family: .regular, size: 16)
        .foregroundStyle(.basicBlack)
      Spacer()
    }
    .padding(16)
  }

  // 애니메이션되며 등장하는 소개 리스트
  @ViewBuilder
  private func introduceList() -> some View {
    let indices = Array(introduceItems.indices)

    VStack(spacing: 12) {
      ForEach(indices, id: \.self) { index in
        let item = introduceItems[index]

        introduceItem(
          image: item.image,
          title: item.title,
          subtitle: item.subtitle
        )
        .opacity(index <= currentMaxIndex ? 1 : 0)
        .offset(y: index <= currentMaxIndex ? 0 : 12)
        .onAppear {
          // 이미 등장한 인덱스는 무시
          guard index > currentMaxIndex else { return }
          let delay = 0.25 + 0.15 * Double(index)
          DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.85)) {
              currentMaxIndex = index
            }
          }
        }
      }
    }
  }

  // 개별 아이템 뷰
  @ViewBuilder
  fileprivate func introduceItem(
    image: ImageAsset,
    title: String,
    subtitle: String
  ) -> some View {
    VStack {
      HStack {
        Image(asset: image)
          .resizable()
          .scaledToFit()
          .frame(width: 35, height: 35)

        Spacer().frame(width: 10)

        VStack(alignment: .leading) {
          Text(title)
            .pretendardFont(family: .regular, size: 12)
            .foregroundStyle(.textSecondary100)
          Spacer().frame(height: 4)
          Text(subtitle)
            .pretendardFont(family: .regular, size: 14)
            .foregroundStyle(.textPrimary)
        }

        Spacer()
      }
      .padding(16)
    }
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(.staticWhite)
        .shadow(color: .shadowColor, radius: 2)
    )
    .padding(.horizontal, 16)
  }
}

#Preview {
  @Previewable @StateObject var coordinator: IntroduceCoordinator = IntroduceCoordinator()
  TeamIntroduceView(coordinator: coordinator)
}
