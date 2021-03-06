## Jasdeep's dotfiles ##
A list of my most commonly used Ubuntu/Windows commands and files.

The main OS I work with is Ubuntu and ∴ the majority of the commands are Linux/Debian specific.

My **main editor/IDE** is [`VSCode`](https://code.visualstudio.com/) due to it being FREE, fast and having plugins which enhance its functionality into a powerful IDE.

On the command-line, I like to use `vim` due to it being available inside the `shell` on the client and server alike - with awesome syntax highlighting. I have written a basic guide to vim in `commands.md` - check it out!

(In the past I have tried various editors and IDEs, including Atom, Titanium, Sublime Text and PHPStorm/WebStorm by JetBrains but they have been either too expensive, too complex or too bulky for my needs)

For **customizing the Terminal & aliases** I use [`bash-it`](https://github.com/revans/bash-it) with the theme `powerline-plain`. For terminal splitting (vertical and horizontal), I use `Terminator` which is available from the Software Center.

Mac equivalents for these are [`oh-my-zsh`](https://github.com/robbyrussell/oh-my-zsh) with theme `powerlevel10k/powerlevel10k` & [`iTerm2`](https://www.iterm2.com/) for terminal splitting.

For **colour picking** I use `Gpick` on Ubuntu, available from the Software Center or `Digital Color Meter` on Mac (built-in).

For **producing GIFs** I use [`Peek`](https://github.com/phw/peek#ubuntu) on Ubuntu or [`Giphy Capture`](https://giphy.com/apps/giphycapture) / [`Gyazo`](https://gyazo.com/en) on Mac.

For **diff-ing files** I use [`Visual Merge Tool`](https://www.perforce.com/downloads/visual-merge-tool)

For **multiple versions of PHP and Node.js** I use [`phpbrew`](https://github.com/phpbrew/phpbrew) & [`nvm`](https://github.com/creationix/nvm) respectively.

### Contents ###
* `commands.md` - lists my most commonly used Ubuntu/Windows commands. Trust me this list of commands is AWESOME! Check it out right away!
* `.bashrc` - `bash-it` gives a default `.bash_profile` file but this is actually named `.bashrc` in Ubuntu
* `custom.aliases.bash` - my quick aliases put under `~/,bash_it/custom/`
* `solarized.theme.bash` - my work-in-progress shell theme based off the default theme `bobby`. Create a new folder `solarized` under `~/.bash_it/themes/` and add this file to it.
* `github.md` - a quick guide explaining advanced git branch usage
* `mimeapps.list` - tells Ubuntu which applications to associate with which file types. In this case I've associated .php, .css, .js, .txt to `Geany`. Add under `~/.local/share/applications/` making sure to backup your existing `mimeapps.list` file
