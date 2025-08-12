//
//  TeamBlogView.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/12/25.
//

import SwiftUI

struct TeamBlogView: View {
  @EnvironmentObject var coordinator: IntroduceCoordinator
  @Bindable var viewModel: TeamBlogViewModel


  init(viewModel: TeamBlogViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    ZStack {
      Color.white
        .edgesIgnoringSafeArea(.all)

      VStack {
        Spacer()
          .frame(height: 14)

        CustomNavigationBackBar(text: "팀블로그") {
          coordinator.goBack()
        }

        Spacer()
          .frame(height: 20)

        blogHeaderView()

        Spacer()
          .frame(height: 10)

        blogList()


        Spacer()

        blogHintBanner()

        Spacer()
          .frame(height: 30)
      }

    }
    .onAppear {
      viewModel.send(.onAppear)
    }
  }
}

extension TeamBlogView {

  @ViewBuilder
  private func blogHeaderView() -> some View {
    VStack(alignment: .center) {
      Spacer()
        .frame(height: 16)


      Circle()
        .fill(.gray40)
        .frame(width: 56, height: 56)
        .overlay {
          Image(asset: .glabal)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)

        }

      Spacer()
        .frame(height: 10)

      HStack {

        Spacer()

        Text("팀원들의 블로그")
          .pretendardFont(family: .regular, size: 13)
          .foregroundStyle(.staticBlack)

        Spacer()
      }

      Spacer()
        .frame(height: 10)

      Text("각자 공부한 내용및  경험을 공유 하는 공간입니다.")
        .pretendardFont(family: .regular, size: 13)
        .foregroundStyle(.blueGray)

      Spacer()
        .frame(height: 16)

    }
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(.staticWhite)
        .shadow(color: .shadowColor, radius: 2)
    )
    .padding(.horizontal, 16)

  }



  @ViewBuilder
  private func blogList() -> some View {
    if !viewModel.isLoading {
      VStack {
        blogListitem(
          name: "김민희",
          blogTitle: "모바일개발과크로스플랫폼기술을공유합니다",
          blogLink: "https://0minnie0.tistory.com/",
          action: { item in
            viewModel.send(.presentWebView(url: item))
          }
        )

        blogListitem(
          name: "서원지",
          blogTitle: "모바일개발과크로스플랫폼기술을공유합니다",
          blogLink: "https://velog.io/@suhwj/posts",
          action: { item in
            viewModel.send(.presentWebView(url: item))
          }
        )

        blogListitem(
          name: "홍석현",
          blogTitle: "모바일개발과크로스플랫폼기술을공유합니다",
          blogLink: "https://velog.io/@gustjrghd/posts",
          action: { item in
            viewModel.send(.presentWebView(url: item))
          }
        )
      }
    } else {
      ForEach(0..<3, id: \.self) { _ in
        SkeletonRowView()
      }
    }
  }

  @ViewBuilder
  private func blogListitem(
    name: String,
    blogTitle: String,
    blogLink: String,
    action: @escaping (String)  -> Void
  ) -> some View {
    VStack {
      HStack {
        Circle()
          .fill(.gray.opacity(0.3))
          .frame(width: 40, height: 40)
          .overlay {

          }

        VStack(alignment: .leading) {
          HStack {
            Text(name)
              .pretendardFont(family: .regular, size: 12)
              .foregroundStyle(.textSecondary)

            Image(asset: .link)
              .resizable()
              .scaledToFit()
              .frame(width: 15, height: 15)
              .onTapGesture {
                action(blogLink)
              }

            Spacer()
          }

          Text(blogTitle)
            .pretendardFont(family: .regular, size: 12)
            .foregroundStyle(.textGray100)

          Text(blogLink)
            .pretendardFont(family: .light, size: 14)
            .foregroundStyle(.basicBlack)
            .onTapGesture {
              action(blogLink)
            }
        }

        Spacer()

      }
      .padding(16)

    }
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(.staticWhite)
        .shadow(color: .shadowColor, radius: 2)
    )
    .padding(.horizontal, 16)
  }

  @ViewBuilder
  private func blogHintBanner() -> some View {
    VStack {
      HStack {
        Spacer()

        Text("💡 블로그 링크를 탭하면 새 탭에서 열립니다")
          .pretendardFont(family: .light, size: 12)
          .foregroundStyle(.basicBlack)

        Spacer()
      }
      .padding(.vertical, 16)
    }

    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(.staticWhite)
        .shadow(color: .shadowColor, radius: 2)
    )
    .padding(.horizontal, 16)

  }

}

#Preview {
  TeamBlogView(viewModel: .init())
}
