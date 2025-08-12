//
//  RootView.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import SwiftUI

struct RootView: View {
  @StateObject var coordinator = IntroduceCoordinator()
    var body: some View {
        IntorduceCoordinatorView()
        .environmentObject(coordinator)
    }
}

#Preview {
    RootView()
}


