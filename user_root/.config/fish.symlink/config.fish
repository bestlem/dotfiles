
set conda_path  ~/miniconda3

if status --is-login
	set PATH $conda_path/bin ~/bin  /usr/local/bin /opt/local/bin /usr/bin /bin /usr/sbin /sbin
end
if status --is-interactive
	set EDITOR "open -a Aquamacs.app "
	# colors for ls
	set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
	set BROWSER open
	set WAFDIR /Users/mark/src/cpp/waf/waflib


end

if test -e $conda_path/etc/fish/conf.d/conda.fish
	source  $conda_path/etc/fish/conf.d/conda.fish
end



