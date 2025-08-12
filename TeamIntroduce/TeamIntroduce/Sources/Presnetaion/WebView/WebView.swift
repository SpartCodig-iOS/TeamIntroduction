//
//  WebView.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/12/25.
//

import SwiftUI

 struct WebView: View {

  @EnvironmentObject var coordinator: IntroduceCoordinator
  var url: String

  init(url: String) {
    self.url = url
  }

   var body: some View {
    ZStack {
      Color.white
        .edgesIgnoringSafeArea(.all)

      VStack {
        Spacer()
          .frame(height: 14)

        NavigationBackButton{
          coordinator.goBack()
        }

        Spacer()
          .frame(height: 16)

       WebRepresentableView(urlToLoad: url)
      }
      .navigationBarBackButtonHidden(true)
    }
  }
}


