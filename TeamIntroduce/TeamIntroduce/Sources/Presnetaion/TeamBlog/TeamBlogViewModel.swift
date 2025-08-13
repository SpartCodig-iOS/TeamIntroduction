//
//  TeamBlogViewModel.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/12/25.
//

import SwiftUI
import Combine

@MainActor
@Observable
final class TeamBlogViewModel {
  private(set) var isLoading = false
  var currentMaxIndex: Int = -1

  // 라우팅
  private let route: (IntroduceCoordinator.Action) -> Void
  private let goBack: () -> Void

  let blogs: [BlogItem] = [
    .init(name: "김민희",
          blogTitle: "모바일개발과 크로스플랫폼 기술을 공유합니다",
          blogLink: "https://0minnie0.tistory.com/"),
    .init(name: "서원지",
          blogTitle: "모바일개발과 크로스플랫폼 기술을 공유합니다",
          blogLink: "https://velog.io/@suhwj/posts"),
    .init(name: "홍석현",
          blogTitle: "모바일개발과 크로스플랫폼 기술을 공유합니다",
          blogLink: "https://velog.io/@gustjrghd/posts")
  ]

  // MARK: - Init
  init(
    route: @escaping (IntroduceCoordinator.Action) -> Void = { _ in },
    goBack: @escaping () -> Void = {}
  ) {
    self.route = route
    self.goBack = goBack
  }

  // 코디네이터 주입 편의 생성자
  convenience init(coordinator: IntroduceCoordinator?) {
    if let coordinator {
      self.init(
        route: { [weak coordinator] action in coordinator?.send(action) },
        goBack: { [weak coordinator] in coordinator?.goBack() }
      )
    } else {
      self.init()
    }
  }

  // MARK: - Action
  enum Action {
    case onAppear
    case refresh
    case presentWebView(url: String)
    case backToRoot                       
  }

  // MARK: - Single entrypoint
  func send(_ action: Action) {
    switch action {
    case .onAppear, .refresh:
      Task { await fetchIntroductions() }

    case .presentWebView(let url):
      route(.present(.webView(url: url)))

    case .backToRoot:
      goBack()
    }
  }

  // MARK: - Private
  private func fetchIntroductions() async {
    isLoading = true
    defer { isLoading = false }
    try? await Task.sleep(for: .seconds(0.3))
  }
}
