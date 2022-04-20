//
//  ViewModel.swift
//  Shared ViewModel
//
//  Created by dave on 20/04/22.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    
    public func loadTitle() {
        self.title = "Title"
    }
    
    public func loadDescription() {
        self.description = "Some description"
    }
    
}
