//
//  TeamAgreeMentView.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/13/25.
//

import SwiftUI

struct TeamAgreeMentView: View {
  @ObservedObject var coordinator: IntroduceCoordinator
  
  private let agreeMentItem = AgreeMentItem.items
  @State private var currentMaxIndex: Int = -1
  
  
  var body: some View {
    ZStack {
      Color.white
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        Spacer()
          .frame(height: 14)
        
        CustomNavigationBackBar(text: "팀 약속") {
          coordinator.goBack()
        }
        
        
        teamAgreeMentHeader()
        
        agreeMentCard()
        
      }
    }
  }
}

extension TeamAgreeMentView {
  
  @ViewBuilder
  private func teamAgreeMentHeader() -> some View {
    VStack {
      Image(asset: .teamiIntroduce)
        .resizable()
        .scaledToFit()
        .frame(width: 56, height: 56)
      
      Spacer().frame(height: 10)
      
      HStack {
        Spacer()
        
        Text("우리의 약속")
          .pretendardFont(family: .medium, size: 16)
          .foregroundStyle(.textPrimary)
        
        Spacer()
      }
      
      Spacer().frame(height: 10)
      
      HStack {
        Spacer()
        TypingText(
          text: "더 나은 팀이 되기 위해 함께 지켜나갈 소중한 약속들입니다.",
          font: .pretendardFontFamily(family: .bold, size: 16),
          perChar: 0.06,
          startDelay: 0.15,
          showsCursor: false
        )
        Spacer()
      }
    }
    .cardStyle()
    .padding(16)
  }
  
  @ViewBuilder
  private func agreeMentCard() -> some View {
    let indices = Array(agreeMentItem.indices)
    ScrollView(.vertical) {
      ForEach(indices, id: \.self) { index in
        let item = agreeMentItem[index]
        agreeMenListitem(
          number: item.number,
          agreeMentTitle: item.agreeMentTitle,
          agreeMentSubTitle: item.agreeMentSubTitle,
          circleColor: item.color,
          fontColor: item.color
        )
        .staggeredAppear(index: index, currentMaxIndex: $currentMaxIndex)
      }
    }
    .scrollIndicators(.hidden)
  }
  
  
  @ViewBuilder
  private func agreeMenListitem(
    number: Int,
    agreeMentTitle: String,
    agreeMentSubTitle: String,
    circleColor: Color,
    fontColor: Color
  ) -> some View {
    VStack {
      HStack {
        Circle()
          .fill(circleColor.opacity(0.3))
          .frame(width: 40, height: 40)
          .overlay {
            Text("\(number)")
              .pretendardFont(family: .semiBold, size: 12)
              .foregroundStyle(fontColor)
          }

        Spacer()
          .frame(width: 10)

        VStack(alignment: .leading) {
          HStack {
            Text(agreeMentTitle)
              .pretendardFont(family: .regular, size: 12)
              .foregroundStyle(.staticBlack)

            Spacer()
          }
          
          Text(agreeMentSubTitle)
            .pretendardFont(family: .regular, size: 12)
            .foregroundStyle(.textPrimary)
          
        }
        
        Spacer()
      }
      .padding(.vertical, 16)
    }
    .cardStyle()
    .padding(.horizontal, 16)
  }
}

#Preview {
  TeamAgreeMentView(coordinator: IntroduceCoordinator())
}
