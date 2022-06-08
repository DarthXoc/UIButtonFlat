import UIKit

@IBDesignable open class UIButtonFlat: UIButton {
    // MARK: - Interface Builder Properties
        
    // MARK: Background properties
    @IBInspectable public var flatBackground: Bool = false {
        didSet {
            // Render the control
            self.renderControl();
        }
    };
    
    // MARK: Border properties
    @IBInspectable public var border: Bool = false {
        didSet {
            // Render the control
            self.renderControl();
        }
    };
    @IBInspectable public var borderColor: UIColor = .clear {
        didSet {
            // Render the control
            self.renderControl();
        }
    };
    @IBInspectable public var borderWidth: CGFloat = 1 {
        didSet {
            // Render the control
            self.renderControl();
        }
    };
    
    // MARK: Corner Properties
    @IBInspectable public var corner: Bool = false {
        didSet {
            // Render the control
            self.renderControl();
        }
    };
    @IBInspectable public var cornerRadius: CGFloat = CGFloat.zero {
        didSet {
            // Render the control
            self.renderControl();
        }
    };
    
    // MARK: - Overrides
    
    public override var isEnabled: Bool {
        didSet {
            // Update an outlined button's enabled state
            self.updateBorderEnabled();
        }
    }
    
    public override var isHighlighted: Bool {
        didSet {
            // Update an outlined button's highlight state
            self.updateBorderHighlight();
        }
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        // Render the control
        self.renderControl();
    }
    
    // MARK: - Colors
    
    /// Determines the blending color needed for a button given it's state and the current interface appearance
    private func actionColor(color: UIColor, state: UIControl.State = .normal) -> UIColor {
        // Check the button's state
        switch state {
            case .highlighted:
                // Return black in all appearances to mimick iOS defaults
                return .black;
            case .disabled:
                // Return white is light mode, black in dark mode, to mimick iOS defaults
                return self.traitCollection.userInterfaceStyle == .light ? .white : .black
            default:
                return color;
        }
    }
    
    /// Blends multiple UIColors together into a new UIColor
    private func blendColors(colors: [UIColor]) -> UIColor {
        // Calculate the average RGBA values
        let floatRed: CGFloat = colors.reduce(0) { $0 + CIColor(color: $1).red } / CGFloat(colors.count);
        let floatGreen: CGFloat = colors.reduce(0) { $0 + CIColor(color: $1).green } / CGFloat(colors.count);
        let floatBlue: CGFloat = colors.reduce(0) { $0 + CIColor(color: $1).blue } / CGFloat(colors.count);
        let floatAlpha: CGFloat = colors.reduce(0) { $0 + CIColor(color: $1).alpha } / CGFloat(colors.count);
        
        return UIColor(red: floatRed, green: floatGreen, blue: floatBlue, alpha: floatAlpha);
    }
    
    /// Convert a UIColor to a UIImage
    private func imageFromColor(color: UIColor = UIColor.clear, alpha: CGFloat = 1.00) -> UIImage {
        let rect: CGRect = CGRect(x: CGFloat.zero,
                          y: CGFloat.zero,
                          width: 1.0,
                          height: 1.0);
        
        // Begin the image context
        UIGraphicsBeginImageContext(rect.size);
        
        // Get the current context
        let context: CGContext = UIGraphicsGetCurrentContext()!;
        
        // Set the fill color and fill the context
        context.setFillColor(color.withAlphaComponent(color != .clear ? alpha : 0.00).cgColor);
        
        // Fill the context
        context.fill(rect);
        
        // Create the image
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        
        // End the image context
        UIGraphicsEndImageContext();
        
        return image;
    }
    
    // MARK: - Control
    
