//
//  IntorduceCoordinatorView.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import SwiftUI
import SwiftData

struct IntorduceCoordinatorView : View {
  @EnvironmentObject private var coordinator: IntroduceCoordinator
  var sharedModelContainer: ModelContainer = {
    let schema = Schema([
      Item.self,
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
      ContentView()
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
      ContentView()
    case .teamAgreement:
      ContentView()
    case .teamIntroduce:
      EmptyView()
    case .teamBlog:
      EmptyView()
    }
  }
}
