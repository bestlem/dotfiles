
if status --is-login
	set PATH ~/bin /usr/local/bin /opt/local/bin /usr/bin /bin /usr/sbin /sbin  /Applications/VMware\ Fusion.app/Contents/Public
end
if status --is-interactive
	set EDITOR "open -a Aquamacs.app "
	# colors for ls
	set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
	set BROWSER open
	set WAFDIR /Users/mark/src/cpp/waf/waflib
	#source ~/.config/fish/conda.fish
	
	switch $TERM_PROGRAM
		case iTerm.app
			test -e ~/.config/fish/.iterm2_shell_integration.fish ; and source ~/.config/fish/.iterm2_shell_integration.fish
	end
end




