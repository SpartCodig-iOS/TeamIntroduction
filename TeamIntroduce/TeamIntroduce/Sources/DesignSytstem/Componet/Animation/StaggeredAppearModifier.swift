//
//  StaggeredAppearModifier.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/13/25.
//

import SwiftUI

struct StaggeredAppearModifier: ViewModifier {
  let index: Int
  @Binding var currentMaxIndex: Int

  var baseDelay: Double = 0.25
  var stepDelay: Double = 0.15
  var hiddenYOffset: CGFloat = 12
  var animation: Animation = .spring(response: 0.5, dampingFraction: 0.85)

  @Environment(\.accessibilityReduceMotion) private var reduceMotion

  func body(content: Content) -> some View {
    content
      .opacity(index <= currentMaxIndex ? 1 : 0)
      .offset(y: index <= currentMaxIndex ? 0 : hiddenYOffset)
      .onAppear {
        guard index > currentMaxIndex else { return }
        guard !reduceMotion else {
          currentMaxIndex = index
          return
        }

        let delay = baseDelay + stepDelay * Double(index)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
          withAnimation(animation) {
            currentMaxIndex = index
          }
        }
      }
  }
}

extension View {
  func staggeredAppear(
    index: Int,
    currentMaxIndex: Binding<Int>,
    baseDelay: Double = 0.25,
    stepDelay: Double = 0.15,
    hiddenYOffset: CGFloat = 12,
    animation: Animation = .spring(response: 0.5, dampingFraction: 0.85)
  ) -> some View {
    modifier(
      StaggeredAppearModifier(
        index: index,
        currentMaxIndex: currentMaxIndex,
        baseDelay: baseDelay,
        stepDelay: stepDelay,
        hiddenYOffset: hiddenYOffset,
        animation: animation
      )
    )
  }
}
