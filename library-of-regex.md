# Library of Regex

Looks within a JSON array of data to find certain lines, for search and replace:

* `"scripture":".+",(\r\n?|\n)\s\s\s\s`
* `"line":.+,(\r\n?|\n)\s\s\s\s`
* `,(\r\n?|\n)\s\s\s\s"attributes":"(.?|.+)"(\r\n?|\n) -> \r\n`

Cheatsheet:

* `\s` - Find one space charatcer
* `(\r\n?|\n)` - Find a line ending character
* `.+` - Find any character with at least one occurence
* `(.?|.+)` - Find any character with zero or one occurences OR any character with at least one occurence. This could possibly be merged into just one `.*` character, but this has yet to be tested.
