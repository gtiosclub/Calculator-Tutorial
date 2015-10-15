##Part 2: Getting the hang of Interface Builder

**Interface Builder** is Xcode's GUI editor. For most projects, the interface is contained in the `Main.storyboard` file. Open it up and have a look around.

<p align="center"> <img src="screenshot1.png" height="500px" align="center"> </p>

You should see something that looks like this. There are three important parts worth knowing:

1. **Editor Canvas:** This is where you design your layouts. What you see here is what you will get when you run the app on your phone, to an extent.
3. **The Inspector:** This pane is where you modify anything and everything. It shows options for whatever you have selected.
4. **UI Palette:** Nestled at the bottom of the incpector, the UI Palette is where you find the comonents that you use to build your interfaces. 

That big white square in the middle is your first View Controller. Any changes you make to this view will appear on your screen when you run the app. One problem though -- that view is definitely not the shape of an iPhone screen. That's definitely not ideal (Thanks Xcode). *We can fix that, though.*

Click on the bar at the top of the View Controller (the piece with the three icons). The Inspector should light up with tons of new options. 

<p align="center"> <img src="screenshot2.png" height="200px" align="center"> </p>

We're interested in the **Attributes tab** (the one selected in the image). This is what you'll use to do most of your changes in Interface Builder. Click the drop-down menu next to `Size` and select `iPhone 4-inch`. The view controller on the canvas should change from a square to the perfect rectangle we want. 

Great!

Now, remember we're making a calulator. When it comes down to it, there are two parts to the interface we're building.

1. Buttons. Lots of buttons. (Numbers and operators)
2. One big output display.

Interface Builder has our backs. Among the many tools at our disposal, we have the humble `UIButton` and `UILabel`. UIButtons are the standard button object in iOS, and UILabels are nothing more than simple text displays. Seems perfect for us. Scroll through the UI Palette until you find them (they're pretty close to the top).

<p align="center"> <img src="screenshot3.png" height="250px" align="center"> </p>

You can drag components from the UI Palette into your View Controller. Go ahead and drag a `Label` over and drop it on somewhere on the view. The process should look something like this:

<p align="center"> <img src="screenshot4.png" height="350px" align="center"> </p>

###And he said, "Let there be Label"
You can customize the label to your heart's content, too. Remember the Attribute Inspector from earleir? Open that up and you should see a treasure-trove of customization options. Some are very clear (Text, Color, Font) and others are a bit more... esoteric (What the hell is a View Semantic?).

Play around some. Try to customize the text and make the font size larger. Both of these options are in the first five rows, so they should be pretty easy to manage. You might have to make the label larger, but you can do that just as easily by dragging the bottom-right corner of the label in the canvas.

###Reality Check in the Simulator

Now's a good time to make sure we're on the right track. Lets run our app in the simulator and see what happens. We *should* see **exactly** what we see on the canvas (some sort of customized UILabel floating inside our View Controller).

At the top of the Xcode window, your have your `Project Targets`. This is where you run your app, either on a physical device or the iOS Simulator. 

<p align="center"> <img src="screenshot5.png" height="37px" align="center"> </p>

On the very right, you have the target device. Whatever it is now, change it to **iPhone 5**. This matches the `iPhone 4-inch ` option we set on the View Controller option. (The iPhone 5 has a 4-inch display). Press Play and the Simulator should pop open. It tends to take its sweet time to actually start showing your app, so give it a moment.

<p align="center"> <img src="screenshot6.png" height="500px" align="center"> </p>

If everything went according to plan, you should see your label. If you don't see it, try again. Delete the old label by clicking it and then pressing `backspace` on the keyboard. Then go through the same steps as before. If it helps you out, these are the attributes I used:

<p align="center"> <img src="screenshot7.png" height="150" align="center"> </p>

###Recap
Interface Builder is very visual. What you see if what you get, *to an extent*. You can add and modify components to the canvas and see them in the Simulator.

###Next Time
We will learn how to use Interface Builder to make layouts with multiple buttons and how to customize the look of components on screen.

####[Part 3: Designing your layout with Interface Builder](P2/part2.md)