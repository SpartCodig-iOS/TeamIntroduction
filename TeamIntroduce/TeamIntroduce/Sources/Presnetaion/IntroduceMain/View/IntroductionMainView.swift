//
//  IntroductionMainView.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import SwiftUI

struct IntroductionMainView: View {
  @State private var viewModel: IntroductionViewModel

    init(viewModel: IntroductionViewModel) {
      _viewModel = State(initialValue: viewModel)
    }


  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        MissionView()

        VStack {
          Text("팀원 소개")
            .pretendardFont(family: .bold, size: 14)
            .foregroundStyle(.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
          if viewModel.isLoading {
            ForEach(0..<3, id: \.self) { _ in
              SkeletonRowView()
            }
          } else {
            ForEach(viewModel.introductions) { model in
              IntroductionRowView(model: model)
            }
          }
        }

        VStack {
          Text("더 알아보기")
            .pretendardFont(family: .bold, size: 14)
            .foregroundStyle(.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)

          ForEach(TeamExploreItem.allCases) { item in
            TeamExploreRowView(item: item)
              .onTapGesture {
                viewModel.send(.tapMoreInfo(item))
              }
          }
        }
      }
      .padding(.horizontal, 16)
    }
    .onAppear {
      viewModel.send(.onAppear)
    }
  }
}

#Preview {
  IntroductionMainView(viewModel: IntroductionViewModel())
}
