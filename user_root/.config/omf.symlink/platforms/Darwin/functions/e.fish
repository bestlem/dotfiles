function e --description="edit a file in preferred editor"
    #'/Applications/Aquamacs.app/Contents/MacOS/bin/emacsclient' $argv
    open -a Aquamacs.app $argv
end
