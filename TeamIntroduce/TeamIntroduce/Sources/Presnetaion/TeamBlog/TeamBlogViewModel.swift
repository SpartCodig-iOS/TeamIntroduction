//
//  TeamBlogViewModel.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/12/25.
//

import SwiftUI
import Combine
import SwiftData

@MainActor
@Observable
final class TeamBlogViewModel {
  // MARK: - Properties

  private(set) var isLoading = false
  var currentMaxIndex: Int = -1
  var members: [TeamMember] = []

  private let modelContext: ModelContext
  private let route: (IntroduceCoordinator.Action) -> Void
  private let goBack: () -> Void


  // MARK: - Init

  init(
    modelContext: ModelContext,
    route: @escaping (IntroduceCoordinator.Action) -> Void = { _ in },
    goBack: @escaping () -> Void = {}
  ) {
    self.modelContext = modelContext
    self.route = route
    self.goBack = goBack
  }

  // 코디네이터 주입 편의 생성자
  convenience init(modelContext: ModelContext, coordinator: IntroduceCoordinator?) {
    if let coordinator {
      self.init(
        modelContext: modelContext,
        route: { [weak coordinator] action in coordinator?.send(action) },
        goBack: { [weak coordinator] in coordinator?.goBack() }
      )
    } else {
      self.init(modelContext: modelContext)
    }
  }

  // MARK: - Action Handling

  enum Action {
    case onAppear
    case refresh
    case presentWebView(url: String)
    case backToRoot
    case fetchData
  }

  func send(_ action: Action) {
    switch action {
      case .onAppear, .refresh:
        Task { await fetchIntroductions() }
      case .presentWebView(let url):
        route(.present(.webView(url: url)))
      case .backToRoot:
        goBack()

      case .fetchData:
        let descriptor = FetchDescriptor<TeamMember>(sortBy: [SortDescriptor(\.name, order: .forward)])
        do {
          self.members = try modelContext.fetch(descriptor) // members는 [TeamMember] 타입!
        } catch {
          print("Failed to fetch members: \(error)")
        }
    }
  }

  // MARK: - Private Methods

  private func fetchIntroductions() async {
    isLoading = true
    defer { isLoading = false }
    try? await Task.sleep(for: .seconds(0.3))
    send(.fetchData)
  }
}
