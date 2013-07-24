# How to keep master and gh-pages up-to-date #

## Ideal Workflow ##
1. Commit changes to the master
2. Copy changes from the master to the gh-pages branch (and then return to the master branch to make sure future commits are done on the right branch)
3. Wait 5-10 minutes for the changes to be reflected at http://`{username}`.github.io/`{repository}`/

## 1. Commit changes to the master ##
_Please first "cd" to your git repository on your computer_

Make sure we are on the master branch:

		$ git checkout master

Add in all new/changed files:

		$ git add .

Check what is being committed:

		$ git status

Add in a descriptive message for commit:

		$ git commit -m 'Some descriptive commit message'

Push the commit to GitHub:

		$ git push origin master

## 2. Copy changes from the master to the gh-pages branch ##
If we have followed the ideal workflow then master will be more up-to-date than gh-pages

Otherwise if we get ourselves into a pickle, then gh-pages may end up being more up-to-date than master

Here is what to do in either situation:

### master is more up-to-date than gh-pages ###
_Do this when GitHub says something like gh-pages is "0 commits ahead and 1 commit behind master"_

Go to the gh-pages branch:

		$ git checkout gh-pages

Bring gh-pages up to date with master:

		$ git rebase master

Commit the changes:

		$ git push origin gh-pages

Return to the master branch (to make sure future commits are done on the right branch!):

		$ git checkout master
		
### gh-pages is more up-to-date than master ###
_Do this when GitHub says something like gh-pages is "1 commit ahead and 0 commits behind master"__

Go to the master branch:

		$ git checkout master

Bring master up to date with gh-pages:

		$ git rebase gh-pages

Commit the changes:

		$ git push origin master

## 3. Wait 5-10 minutes ##
Wait 5 to 10 minutes for the changes to appear in your page at http://`{username}`.github.io/`{repository}`/.

After re-basing, GitHub may still claim that the two branches master and gh-pages are out of sync.

You can use the compare tool on GitHub to see if this is _really_ the case:
* https://github.com/`{username}`/`{repository}`/compare/master...gh-pages

If they are identical GitHub should say:

		There isn't anything to compare.
		master and gh-pages are identical.
		
If not, you may have to go back to Step 2.

Otherwise now you can relax, knowing that both your branches are up-to-date ;)
