//
//  ViewModel.swift
//  SwiftUIArchitecture
//
//  Created by Onur Cantay on 31/01/2020.
//  Copyright © 2020 Onur Cantay. All rights reserved.
//

import Foundation
import Combine

@dynamicMemberLookup
protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
  associatedtype State
  associatedtype Input
  
  var state: State { get }
  func trigger(_ input: Input)
  
  init(state: State)
}


extension ViewModel {
  subscript<Value>(dynamicMember keyPath: KeyPath<State, Value>) -> Value {
     state[keyPath: keyPath]
   }
}
