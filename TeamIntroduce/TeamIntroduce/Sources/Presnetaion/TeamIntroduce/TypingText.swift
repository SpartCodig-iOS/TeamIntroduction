//
//  TypingText.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/12/25.
//

import SwiftUI

struct TypingText: View {
  let text: String
  var font: Font = .pretendardFontFamily(family: .semiBold, size: 20)
  var perChar: Double = 0.05     // 글자당 지연(초)
  var startDelay: Double = 0.0   // 시작 지연(초)
  var showsCursor: Bool = true   // 커서 표시 여부

  @Environment(\.accessibilityReduceMotion) private var reduceMotion
  @State private var displayed: String = ""
  @State private var blink = false
  @State private var task: Task<Void, Never>?

  var body: some View {
    HStack(spacing: 0) {
      Text(displayed).font(font)

      if showsCursor {
        Text("|")
          .font(font)
          .opacity(blink ? 0 : 1)
          .animation(.easeInOut(duration: 0.6).repeatForever(), value: blink)
          .accessibilityHidden(true)
      }
    }
    .onAppear { startTyping() }
    .onChange(of: text) { _ , _ in startTyping() }
    .onDisappear { task?.cancel() }
  }

  private func startTyping() {
    task?.cancel()

    guard !reduceMotion else {
      displayed = text
      blink.toggle()
      return
    }

    displayed = ""
    blink = false

    task = Task {
      if startDelay > 0 {
        try? await Task.sleep(nanoseconds: UInt64(startDelay * 1_000_000_000))
      }
      for ch in text {
        displayed.append(ch)
        try? await Task.sleep(nanoseconds: UInt64(perChar * 1_000_000_000))
      }
      await MainActor.run { blink = true }
    }
  }
}
