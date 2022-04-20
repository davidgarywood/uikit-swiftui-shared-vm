//
//  SwiftUIView.swift
//  Shared ViewModel
//
//  Created by dave on 20/04/22.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text(self.viewModel.description)
            Button {
                self.viewModel.loadTitle()
            } label: {
                Text("Load Title")
            }
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(viewModel: ViewModel())
    }
}
