//
//  RainbowViewController.swift
//  homework №17
//
//  Created by Shirayo on 12.03.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

class RainbowViewController: UIViewController {

    @IBOutlet weak var addViewButton: UIButton!
    let colors: [UIColor] = [.red, .black, .blue, .green, .yellow, .cyan]
    var views: [UIView] = []
    
    var randomColor: UIColor {
        get {
            let index = Int.random(in: 0..<colors.count)
            return colors[index]
        }
    }
    
    var viewWithRandomColor: UIView {
        get {
            let view = UIView()
            view.backgroundColor = randomColor
            return view
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewButton.layer.cornerRadius = 40
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addViewDidClick(_ sender: Any) {
        let view = viewWithRandomColor
        
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        if views.isEmpty {
            view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20) 
        } else {
            if let preView = views.last {
                view.topAnchor.constraint(equalTo: preView.bottomAnchor, constant: 20).isActive = true
            }
        }
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        views.append(view)
    }
    
}
