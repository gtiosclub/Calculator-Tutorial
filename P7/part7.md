## Part 7: Implementing your Buttons

Each button has a function, but those functions are all empty right now. The CalculationDelegate is capable of performing the logic, but it still needs to get called by these functions.

### numberButtonPressed

The CalculationDelegate has the function `handleInput(number: Int)`. The function accepts an Integer *(1, 2, 3, etc.)* as an argument. The question is, how to we know what `Int` to pass in to the function? The naïve approach would be to use a separate function for each button on screen, like this for the 9 button:

```swift
@IBAction func nineButtonPressed(sender: UIButton) {
    calculation.handleInput(9)
}
```

Each `UIButton` on screen is wired to connect to this same function, so it wouldn't make any sense for them to all pass the same constant to `handleInput`. How can we find out what button was actually pressed?

##### (sender: UIButton)

The key part here is that every IBAction also has a `sender` argument. When a button is pressed, the linked function is called with the pressed button as the sender. This gives us access to a `UIButton` representation of our button on screen. That means we can get attributes like the button's title label (the visible text).

```swift
@IBAction func numberButtonPressed(sender: UIButton) {
    let buttonTitle = sender.titleLabel!.text!
    let buttonNumber = Int(buttonTitle)! //converts String to Int
    calculations.handleInput(buttonNumber)

    //also update the text on screen
    resultLabel.text = calculations.resultNumber.roundedString
}
```

### Operators

Next up is the operators. Even though we have four @IBAction functions, we're going to be using a fifth method so we don't have to do *basically* the same thing in each of the four operator functions. It's always better form to break something into a separate function if you're doing it more than once.

```swift
func setOperator(character: String, withFunction function: (Double, Double) -> Double) {
    ...
}
```

#### (Double, Double) -> Double

This is definitely the most confusing part of dealing with these operators. Just like any other argument, `(Double, Double) -> Double` is a type. This time, though, it represents a *function*. In Swift, functions are types just like everything else. It reads as **a function that takes two doubles and returns a double**. More on this in a sec, because it's gonna get real cool. Just let that process some. Here's the actual method body (just throw it somewhere at the bottom of the ViewController.swift):

```swift
func setOperator(character: String, withFunction function: (Double, Double) -> (Double)) {
    //DefaultOperator is part of the default CalculationDelegate
    let customOperator = DefaultOperator(forCharacter: character, withFunction: function)
    calculations.setOperator(customOperator)

    //again, update the text on screen
    resultLabel.text = calculations.resultNumber.roundedString
}
```

Now we can go back to looking at the @IBActions themselves. Because of how we implemented the `setOperator` function, this is gonna be really slick:

```swift
@IBAction func addButtonPressed(sender: UIButton) {
    setOperator("+", withFunction: +)
}
```

#### Whaaaaat??????

That's right. We just used the language's addition operator as an argument in a function. And it makes perfect sense if you think about it. ⌘-Clicking on something in Xcode takes you to where that something is defined in code, so ⌘-Click on the plus sign to see its declaration in the Swift standard library:

```swift
@warn_unused_result
public func +(lhs: Double, rhs: Double) -> Double
```

The operator is *really* just **a function that takes two doubles and returns a double**. Which is exactly the argument type that the `setOperator` function is looking for. Is that crazy or what?? (It's not crazy, Swift is just insanely self-consistant.)

We can do the same thing for the rest of the operators, giving us this beautiful little group:

```swift
@IBAction func addButtonPressed(sender: UIButton) {
    setOperator("+", withFunction: +)
}

@IBAction func subtractButtonPressed(sender: UIButton) {
    setOperator("-", withFunction: -)
}

@IBAction func multiplyButtonPressed(sender: UIButton) {
    setOperator("*", withFunction: *)
}

@IBAction func divideButtonPressed(sender: UIButton) {
    setOperator("/", withFunction: /)
}
```

### Equals and Clear

These two are pretty trivial, mostly because the logic is bundled up in the CalculationDelegate.

```swift
@IBAction func equalsButtonPressed(sender: AnyObject) {
    calculations.clearInputAndSave(true)
    resultLabel.text = calculations.resultNumber.roundedString
}

@IBAction func clearButtonPressed(sender: UIButton) {
    calculations.clearInputAndSave(false)
    resultLabel.text = calculations.resultNumber.roundedString
}
```

For both of them, we simply pass work on to the CalculationDelegate and then update the text on screen. Simple enough.

### Recap
We connected the logic contained in the CalculationDelegate to the interface by writing code for our IBOutlets.

### Next Time
We will test the calculator and make sure everything is in working order.

#### [Part 8: Testing and Debugging your Calculator](P8/part8.md)
