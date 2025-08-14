//
//  IntroductionViewModel.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import Foundation
import SwiftUI
import Combine
import SwiftData

@MainActor
@Observable
final class IntroductionViewModel {

  // MARK: - State
  private(set) var introductions: [TeamMember] = []
  private(set) var isLoading = false

  // 네비게이션을 코디네이터로 위임하는 라우팅 클로저
  private let route: (IntroduceCoordinator.Action) -> Void
  private let modelContext: ModelContext

  // MARK: - Action (뷰에서 이 enum만 쓰면 됩니다)
  enum Action {
    case onAppear
    case refresh
    case tapMoreInfo(TeamExploreItem)
    case presentMemberDetail(id: UUID)
  }

  // MARK: - Init
  /// 기본값: no-op(코디네이터 주입 안 해도 안전)
  init(route: @escaping (IntroduceCoordinator.Action) -> Void = { _ in }, modelContext: ModelContext) {
    self.route = route
    self.modelContext = modelContext
  }

  /// 편의 이니셜라이저: 코디네이터 주입
  convenience init(coordinator: IntroduceCoordinator?, modelContext: ModelContext) {
    if let coordinator {
      self.init(route: { [weak coordinator] action in coordinator?.send(action) }, modelContext: modelContext)
    } else {
      self.init(modelContext: modelContext) // no-op
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

    case .presentMemberDetail(let id):
      route(.present(.memberDetail(id: id)))
    }
  }

  // MARK: - Private
  private func fetchIntroductions() async {
    isLoading = true
    defer { isLoading = false }

    do {
      let descriptor = FetchDescriptor<TeamMember>()
      let members = try modelContext.fetch(descriptor)
      introductions = members
    } catch {
      introductions = []
    }
  }
}
