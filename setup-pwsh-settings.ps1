$s = @'
$env:PATH += ':/home/dns/bin/BIN/:/home/dns/.local/bin/'

Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow -Function BackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow -Function ForwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+Delete -Function DeleteWord
#Set-PSReadLineKeyHandler -Chord Ctrl+BackSpace -Function BackwardDeleteWord	# not working
Set-PSReadLineKeyHandler -Chord Home -Function BeginningOfLine
Set-PSReadLineKeyHandler -Chord End -Function EndOfLine
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+LeftArrow -Function SelectBackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+RightArrow -Function SelectForwardWord
#Set-PSReadLineKeyHandler -Chord Shift+LeftArrow -Function SelectBackwardChar	# not working
#Set-PSReadLineKeyHandler -Chord Shift+RightArrow -Function SelectForwardChar	# not working
'@

$s >> $PROFILE
