# DatingApp  

DatingApp is a simple app that allows users to see matches and select persons they like by clicking on profile images.  


### User Stories
- [X] User can tap a cell to like a person. The tapped cell will then disappear  (2 hours)
- [X] Delete cell is animated  (1 hour)

### App Walkthrough GIF
## Iphone 8
![Demo](./Gif/demo.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).  
### Notes
1. Delete cell  
_ I first attempted to create a TapGestureRecognizer in Storyboard and used it for a custom cell. However, when the collection view are created, only the first cell has the tapGesture.  
_ I then create the TapGestureRecognizer with code in ViewController and add it to every cell  

2. Animation when delete cell  
_ I found a tutorial using pod 'Differ' to perform animation for cell deletion, insertion, update. (Ref-1)

## References  
1. Animating Changes: https://swiftwithmajid.com/2019/03/13/animating-changes-in-uitableview-and-uicollectionview/
