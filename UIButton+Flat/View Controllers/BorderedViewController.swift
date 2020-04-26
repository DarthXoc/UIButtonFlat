//
//  BorderedViewController.swift
//  UIButton+Flat
//
//  Created by Jason Cox on 4/26/20.
//  Copyright © 2020 Jason Cox. All rights reserved.
//

import UIKit

class BorderedViewController: UIViewController {

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
        buttonNormal.border = true;
        buttonNormal.borderColor = .link;
        buttonNormal.borderWidth = 1;
        buttonNormal.corner = true;
        buttonNormal.cornerRadius = 8;
                
        // Configure the disabled button
        buttonDisabled.border = true;
        buttonDisabled.borderColor = .link;
        buttonDisabled.borderWidth = 1;
        buttonDisabled.corner = true;
        buttonDisabled.cornerRadius = 8;
        
        // Configure the highlighted button
        buttonHighlighted.border = true;
        buttonHighlighted.borderColor = .link;
        buttonHighlighted.borderWidth = 1;
        buttonHighlighted.corner = true;
        buttonHighlighted.cornerRadius = 8;
    }
}
