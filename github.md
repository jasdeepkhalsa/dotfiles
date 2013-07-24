# How to keep master and gh-pages up-to-date #

## Ideal Workflow ##
1. Commit changes to the master
2. Copy changes from the master to the gh-pages branch (and then return to the master branch to make sure future commits are done on the right branch)
3. Wait 5-10 minutes for the changes to be reflected at http://`{username}`.github.io/`{repository}`/

## 1. Commit changes to the master ##
Make sure we are on the master branch:
		$ git checkout master

Add in all the files:
		$ git add .

Check what is being committed:
		$ git status

Add in a descriptive message for commit:
		$ git commit -m 'Some descriptive commit message'

Push the commit to GitHub:
		$ git push origin master

## 2. Copy changes from the master to the gh-pages branch ##
If we have followed the ideal workflow then master will be ahead of gh-pages

Otherwise if we ourselves into a pickle, then gh-pages may end up being ahead of master

Here is what to do in either situation:

### master is ahead of gh-pages ###
_Do this if GitHub says something like gh-pages is "0 commits ahead and 1 commit behind master"_

Go to the gh-pages branch:
		$ git checkout gh-pages

Bring gh-pages up to date with master:
		$ git rebase master

Commit the changes:
		$ git push origin gh-pages

Return to the master branch:
		$ git checkout master
		
### gh-pages is ahead of master ###
_Do this if GitHub says something like gh-pages is "1 commit ahead and 0 commits behind master"__

Go to the master branch:
		$ git checkout master

Bring master up to date with gh-pages:
		$ git rebase gh-pages

Commit the changes:
		$ git push origin master

## 3. Wait 5-10 minutes ##
Wait 5 to 10 minutes for the changes to appear in your page at http://`{username}`.github.io/`{repository}`/.

After re-basing, GitHub still may say that the two branches master and gh-pages are still not the same.

You can use the compare tool on GitHub to see if this is really the case:
* https://github.com/`{username}`/`{repository}`/compare/master...gh-pages

If there are identical GitHub should say:
		There isn't anything to compare.
		master and gh-pages are identical.

So relax and kick back, knowing that both your branches are up-to-date ;)