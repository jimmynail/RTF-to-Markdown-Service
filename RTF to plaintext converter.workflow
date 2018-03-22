# Wrote this to convert rtf files to plain text. 
# I take tons of notes, have done for years. My archives are in RTF. Now I use markdown.
# Actually meant to go to markdown but textutil's conversion was problematic
# For my uses, best results just going to plain text.
# All the complexity is around updating the modifcation 
# and creation dates in the newly created files so that they match the old files.
# Enjoy! -Tyson

for i in "$@"; do
	fileName="$i"
	creationDate=$(stat -f "%SB" -t "%Y-%m-%dT%H:%M:%SZ" "$fileName")
	modificationDate=$(stat -f "%Sm" -t "%Y-%m-%dT%H:%M:%SZ" "$fileName")
	textutil -creationtime $creationDate -modificationtime $modificationDate -convert txt "$fileName"

	newFileName="${fileName%.*}"
	newFileName="$newFileName.txt"
	
	# We get dates again becuase the formats required by SetFile are different from textutil
	# and I'm too lazy to figure out how to translate. Instead, GetFileInfo returns dates in correct format.
	# Also for some reason setting creation and modification times in textutil doesn't seem to work.
	# So I do it again with SetFile. I've left it in textutil in case it is doing something useful I don't see.

	creationDate=$(GetFileInfo -d "$fileName")
	modificationDate=$(GetFileInfo -m "$fileName")
	SetFile -m "$modificationDate" "$newFileName"
	SetFile -d "$creationDate" "$newFileName"
done
