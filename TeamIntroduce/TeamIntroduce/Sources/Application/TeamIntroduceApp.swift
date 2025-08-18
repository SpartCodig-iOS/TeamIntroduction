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
                introduction: "안녕하세요 다같이 열심히해서 좋은 결과 가져가면 좋을 것 같습니다 잘부탁드립니다~",
                strengths: ["꼼꼼함", "긍정적", "책임감", "꾸준함"],
                blogLink: "https://0minnie0.tistory.com/",
                collaborationStyle: "명확한 목표 설정과 주기적인 진행 상황 공유를 통해 함께 좋은 결과를 얻을 수 있도록 기여하고 싶습니다.",
                isLeader: true
            ),
            TeamMember(
                name: "서원지",
                imageName: "person.crop.circle.fill",
                role: "iOS Developer",
                mbti: .intp,
                introduction: "좀 큰 기업에  입사를 하고 다양한 프로젝트르 하고 싶습니다",
                strengths: ["Swift", "SwiftUI", "Clean Architecture", "Swift Concurrency", "TCA", "Tuist", "RxSwift"],
                blogLink: "https://velog.io/@suhwj/posts",
                collaborationStyle: "창의적 문제해결, 사용자 중심 사고, 코드리뷰, 팀 리딩, 지식 공유"
            ),
            TeamMember(
                name: "홍석현",
                imageName: "shEmoji",
                role: "iOS Developer",
                mbti: .enfj,
                introduction: "디버깅을 잘하는 개발자가 되고 싶습니다~! 😄",
                strengths: ["TCA", "Swift Concurrency", "Clean Architecture"],
                blogLink: "https://velog.io/@gustjrghd/posts",
                collaborationStyle: "코드 리뷰, 적극적 의사 소통"
            )
        ]
    }
}
