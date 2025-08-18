//
//  TeamIntroduceApp.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import SwiftUI
import SwiftData

@main
struct TeamIntroduceApp: App {
  var body: some Scene {
    WindowGroup {
      RootView()
        .modelContainer(for: TeamMember.self) { result in
          // 🎯 초기 데이터 설정
          switch result {
            case .success(let container):
              setupInitialData(container: container)
            case .failure(let error):
              print("❌ SwiftData 컨테이너 생성 실패: \(error)")
          }
        }
    }
  }

  // MARK: - 초기 데이터 설정
  private func setupInitialData(container: ModelContainer) {
    let context = container.mainContext

    // 🔍 기존 데이터 확인
    let descriptor = FetchDescriptor<TeamMember>(sortBy: [SortDescriptor(\.name, order: .forward)])
    let existingCount = (try? context.fetch(descriptor).count) ?? 0

    print("📊 기존 팀원 데이터 개수: \(existingCount)")

    // 데이터가 없으면 샘플 데이터 추가
    if existingCount == 0 {
      print("🎯 초기 팀원 데이터 생성 중...")

      let members = createMembers()

      for member in members {
        context.insert(member)
        print("✅ 팀원 추가: \(member.name) (ID: \(member.id))")
      }

      do {
        try context.save()
        print("💾 초기 데이터 저장 완료!")

        // 저장 후 다시 확인
        let savedCount = (try? context.fetch(descriptor).count) ?? 0
        print("📊 저장된 팀원 데이터 개수: \(savedCount)")
      } catch {
        print("❌ 데이터 저장 실패: \(error)")
      }
    } else {
      print("ℹ️ 기존 데이터가 있어서 초기화를 건너뜁니다.")
    }
  }

  // MARK: - 샘플 데이터 생성
  private func createMembers() -> [TeamMember] {
    return [
      TeamMember(
        name: "김민희",
        imageName: "profileImageMinHee",
        role: "iOS Developer",
        mbti: .estp,
        introduction: "캠프 후 되고 싶은 나의 모습 혹은 미래의 나의 모습을 한마디로 적어보세요! 생생하게 꿈꾸면 이루어진답니다!",
        strengths: ["UIKit", "Core Data", "Auto Layout", "Unit Testing"],
        blogLink: "https://0minnie0.tistory.com/",
        collaborationStyle: "세심한 검토, 문서화 중시, 체계적 정리, 품질 관리",
        blogTitle: "모바일개발과 크로스플랫폼 기술을 공유합니다",
        isLeader: true,
      ),
      TeamMember(
        name: "서원지",
        imageName: "wonjiiProfile",
        role: "iOS Developer",
        mbti: .intp,
        introduction: "좀 큰 기업에  입사를 하고 다양한 프로젝트르 하고 싶습니다",
        strengths: ["Swift", "SwiftUI", "Clean Architecture", "Swift Concurrency", "TCA", "Tuist", "RxSwift"],
        blogLink: "https://velog.io/@suhwj/posts",
        collaborationStyle: "창의적 문제해결, 사용자 중심 사고, 코드리뷰, 팀 리딩, 지식 공유",
        blogTitle: "새로안 지식 공유 및  트렌디한 기술을 공유 합니다"
      ),
      TeamMember(
        name: "홍석현",
        imageName: "shEmoji",
        role: "iOS Developer",
        mbti: .enfj,
        introduction: "안녕하세요! 열정적인 iOS 개발자입니다.",
        strengths: ["SwiftUI", "Combine", "Swift Concurrency", "MVVM Architecture"],
        blogLink: "https://blog.example.com/hong",
        collaborationStyle: "적극적 소통, 코드 리뷰, 팀 리딩, 지식 공유",
        blogTitle: "모바일개발과 크로스플랫폼 기술을 공유합니다"
      )
    ]
  }
}
