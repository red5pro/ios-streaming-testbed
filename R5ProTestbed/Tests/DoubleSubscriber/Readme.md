#Two Way Video Chat

This example demonstrates Subscribing to two different sources at once.

###Example Code
- ***[DoubleSubscriber.swift](DoubleSubscriber.swift)***

- ***[BaseTest.swift](../BaseTest.swift)***

###Setup
This is intended to be used with two others using the two-way example to put on a presentation, allowing anyone using this client to watch them converse.

###Managing Views

The only special part of subscribing to two streams at once is handling the size of the views so that you can see both at once. This is done by assigning a CGRect to the `R5VideoController`'s `view.frame`

```Swift
let screenSize = UIScreen.mainScreen().bounds.size
let s1Frame = CGRectMake( 0, 0, screenSize.width, screenSize.height * (1/2) )
currentView?.view.frame = s1Frame
```
<sup>
[DoubleSubscriber.swift #37](DoubleSubscriber.swift#L37)
</sup>