$XONSH_SHOW_TRACEBACK = True


''' Hode  Depreciation warnings down in code
From https://stackoverflow.com/a/1640777/151019
'''

import warnings

with warnings.catch_warnings():
    warnings.filterwarnings("ignore",category=DeprecationWarning)
    import imp
	
import sys
from pathlib import Path
from xonsh.platform import (
    ON_WINDOWS, ON_LINUX, ON_DARWIN
)

orig_PATH = $PATH[:]

orig_sys_path = sys.path

sys.path.insert(0, '/Users/mark/src/python/xontrib-powerline')

def __path_prepend(path, new_paths):
	new_paths.reverse()
	for p in new_paths:
		p1 = Path(p).expanduser()
		if p1.as_posix() in path:
			path.remove(p1.as_posix())
		if p1.exists():
			path.insert(0, p)


def path_setup():
	python_path = Path(sys.executable).parent
	python_path = '~/miniconda3/bin'
	__path_prepend(
		$PATH,
		[python_path, '~/.local/bin', '~/bin', '/usr/local/bin', '/opt/local/bin' ]
		)


def load_xontribs():
	xontrib load xonda
	xontrib load coreutils prompt_ret_code  
	#whole_word_jumping
	#xontrib docker_tabcomplete # error i as xontrib has a depreciated thing
	pass


def appearence():
	$LSCOLORS='gxfxbEaEBxxEhEhBaDaCaD'
	#$XONSH_COLOR_STYLE='fruity' #makes virtenv in powerline unreadable
	$XONSH_COLOR_STYLE='paraiso-dark'

	#ptk display stuff
	$COMPLETIONS_BRACKETS = False
	$COMPLETIONS_CONFIRM = True
	xontrib load powerline
	$TITLE = '{env_name:🐍{} }{curr_branch:🌴({})} {user}@{hostname}: {cwd} | xonsh'

	
def behaviour():
	# from https://github.com/mitnk/dotfiles/blob/master/xonsh/xonshrc
	# history backend: 'json', 'sqlite', 'dummy', <class>
	$XONSH_HISTORY_BACKEND = 'sqlite'

	# bigger history
	$XONSH_HISTORY_SIZE = (0xFFFFFF, 'commands')
	# do NOT save output in history
	$XONSH_STORE_STDOUT = False
	# history - ignore duplicated cmds
	$HISTCONTROL = 'ignoredups'

	
def macos_setup():
	# macos specific
	aliases['l@'] = 'ls -AG@Flha'
	aliases['l'] = 'ls -AG@Fha'
	aliases['e'] = 'open -a Aquamacs.app'
	aliases['man'] = 'openman'

	# Macports based
	__path_prepend(
		$BASH_COMPLETIONS, [
			'/opt/local/share/bash-completion/bash_completisenvon',
			'/opt/local/etc/profile.d/bash_completion.sh',
            ]
		)


# Alias Helper funcs
def __env(args, stdin=None):
	/usr/bin/env | sort

def _mkcd(args, stdin=None):
    if len(args) == 1:
        mkdir -p @(args[0])
        cd @(args[0])
    else:
        return


def posix_setup():
	aliases['lr'] = 'ls -AGFlhart'
	aliases['ll'] = 'ls -AGFlha'

	aliases['grep'] = 'grep -i --color=always'
	aliases['mkdir'] = 'mkdir -p'
	aliases['env'] = __env
	aliases['mkcd'] = _mkcd

def typo_aliases():
	aliases['ks'] = aliases['ls']

path_setup()
load_xontribs()
appearence()
behaviour()
posix_setup()
if ON_DARWIN: macos_setup()
typo_aliases()


# cleanup remove things from namespace

#source '~/miniconda3/lib/python3.6/site-packages/xonsh/conda.xsh'