//
//  IntroductionViewModel.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import Foundation
import SwiftUI

@MainActor
class IntroductionViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published private(set) var introductions: [IntroductionRowModel] = []
    @Published private(set) var isLoading = false
    
    // MARK: - Public Methods
    
    /// onAppear 시 호출되는 데이터 페치 메서드
    func onAppear() {
        Task {
            await fetchIntroductions()
        }
    }
    
    /// 데이터를 새로고침하는 메서드
    func refresh() {
        Task {
            await fetchIntroductions()
        }
    }
    
    // MARK: - Private Methods
    
    /// 팀원 소개 데이터를 가져오는 메서드
    private func fetchIntroductions() async {
        isLoading = true
        
        do {
            // 실제 API 호출 시뮬레이션 (2초 딜레이)
            try await Task.sleep(nanoseconds: 2_000_000_000)
            
            // Mock 데이터 로드
            introductions = IntroductionRowModel.mockData
            
        } catch {
            introductions = []
        }
        
        isLoading = false
    }
}
