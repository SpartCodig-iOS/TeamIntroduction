//
//  IntroduceRoute.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

enum IntroduceRoute: Hashable {

  // 소개 페이지 메인 화면
  case introduceMain
  // 팀약속
  case teamAgreement
  // 팀소개
  case teamIntroduce
  // 팀 블로그
  case temBlog


  // MARK: - 내부 전용 초기화

  /// 내부 Route 값을 기반으로 IntroduceRoute를 생성합니다.
  ///
  /// 외부에서는 직접 case를 생성하지 않고, 내부에서만 변환을 허용합니다.
  ///
  /// - Parameter route: 내부용 Route enum 값
  init(route: Route) {
    switch route {
    case .introduceMain: self = .introduceMain
    case .teamAgreement : self = .teamAgreement
    case .teamIntroduce: self = .teamIntroduce
    case .temBlog: self = .temBlog
    }
  }

  // MARK: - 내부 전용 라우트 Enum

  /// 외부 접근은 가능하지만 직접 IntroduceRoute를 생성할 수 없도록 제어하기 위한 내부 enum입니다.
  enum Route {
    case introduceMain
    case teamAgreement
    case teamIntroduce
    case temBlog
  }
}
