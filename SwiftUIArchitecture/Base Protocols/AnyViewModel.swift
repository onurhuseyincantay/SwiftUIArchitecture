//
//  AnyViewModel.swift
//  SwiftUIArchitecture
//
//  Created by Onur Cantay on 31/01/2020.
//  Copyright © 2020 Onur Cantay. All rights reserved.
//

import Foundation
import Combine

@dynamicMemberLookup
final class AnyViewModel<State, Input>: ObservableObject {
  private let wrappedObjectWillChange: () -> AnyPublisher<Void, Never>
  private let wrappedState: () -> State
  private let wrappedTrigger: (Input) -> Void
  
  init<V: ViewModel>(_ viewModel: V) where V.State == State, V.Input == Input {
    self.wrappedObjectWillChange = { viewModel.objectWillChange.eraseToAnyPublisher() }
    self.wrappedState = { viewModel.state }
    self.wrappedTrigger = viewModel.trigger
  }
  
  subscript<Value>(dynamicMember keyPath: KeyPath<State, Value>) -> Value {
    state[keyPath: keyPath]
  }
  
  var objectWillChange: some Publisher {
    wrappedObjectWillChange()
  }
  
  var state: State {
    wrappedState()
  }
  
  func trigger(_ input: Input) {
    wrappedTrigger(input)
  }
}

// MARK: - Identifiable
extension AnyViewModel: Identifiable where State: Identifiable {
  var id: State.ID {
    state.id
  }
}
