//
//  IntroductionViewModel.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import Foundation
import SwiftUI

@MainActor
@Observable
final class IntroductionViewModel {

  // MARK: - State
   private(set) var introductions: [IntroductionRowModel] = []
   private(set) var isLoading = false

  // 네비게이션을 코디네이터로 위임하는 라우팅 클로저
  private let route: (IntroduceCoordinator.Action) -> Void

  // MARK: - Action (뷰에서 이 enum만 쓰면 됩니다)
  enum Action {
    case onAppear
    case refresh
    case tapMoreInfo(TeamExploreItem)
  }

  // MARK: - Init
  /// 기본값: no-op(코디네이터 주입 안 해도 안전)
  init(route: @escaping (IntroduceCoordinator.Action) -> Void = { _ in }) {
    self.route = route
  }

  /// 편의 이니셜라이저: 코디네이터 주입
  convenience init(coordinator: IntroduceCoordinator?) {
    if let coordinator {
      self.init(route: { [weak coordinator] action in coordinator?.send(action) })
    } else {
      self.init() // no-op
    }
  }

  // MARK: - Single entrypoint
  func send(_ action: Action) {
    switch action {
    case .onAppear, .refresh:
      Task { await fetchIntroductions() }

    case .tapMoreInfo(let moreInfo):
      switch moreInfo {
      case .introduction:
        route(.present(.teamIntroduce))
      case .agreement:
        route(.present(.teamAgreement))
      case .blog:
        route(.present(.teamBlog))
      }
    }
  }

  // MARK: - Private
  private func fetchIntroductions() async {
    isLoading = true
    defer { isLoading = false }

    do {
      // mock delay
      try await Task.sleep(nanoseconds: 2_000_000_000)
      introductions = IntroductionRowModel.mockData
    } catch {
      introductions = []
    }
  }
}
