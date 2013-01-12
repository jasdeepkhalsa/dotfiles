## Jasdeep Khalsa's dotfiles ##
A list of my most commonly used Ubuntu/Windows commands and files.

The main OS I work with is Ubuntu and ∴ the majority of the commands are Linux/Debian specific.

My main editor is `Titanium Studio` (http://www.appcelerator.com/platform/titanium-studio/) by Appcelerator which I have found to be superior to both `Sublime Text 2` and JetBrains' `WebStorm` due to it being cross-platform (Windows, Linux and Mac), having fantastic built-in support for `SSH` remote editing of files (which I use on a daily basis), `Node.js`, `Git`, `Shell` (yes, even on Windows!) and being free open source software.

My secondary editor (for editing text and shell files) is `geany` (http://www.geany.org/).

For customizing the Terminal in Ubuntu I use `bash-it` (https://github.com/revans/bash-it).

### Contents ###
* `commands.md` - lists my most commonly used Ubuntu/Windows commands
* `.bashrc` - `bash-it` gives a default `.bash_profile` file but this is actually named `.bashrc` in Ubuntu
* `solarized.theme.bash` - my work-in-progress shell theme based off the default theme `bobby`. Create a new folder `solarized` under `~/.bash_it/themes/` and add this file to it.
* `solarized-github.css` - code highlighting for GitHub using [Stylish](http://userstyles.org/styles/46850/github-solarized-dark)
* `titanium.desktop` - my shortcut for `Titanium Studio`. Please add under `/usr/share/applications/` (after changing the paths to yours!)
* `mimeapps.list` - tells Ubuntu which applications to associate with which file types. In this case I've associated .php, .css, .js, .txt to `Titanium Studio`. Add under `~/.local/share/applications/` making sure to backup your existing `mimeapps.list` file

### To Do ###
* Convert `commands.md` into `bash-it` compatible aliases

### Author & Version ###
v0.0.1 by Jasdeep Khalsa

### Contact ###
* Email: jasdeep {at} simplyspiritdesign {dot} com
* Twitter: [@JasdeepKhalsa1](http://twitter.com/@JasdeepKhalsa1)