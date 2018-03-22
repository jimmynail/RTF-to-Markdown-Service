# RTF-to-Markdown-Service
An Applescript workflow to convert rtf files to markdown, and keep the original file's creation and modification dates.


I wrote this to convert rtf files to plain markdown. I take tons of notes, have done for years. My archives are in RTF. Now I use markdown.

Update: Got changed this so only converts to plain text. Textutil's conversion was problematic. For my uses, best results just going to plain text.

All the complexity here is around updating the modifcation and creation dates in the newly created files so that they match the old files.

## Installation
Place in ~/Library/Services and you should be able to access through Finder's contextual menu under "Services"
