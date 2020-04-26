# UIButton+Flat

## Summary
This extension provides the ability to easily create a UIButton with a flat style, a border or both.

To learn more about this project, please visit it on 
[GitHub](https://github.com/DarthXoc/UIButton-Flat).

## Installation
Simply copy _UIButton+Flat.swift_ to your project... that's it! All of the other files included in this project are just for demo purposes.

## Usage 
You can choose to create a _UIButton+Flat_ control in the same way that you would create a stock _UIButton_ control, either via Storyboards, programmatically or through a mixture of the two.

### Via Storyboards
1) Select the UIButton that you wish to use
2) Switch to the Identity Inspector
3) Update the UIButton's class to 'UIButton_Flat'
4) Switch to the Attributes Inspector
5) Switch _Type_ to 'Custom'
6) You can find the configuration options under the _Button Flat_ heading

### Via Code
Create a _UIButton_Flat_ control in the same way that you would create a _UIButton_ control, except that instead of using _UIButton_, use the _UIButton_Flat_ type. Because _UIButton_Flat_ in an extension of _UIButton_, all of _UIButton_'s functions will be inherited. Please note that if you are creating a _UIButton_Flat_ from scratch and not connecting to a button that you've either fully or partially configured in a Storyboard, you will need to declare it's type as `.custom` like so:

```
let button: UIButton_Flat = UIButton_Flat(type: .custom)
```

## Reference
| Attribute | Type | Default | Description |
| --- | --- | --- | --- |
| flatBackground | Bool | false | Determines if a flat background will be drawn |
| border | Bool | false | Determines if a border will be drawn |
| borderColor | UIColor | .clear | The color of the border |
| borderWidth | CGFloat | 1 | The width of the border |
| corner | Bool | false | Determines if a rounded corner will be applied |
| cornerRadius | CGFloat | 0 | The radius of the corner |
| tintColor | UIColor | self.view.tintColor | The color used when drawing a flat background |
| titleLabel.textColor | UIColor | .white | The color used by the title label; ignored if flatBackground is set to false |


## Known Issues
* None
