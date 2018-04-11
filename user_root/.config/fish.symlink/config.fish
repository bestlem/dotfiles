
if status --is-interactive

	if set -q TERM_PROGRAM
		switch $TERM_PROGRAM
			case iTerm.app
				test -e ~/.config/fish/.iterm2_shell_integration.fish ; and source ~/.config/fish/.iterm2_shell_integration.fish
		end
	 end
end




