## Part 1: Setting up your Github

This tutorial will teach you how to build a Calculator application with Storyboard. This tutorial was developed by [Cal Stephens](https://github.com/calda)

Github is a platform to easily save your code onto a cloud where you can track the changes you've made over time. It also allows others to see and contribute to your open source code. If you haven't done so yet:

1. Sign up for an account at [Github](https://www.github.com)
2. Set up your github [SSH Keys](https://help.github.com/articles/generating-ssh-keys/)

Then, you need to fork our Calculator-Template repository. Go to https://github.com/iosgatech/Calculator-Template, press the fork button on the top right, and select your own account to fork to.

</br>
<img src="screenshot1.png" style="height: 170px">
</br>
<img src="screenshot2.png" style="height: 250px">
</br>

Congratz! You now have forked a repository! You now have copied over the repository over to your account, which now you can freely manipulate without modifying the original repository!

But now you need to clone the repository that you just forked to your computer in order to edit it. After you have your repository forked, open up your terminal using <kbd>command</kbd> + <kbd>space</kbd> and then  typing in "terminal". Press enter and a terminal window should show up.

Navigate to the folder where you want to save your XCode projects. For example, if you would like to save your Calculator directly to the desktop, first `cd` to `~/Desktop` by typing this into the terminal and pressing enter

```
cd ~/Desktop
```

Proceed to clone the repository in that directory by typing in this line and replacing `**your-username**` with your github username:

```
git clone git@github.com:**your-username**/Calculator-Template.git
```

A folder called `Calculator-Template` should show up

#### [Part 2: Getting the hang of Interface Builder](P2/part2.md)
