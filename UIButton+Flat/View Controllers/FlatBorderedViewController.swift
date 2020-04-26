//
//  FlatBorderedViewController.swift
//  UIButton+Flat
//
//  Created by Jason Cox on 4/26/20.
//  Copyright © 2020 Jason Cox. All rights reserved.
//

import UIKit

class FlatBorderedViewController: UIViewController {

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
        buttonNormal.flatBackground = true;
        buttonNormal.border = true;
        buttonNormal.borderColor = .red;
        buttonNormal.borderWidth = 1;
        buttonNormal.corner = true;
        buttonNormal.cornerRadius = 8;
        buttonNormal.tintColor = .link;
                
        // Configure the disabled button
        buttonDisabled.flatBackground = true;
        buttonDisabled.border = true;
        buttonDisabled.borderColor = .red;
        buttonDisabled.borderWidth = 1;
        buttonDisabled.corner = true;
        buttonDisabled.cornerRadius = 8;
        buttonDisabled.tintColor = .link;
        
        // Configure the highlighted button
        buttonHighlighted.flatBackground = true;
        buttonHighlighted.border = true;
        buttonHighlighted.borderColor = .red;
        buttonHighlighted.borderWidth = 1;
        buttonHighlighted.corner = true;
        buttonHighlighted.cornerRadius = 8;
        buttonHighlighted.tintColor = .link;
    }
}
