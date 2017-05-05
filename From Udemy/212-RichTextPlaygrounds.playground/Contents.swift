//: # Xcode Rich Text Playgrounds Reference
var nameOfFile = "RichTextPlaygrounds"
//: How to switch views: In the Xcode menu bar select Editor and then Show Rendered Markup. To switch back do the same thing but select Show Raw Markup.

// This is a regular comment and will be used to explain the code and formatting that follows it throughout this playground. Let's see how to make a rich text comment.

//: This is regular formatted text, note the colon placement.
//: If there is another rich text comment, like this one, without a blank line, it displays as one long rich text area.

// So far, we've looked at all single line comments, but multiple line comments are more powerful, so let's see how we do that, this time with a heading.

/*: (a comment here will not display)
# This is a heading, like Heading 1 in HTML
## This is like Heading 2 in HTML
### This is like heading 3 in HTML
Regular text shows when there is nothing in front of the line, like this one. You end a multiple line rich text comment the same way you would end a normal multiline comment.
*/

// You may have already noticed that we're basically using Markdown to apply the formatting to these areas, and if you guessed that you would be correct!

// Let's see how we add page navigation to the Playground, for those times when one page is not enough. Note this does not add the pages, it just links to them.

//: [Next Page](@next)

//: [Previous Page](@previous)

// That was simple, it's like adding a link to a website, which is done the same way...

//: [Visit xbsjason.com](http://xbsjason.com)

// Let's create a bulleted list now, it's almost as simple as adding a mulitple line comment.

/*: (you won't see this comment)
* Bullet item one
* Item two
* Three
* You get the point
*/

// Likewise a numbered list is just as easy, just use an Integer followed by a period instead of an '*'.

/*: (this is a numbered list)
1. Item 1
2. Item 2
    1. This is subitem 1 for item 2, add four spaces to get it.
3. Item 3
4. Item 4
*/

// To add some blockquote text (that doesn't look much different than regular text, just put a '>' greater than symbol in front of each line in the multiline comment, like this:

/*: (let's see some blockquote text)
> This is a special message, why else would I
> put it in blockquotes?
*/

// Adding code is even simpler, it requires no extra syntax, just start each line with at least four spaces, see:

/*: (code view)
    func someCleverName() -> {
        return "A clever name it is!"
    }
*/

// See. You can also add a horizontal rule to seperate things, but it must have a blank line before and after it, just as four hyphens.

/*:

----

*/

// Look at that! OK, let's add some formatting, like italics and bold text. For italics you just surround the word or group of words with an '*' asterick, you can also use underscores.

//: Look, *these three words* are in italics.

// To make the text bold just double up on the astericks or underscores.

//: See there, **this is bold**.

// You can even add images, the code looks like this:

//: ![This is an image](http://xbsjason.com/wp-content/uploads/2015/01/xbsjasonlogoshield300.png)

// OK, I think you get the idea of how to format a playground, so go ahead and do just that!

//: By [Jason Rybka](http://xbsjason.com)
