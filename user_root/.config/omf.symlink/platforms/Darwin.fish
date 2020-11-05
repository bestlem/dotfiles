# MacOS specific commands

if status --is-login
	set -xg PATH ~/bin /Applications/Racket\ v7.8/bin /usr/local/bin /opt/local/bin /usr/bin /bin /usr/sbin /sbin  /Applications/VMware\ Fusion.app/Contents/Public
end

if status --is-interactive
	set -gx EDITOR "open -a Aquamacs.app "
	# colors for ls
	set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
	set BROWSER open
	set -gx WAFDIR /Users/mark/src/cpp/waf/waflib
	#source ~/.config/fish/conda.fish

end
