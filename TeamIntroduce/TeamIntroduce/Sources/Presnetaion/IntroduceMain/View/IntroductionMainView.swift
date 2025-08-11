//
//  IntroductionMainView.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import SwiftUI

struct IntroductionMainView: View {
    @ObservedObject var viewModel: IntroductionViewModel
    
    init(viewModel: IntroductionViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                MissionView()
                
                VStack {
                    Text("팀원 소개")
                        .pretendardFont(family: .Bold, size: 14)
                        .foregroundStyle(.textPrimary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 8)
                    
                    ForEach(viewModel.introductions) { model in
                        IntroductionRowView(model: model)
                    }
                }
            }
            .padding(.horizontal, 16)
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}

#Preview {
    IntroductionMainView(viewModel: IntroductionViewModel())
}
