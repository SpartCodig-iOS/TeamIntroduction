//
//  MissionView.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import SwiftUI

struct MissionView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Image("MissionLogo")
                .renderingMode(.original)
            
            Text("우리의 미션")
                .pretendardFont(family: .bold, size: 14)
                .foregroundStyle(.textPrimary)
            
            Text("혁신적인 기술로 사용자의 삶을 더 편리하고 풍요롭게 만드는 것")
                .pretendardFont(family: .regular, size: 12)
                .foregroundStyle(.textSecondary)
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color(hex: "E9EBEF"))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 1, x: 2, y: 2)
    }
}

#Preview {
    MissionView()
}
