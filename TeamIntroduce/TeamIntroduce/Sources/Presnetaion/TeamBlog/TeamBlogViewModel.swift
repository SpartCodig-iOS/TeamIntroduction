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

  private let route: (IntroduceCoordinator.Action) -> Void
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


  // MARK: - Action (뷰에서 이 enum만 쓰면 됩니다)
  enum Action {
    case onAppear
    case refresh

    case presentWebView(url: String)
  }

  // MARK: - Single entrypoint
  func send(_ action: Action) {
    switch action {
    case .onAppear, .refresh:
      Task { await fetchIntroductions() }

    case .presentWebView(let url):
      route(.present(.webView(url: url)))
    }
  }

  // MARK: - Private
  private func fetchIntroductions() async {
    isLoading = true
    Task {
      try await Task.sleep(for: .seconds(0.3))

      isLoading = false
    }
  }
}