    /// Renders the control
    private func renderControl() {
        // Check to see if a flat background color was specified
        if (self.flatBackground) {
            // Retrieve the blended colors
            let colorBlendDisabled: UIColor = self.actionColor(color: self.backgroundColor ?? .clear, state: .disabled);
            let colorBlendHighlighted: UIColor = self.actionColor(color: self.backgroundColor ?? .clear, state: .highlighted);
            let colorBlendNormal: UIColor = self.actionColor(color: self.backgroundColor ?? .clear, state: .normal);

            // Set the button's background images
            self.setBackgroundImage(self.imageFromColor(color: self.blendColors(colors: [self.backgroundColor ?? .clear, colorBlendDisabled])), for: .disabled);
            self.setBackgroundImage(self.imageFromColor(color: self.blendColors(colors: [self.backgroundColor ?? .clear, colorBlendHighlighted])), for: .highlighted);
            self.setBackgroundImage(self.imageFromColor(color: self.blendColors(colors: [self.backgroundColor ?? .clear, colorBlendNormal])), for: .normal);
            
            // Tell UIButton not to adjust tint
            // - Not setting this can lead to the button losing it's background if it tries to re-render while off-screen
            self.tintAdjustmentMode = .normal
        }
        
        // Check to see if a border should be applied
        if (self.border) {
            // Apply the border
            self.layer.borderColor = self.borderColor.cgColor;
            self.layer.borderWidth = self.borderWidth;
            
            // Check to see if the button is highlighted
            // - A button cannot be disabled and highlighted at the same time (unless you configure it wrongly in Xcode)
            if (self.isHighlighted) {
                // Update the outlined button's enabled state
                self.updateBorderHighlight();
            } else {
                // Update the outlined button's highlight state
                self.updateBorderEnabled();
            }
        }
        
        // Check to see if a corner radius should be applied
        if (self.corner) {
            // Apply the corner radius
            self.clipsToBounds = true;
            self.layer.cornerRadius = self.cornerRadius;
        }
        
        // Set the image to the same color as the title
        self.imageView?.tintColor = self.currentTitleColor;
        
        // Disable any adjust of the image
        self.adjustsImageWhenDisabled = false;
        self.adjustsImageWhenHighlighted = false;
        
        // Set the button's title colors
        self.setTitleColor(self.titleLabel?.textColor.withAlphaComponent(0.66) ?? .label.withAlphaComponent(0.66), for: .disabled)
        self.setTitleColor(self.blendColors(colors: [self.titleLabel?.textColor ?? .label, .black]), for: .highlighted)
        self.setTitleColor(self.titleLabel?.textColor ?? .label, for: .normal)
        
        // Indicate that the view needs laid out
        self.setNeedsLayout();
    }
    
    // MARK: - General Functions
    
    /// Updates the control's border to show if it is enabled
    private func updateBorderEnabled() {
        // Check to see if a border has been applied
        if (self.border) {
            // Retrieve the blending color
            let colorBlendDisabled: UIColor = self.actionColor(color: self.backgroundColor ?? .clear, state: .disabled);
            
            // Retrieve the disabled colors
            let colorDisabled: UIColor = self.blendColors(colors: [self.borderColor, colorBlendDisabled]);

            // Check to see if the button is enabled
            switch self.isEnabled {
                case false:
                    // Update the border to indicate that the button is highlighted
                    self.layer.borderColor = colorDisabled.cgColor;
                default:
                    // Update the border to indicate that the button is highlighted
                    self.layer.borderColor = self.borderColor.cgColor;
            }
        }
    }
    
    /// Updates the control's border to show if it is highlighted
    private func updateBorderHighlight() {
        // Check to see if a border has been applied
        if (self.border) {
            // Retrieve the blending color
            let colorBlendHighlighted: UIColor = self.actionColor(color: self.backgroundColor ?? .clear, state: .highlighted);
            
            // Retrieve the highlighted color
            let colorHighlight: UIColor = self.blendColors(colors: [self.borderColor, colorBlendHighlighted]);
            
            // Check to see if the button is highlighted
            switch self.isHighlighted {
                case true:
                    // Update the border to indicate that the button is highlighted
                    self.layer.borderColor = colorHighlight.cgColor;
                default:
                    // Update the border to indicate that the button is not highlighted
                    self.layer.borderColor = self.borderColor.cgColor;
            }
        }
    }
}

