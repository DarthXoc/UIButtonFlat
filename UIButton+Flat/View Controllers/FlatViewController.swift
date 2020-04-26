//
//  FlatViewController.swift
//  UIButton+Flat
//
//  Created by Jason Cox on 4/26/20.
//  Copyright © 2020 Jason Cox. All rights reserved.
//

import UIKit

class FlatViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet internal var buttonNormal: UIButton_Flat!;
    @IBOutlet internal var buttonDisabled: UIButton_Flat!;
    @IBOutlet internal var buttonHighlighted: UIButton_Flat!;
    
    // MARK: - General Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // Below is an example of how to create a UIButton_Flat; please note that you need to specify type = .custom!
//        let button: UIButton_Flat = UIButton_Flat(type: .custom);
        
        // Configure the normal button
        buttonNormal.corner = true;
        buttonNormal.cornerRadius = 8;
        buttonNormal.flatBackground = true;
        buttonNormal.tintColor = .link;
                
        // Configure the disabled button
        buttonDisabled.corner = true;
        buttonDisabled.cornerRadius = 8;
        buttonDisabled.flatBackground = true;
        buttonDisabled.tintColor = .link;
        
        // Configure the highlighted button
        buttonHighlighted.corner = true;
        buttonHighlighted.cornerRadius = 8;
        buttonHighlighted.flatBackground = true;
        buttonHighlighted.tintColor = .link;
    }
}
