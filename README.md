# NotchToolkit
NotchToolkit is a light-weight framework for iOS that allow developers use the iPhone's X notch space in creative ways.
Inspired by <blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">I was working on this idea of blending app design with the <a href="https://twitter.com/hashtag/iPhoneX?src=hash">#iPhoneX</a> notch. 📲🤗 <a href="https://t.co/lj2AhxWNeE">pic.twitter.com/lj2AhxWNeE</a></p>&mdash; Luboš Volkov⚡️ (@0therPlanet) <a href="https://twitter.com/0therPlanet/status/909788913702785026">September 18, 2017</a></blockquote>

## Preview
![Demo](preview.gif)

## Compatibility
Although `NotchToolkit` is made for iPhone X, it can be implemented in older iPhone devices. This framework was tested on:

1. iPhone X
2. iPhone 8 plus, 7 plus, 6s plus and 6 plus
3. iPhone 8, 7, 6s and 6
4. iPhone SE and 5s

`NotchToolkit` requires

- iOS 11
- Swift 3.2 or higher

`NotchToolkit` has options to customize your Toolbar and UIView,
check [**NotchToolbar Options**](#notchtoolbar-options) and [**More Options**](#more-options) for more details.

## Example Project
To try the example project, simply download this repo then open `NotchToolkit-Example.xcworkspace` project file.

## Installation
### CocoaPods
1. Download [CocoaPods](http://cocoapods.org) using this command in `Terminal`
```
$ sudo gem install cocoapods
```
2. Redirect to your project folder in `Terminal`
```
$ cd YOUR_PROJECT_FILE_PATH
```
3. Initialize a pod in `Terminal`
```
$ pod init
```
4. Open Podfile in a text editor and add this line
```
pod 'NotchToolkit'
```
5. Go back to `Terminal` and install the pod
```
$ pod install
```
### Manual
Add the `NotchToolkit` project to your project and add `NotchToolkit` as an embedded binary of your targets.

## Implement in your project
1. `import NotchToolkit` in a UIViewController class
2. Add `NotchToolbarDelegate` in the delegate section
```
class ViewController: UIViewController, NotchToolbarDelegate
```
3. Add delegate functions
```
func deviceDidRotate() {
}
func didTapToolIcon(_ tools: UICollectionView, toolIndex: IndexPath, section: Int, row: Int) {
}
```
4. Declare a NotchToolbar variable
```
let toolbar = NotchToolbar()
```
5. Set options and initialize in `viewDidLoad`
```
toolbar.notch.isVisible = true

toolbar.notch.height = 250

toolbar.toolList = [[UIImage(named:"pikachusquare")!, "Pikachu"], [UIImage(named:"spongebob")!, "Spongebob"], "🤔", "🤓", "📱", "👩‍💻", "👨‍💻", "✅", "🔥"]

toolbar.delegate = self
toolbar.initializeToolbar(self)
```
6. Call .autoResize() function in the `deviceDidRotate` delegate function
```
func deviceDidRotate() {
toolbar.autoResize()
}
```
You're all set!

## NotchToolbar Options
#### toolbar.scrollMode
This gives you options to change the NotchToolbar scrolling directions. Default is auto.
```
.alwaysHorizontal
.alwaysVertical
.auto
```
#### toolbar.onlyFor10
This allows you to enable NotchToolbar only for iPhone X. Default is false.
```
true
false
```
#### toolbar.toolIconSize
This allows you to set the tool icon size. Default is 60x60
```
CGSize(width:w, height:h)
```
#### toolbar.toolIconsInsets
This allows you to customize the tool icons edge insets.
```
UIEdgeInsetsMake(top,left,bottom,right)
```
#### toolbar.toolList
This is the array of the tool icons in the NotchToolbar. toolList accepts `String` , `UIImage` or an array of both types. An array that contains a  `String` and a `UIImage` allow you to add an image icon with title.
```
[String, [UIImage, String], [UIImage, String], UIImage, UIImage, String, String]
```
#### toolbar.toolsTitleFont
This allows you to customize the `String` type icon font.
```
UIFont(name:FontName, size:FontSize)
```
#### toolbar.toolsTitleColor
This allows you to customize the `String` type icon text color.
```
UIColor.COLOR_NAME_OR_RGB
```
#### toolbar.iconWithNameFont
This allows you to customize the tools title font.
```
UIFont(name:FontName, size:FontSize)
```
#### toolbar.iconWithNameColor
This allows you to customize the tools  title color.
```
UIColor.COLOR_NAME_OR_RGB
```
#### toolbar.notch
This provides you options to customize `NotchBar`.
##### toolbar.notch.mode
This allows you to choose between `statusBar` and `noStatusBar` modes.
```
.statusBar - sets the bar width to the iPhone's X notch width.
.noStatusBar - sets the bar width 30% more than iPhone's X notch width. Recommended for fully landscape apps or when status bar is hidden.
```
##### toolbar.notch.height
This allows you to set the height of the `NotchBar`.
```
CGFloat(A_NUMBER)
```
##### toolbar.notch.bgColor
This allows you to set the background color of the `NotchBar`.
```
UIColor.COLOR_NAME_OR_RGB
```
##### toolbar.notch.curve
This allows you to set the corner radii of the `NotchBar`.
```
CGFloat(A_NUMBER)
```
##### toolbar.notch.isVisible
This allows you to initially set the `NotchBar` visibility. Default is false
```
true
false
```
##### toolbar.notch.animationInterval
This allows you to set the animation time interval of the `NotchBar`. Default is 0.3.
```
TimeInterval(INTERVAL)
```
## NotchToolbar Functions
#### initializeToolbar(_ vc:UIViewController)
This function is required to initialize the NotchToolbar. It is recommended to call this function in `viewDidLoad` after setting the [NotchToolbar Options](#notchtoolbar-options).
```
/*
NotchToolbar Options here
*/
toolbar.initializeToolbar(self)
```
#### showOrHide()
This function allows you to show and hide the `NotchToolbar`. You can call this function in the method that handles showing/hiding the toolbar.
```
@IBAction func buttonClicked(_ sender: UIButton) {
toolbar.showOrHide()
}
```

## NotchToolbar Delegate Functions
#### deviceDidRotate()
This delegate function detects when the device orientation changes. Calling **toolbar.autoResize()** function inside this delegate is **required** in order to have the `NotchToolbar` working properly.
```
func deviceDidRotate() {
toolbar.autoResize()
}
```
#### didTapToolIcon(_ tools: UICollectionView, toolIndex:IndexPath, section: Int, row: Int)
This delegate function allows you to detect which toolbar icon was selected.
```
func didTapToolIcon(_ tools: UICollectionView, toolIndex: IndexPath, section: Int, row: Int) {
let alert = UIAlertController(title: "NotchToolkit Alert", message: iconListTest[row], preferredStyle: UIAlertControllerStyle.alert)
alert.addAction(UIAlertAction(title: "k", style: UIAlertActionStyle.cancel, handler: {(UIAlertAction)in
}))
self.present(alert, animated: true, completion: nil)
}
```
## More Options
This framework include a `UIView` extension that allows you draw a notch bezier path to any `UIView` class or subclass.
### addOvalOrCorner(type:curveType, position:curvePosition, curve:CGFloat?, customBounds:CGRect? = nil)
This is a UIView extension that allows you add ovals and rounded corners to any UIView.

- For type `oval`, set `curve` from 1.0 - 10.0.
- For type `corner`, `curve` is the radius size.
- Check `curveType` & `curvePosition` for more info.
### Example
```
myView.addOvalOrCorner(type: .oval, position: .horizontalSides, curve: 1.5)
```
### Preview
![Demo](c&o.gif)

## LICENSE
`NotchToolkit` is under MIT license. Check the [LICENSE](LICENSE) file for more details.

