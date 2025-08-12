//
//  IntroduceCoordinator.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import Combine
import SwiftUI


final class IntroduceCoordinator: NavigationControlling, ObservableObject {

  @Published var path = NavigationPath()

  // 액션 기반 네비게이션
  enum Action {
    case start
    case pop
    case popToRoot
    case present(_ route: IntroduceRoute)
    case replaceStack(_ routes: [IntroduceRoute])
  }

  func send(_ action: Action) {
    switch action {
    case .start:
      start()

    case .pop:
      if !path.isEmpty { path.removeLast() }

    case .popToRoot:
      path = .init()


    case .present(let route):
         path.append(route)

       case .replaceStack(let routes):
         replaceStack(routes)

    }
  }

  // MARK: - NavigationControlling 요구 구현
  func start() {
    reset()
    send(.present(.introduceMain))
  }

  // ⚠️ 프로토콜이 요구한다면 private 붙이면 안 됨
  func reset() {
    path = .init()
  }

  // 스택 교체
  func replaceStack(_ routes: [IntroduceRoute], animated: Bool = true) {
    let apply = {
      self.path = .init()
      routes.forEach { self.path.append($0) }
    }

    if animated {
      withAnimation(.default) { apply() }
    } else {
      apply()
    }
  }

  // 편의 오버로드
  func replaceStack(_ route: IntroduceRoute, animated: Bool = true) {
    replaceStack([route], animated: animated)
  }
}

