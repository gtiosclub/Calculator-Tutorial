## Part 13: Pushing your changes to Github

Now that you're done, you can push your changes to github!

Open up your terminal and navigate into the `Calculator-Template` folder using `cd`.

First we're going to type:
```
git status
```

This command tell you the changes you made to your local repository compared to the last commit that you've made.

Now we want to add these changes to the "commit". The commit is a snapshot of your code that you **add** your changes to. Type in:

```
git add --all
```

This will add all of the changes that you've made to the commit so that you can save a snapshot of what your code looks like. Altnernatively you can add individual files by saying for example `git add ViewController.swift` to add individual files. The tag --all means that you want to add all of your changes.

Type `git status` again. You should see that all of your files are in green. This means that you changes are ready to be commited as a snapshot. If you wanted to remove all the changes that you added, you would type `git reset`, but don't do that now.

Go ahead and commit your changes.

```
git commit -m "Completed basic Calculator"
```

This saves a snapshot to your local repository. If you so wish to, you can revert commits and go back to a previous commit using `git revert`.

Finally, we want to sync up your local repository with the remote repository hosted on github.

```
git push origin master
```

Technically you can use `git push` and it should work as well. "origin" is the name of the remote repository and "master" is the name of the branch you're committing to. Typically you want your master to have the working copy of your program.

In other words, you want to follow these specific order of commands in order to save your code to github.

```
git status
git add --all
git commit -m "some message that says what progress you've made"
git push origin master
```

Once you've pushed your code, you're done!

Liked this tutorial? Share it with your friends!

Hate a certain explanation? Hate our horrible spelling issues? Hate this entire tutorial? Let us know so that we can make you hate it less! Email us at <a href="mailto:iosgatech@gmail.com?Subject=Calculator Tutorial Feedback" target="_top">iosgatech@gmail.com</a>.