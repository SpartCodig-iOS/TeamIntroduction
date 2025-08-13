//
//  IntroductionMainView.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import SwiftUI
import SwiftData

struct IntroductionMainView: View {
  @Environment(\.modelContext) private var modelContext
  // SwiftData에서 가져오는 실제 데이터
  @Query private var items: [IntroductionRowModels]

  // 화면에 쓸 리스트 (DB가 비어 있으면 mock 사용)
  private var displayItems: [IntroductionRowModels] {
    items.isEmpty ? IntroductionRowModels.mockData : items
  }

  @State private var viewModel: IntroductionViewModel

    init(viewModel: IntroductionViewModel) {
      _viewModel = State(initialValue: viewModel)
    }


  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        MissionView()

        VStack {
          Text("팀원 소개")
            .pretendardFont(family: .bold, size: 14)
            .foregroundStyle(.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
          if viewModel.isLoading {
            ForEach(0..<3, id: \.self) { _ in
              SkeletonRowView()
            }
          } else {
            ForEach(viewModel.introductions) { model in
              IntroductionRowView(model: model)
                .onTapGesture {
                  print(model.id)
                  viewModel.send(.presentMemberDetail)
                }
            }
          }
        }

        VStack {
          Text("더 알아보기")
            .pretendardFont(family: .bold, size: 14)
            .foregroundStyle(.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)

          ForEach(TeamExploreItem.allCases) { item in
            TeamExploreRowView(item: item)
              .onTapGesture {
                viewModel.send(.tapMoreInfo(item))
              }
          }
        }
      }
      .padding(.horizontal, 16)
    }
    .onAppear {
      viewModel.send(.onAppear)
      seedIfNeeded()
      logAllRows()

    }
  }

  private func seedIfNeeded() {
      guard items.isEmpty else { return }
      IntroductionRowModels.mockData.forEach { m in
        let copy = IntroductionRowModels(
          name: m.name,
          role: m.role,
          imageName: m.imageName,
          mbti: m.mbti,
          introduction: m.introduction,
          isLeader: m.isLeader
        )
        modelContext.insert(copy)
      }

      do {
        try modelContext.save()
      } catch {
        #if DEBUG
        print("⚠️ SwiftData save 실패: \(error)")
        #endif
      }
    }

  // MARK: - 전체 데이터 로깅
  private func logAllRows() {
    let descriptor = FetchDescriptor<IntroductionRowModels>(
      sortBy: [SortDescriptor(\.name)]
    )
    do {
      let rows = try modelContext.fetch(descriptor)
      print("=== IntroductionRowModels total: \(rows.count) ===")
      for (i, r) in rows.enumerated() {
        print("[\(i)] id=\(r.id.uuidString), name=\(r.name), role=\(r.role), image=\(r.imageName), mbti=\(String(describing: r.mbti)), leader=\(r.isLeader), intro=\(r.introduction ?? "nil")")
      }
    } catch {
      print("⚠️ Fetch 실패: \(error)")
    }
  }
}

#Preview {
  IntroductionMainView(viewModel: IntroductionViewModel())
}
