//
//  IntorduceCoordinatorView.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import SwiftUI
import SwiftData

struct IntorduceCoordinatorView : View {
  @StateObject private var coordinator =  IntroduceCoordinator()
  
  var sharedModelContainer: ModelContainer = {
    let schema = Schema([
      IntroductionRowModels.self,
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

    do {
      return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }()

  var body: some View {
    NavigationStack(path: $coordinator.path) {
      IntroductionMainView(viewModel: IntroductionViewModel(coordinator: coordinator))
        .navigationDestination(for: IntroduceRoute.self, destination: makeDestination)
    }
    .modelContainer(sharedModelContainer)
  }
}


extension IntorduceCoordinatorView {
  @ViewBuilder
  private func makeDestination(for route: IntroduceRoute) -> some View {
    switch route {
    case .introduceMain:
      IntroductionMainView(viewModel: IntroductionViewModel(coordinator: coordinator))

    case .memberDetail:
      MemberDetailView(coordinator: coordinator)
        .navigationBarBackButtonHidden()
    case .teamAgreement:
      TeamAgreeMentView(coordinator: coordinator)
        .navigationBarBackButtonHidden()
    case .teamIntroduce:
      TeamIntroduceView(coordinator: coordinator)
        .navigationBarBackButtonHidden()
    case .teamBlog:
      TeamBlogView(viewModel: .init(coordinator: coordinator))
        .navigationBarBackButtonHidden()

    case .webView(let url):
      WebView(coordinator: coordinator, url: url)
    }
  }
}
