//
//  MemberDetailView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/11/25.
//

import SwiftUI
import SwiftData

struct MemberDetailView: View {
  @ObservedObject var coordinator: IntroduceCoordinator
  @StateObject var viewModel: MemberDetailViewModel
  private var id: UUID

  init(coordinator: IntroduceCoordinator, id: UUID, modelContext: ModelContext) {
    self.coordinator = coordinator
    self.id = id
    self._viewModel = StateObject(wrappedValue: MemberDetailViewModel(memberID: id, modelContet: modelContext))
  }

  var body: some View {
    ZStack {
      if let member = viewModel.member {
        ScrollView {
          Spacer().frame(height: 14)
          CustomNavigationBackBar { coordinator.goBack() }
          Spacer().frame(height: 20)

          VStack(spacing: 20) {
            MemberProfileView(profile: member)

            if viewModel.isEditing {
              IntroductionEditView(member: member)
              StrengthsEditView(member: member)
              CollabStyleEditView(member: member)
              BlogEditView(member: member)
            } else {
              IntroductionDisplayView(introduction: member.introduction)
              StrengthsDisplayView(strengths: member.strengths)
              CollabStyleDisplayView(collabStyle: member.collaborationStyle)
              BlogDisplayView(blogURL: member.blogLink)
            }
          }
          .padding(.horizontal, 16)
          .padding(.bottom, 80)
        }
        .scrollIndicators(.hidden)
      } else {
        ProgressView()
      }

      VStack {
        Spacer()

        if viewModel.isEditing {
          EditButton(text: "저장") {
            viewModel.saveEditing()
          }
        } else {
          EditButton(text: "수정") {
            viewModel.startEditing()
          }
        }
      }
      .padding(.horizontal, 16)
    }
  }
}
