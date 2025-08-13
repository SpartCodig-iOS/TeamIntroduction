//
//  SkeletonRowView.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import SwiftUI

struct SkeletonRowView: View {
  @State private var isAnimating = false

  var body: some View {
    HStack {
      Circle()
        .frame(width: 42, height: 42)
        .foregroundColor(.gray.opacity(0.3))

      VStack(alignment: .leading, spacing: 4) {
        RoundedRectangle(cornerRadius: 4)
          .frame(width: 80, height: 16)
          .foregroundColor(.gray.opacity(0.3))

        RoundedRectangle(cornerRadius: 4)
          .frame(width: 120, height: 12)
          .foregroundColor(.gray.opacity(0.2))

        RoundedRectangle(cornerRadius: 8)
          .frame(width: 50, height: 20)
          .foregroundColor(.gray.opacity(0.2))
      }

      Spacer()

      RoundedRectangle(cornerRadius: 4)
        .frame(width: 16, height: 16)
        .foregroundColor(.gray.opacity(0.2))
    }
    .padding(16)
    .background(Color.staticWhite)
    .clipShape(RoundedRectangle(cornerRadius: 12))
    .shadow(radius: 1)
    .opacity(isAnimating ? 0.5 : 1.0)
    .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isAnimating)
    .onAppear {
      isAnimating = true
    }
  }
}

#Preview {
  VStack {
    SkeletonRowView()
    SkeletonRowView()
    SkeletonRowView()
  }
  .padding()
}
