//
//  AnimeListViewModel.swift
//  SwiftUIArchitecture
//
//  Created by Onur Cantay on 31/01/2020.
//  Copyright © 2020 Onur Cantay. All rights reserved.
//

import Foundation
import Combine


final class AnimeListViewModel: ViewModel {
  private var cancelable: AnyCancellable?
  typealias State = AnimeListState
  typealias Input = AnimeListInput
  
  @Published
  private(set) var state: AnimeListState
  
  required init(state: AnimeListState) {
    self.state = state
  }
  
  func trigger(_ input: AnimeListInput) {
    switch input {
    case .fetchTopAnimes:
      fetchAllAnimes()
    }
  }
}

private extension AnimeListViewModel {
  
  func fetchAllAnimes() {
    cancelable = SharedManager.hover.request(with: TopAnimeTarget.fetchTopAnimes, scheduler: DispatchQueue.main, class: TopAnimeModel.self).sink(receiveCompletion: { result in
      switch result {
      case .finished:
        print("finished")
      case .failure(let error):
        print(error.errorDescription)
      }
    }, receiveValue: { model in
      self.state.topAnimes = model
    })
  }
}

