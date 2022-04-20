//
//  ViewController.swift
//  Shared ViewModel
//
//  Created by dave on 20/04/22.
//

import UIKit
import Combine
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!

    private var cancellables: Set<AnyCancellable> = []
    
    internal var viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setBindings()
        self.loadSwiftUIView()
    }
    
    private func setBindings() {
        self.viewModel.$title.sink { [weak self] title in
            self?.updateTitle(title)
        }
        .store(in: &self.cancellables)
    }

    // Internal as we may unit test this!
    internal func updateTitle(_ title: String) {
        self.titleLabel.text = title
    }
    
    private func loadSwiftUIView() {
        let hostingController = UIHostingController(rootView: SwiftUIView(viewModel: self.viewModel))
        
        self.stackView.addArrangedSubview(hostingController.view)
    }
    
    // MARK: - Actions
    @IBAction func descriptionPressed(_ sender: Any) {
        self.viewModel.loadDescription()
    }
}

