//
//  IntroduceCoordinator.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import Combine
import SwiftUI

import SwiftUI
import Combine

final class IntroduceCoordinator: NavigationControlling, ObservableObject {

  @Published var path = NavigationPath()

  // 액션 기반 네비게이션
  enum Action {
    case start
    case presentMain
    case pop
    case popToRoot
    case  presntDetail
  }

  func send(_ action: Action) {
    switch action {
    case .start:
      start()

    case .presentMain:
      path.append(IntroduceRoute(route: .introduceMain))

    case .pop:
      if !path.isEmpty { path.removeLast() }

    case .popToRoot:
      path = .init()

    case .presntDetail:
      path.append(IntroduceRoute(route: .teamAgreement))
      
    }
  }

  // MARK: - NavigationControlling 요구 구현

  func start() {
    reset()
    send(.presentMain)
  }

  // ⚠️ 프로토콜이 요구한다면 private 붙이면 안 됨
  func reset() {
    path = .init()
  }
}
