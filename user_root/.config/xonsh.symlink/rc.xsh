$XONSH_SHOW_TRACEBACK = True

import sys
from pathlib import Path
from xonsh.platform import (
    ON_WINDOWS, ON_LINUX, ON_DARWIN
)

orig_PATH = $PATH[:]

#xontrib load xonda

#sys.path.append(${...}['XONSH_CONFIG_DIR'] + '/xonsh_config')
cd $XONSH_CONFIG_DIR
source 'conda.xsh'
conda activate xonsh

cd -

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
	__path_prepend(
		$PATH,
		[python_path, '~/bin', '/usr/local/bin', '/opt/local/bin' ]
		)
	#path_expand(
		#$BASH_COMPLETIONS,#
		#[
		#	'/opt/local/share/bash-completion/completions',
		#	'/opt/local/etc/bash_completion.d',
		#	'~/.config/bash_completions'
		#])


def load_xontribs():
	#xontrib load xonda
	xontrib load coreutils prompt_ret_code z 
	#whole_word_jumping
	# The following seem to require $PROJECT_DIRS
	#xontrib load vox vox_tabcomplete avox
	#xontrib docker_tabcomplete
	pass


def appearence():
	$LSCOLORS='gxfxbEaEBxxEhEhBaDaCaD'
	#$XONSH_COLOR_STYLE='fruity' #makes virtenv in powerline unreadable
	$XONSH_COLOR_STYLE='paraiso-dark'

	#ptk display stuff
	$COMPLETIONS_BRACKETS = False
	$COMPLETIONS_CONFIRM = True
	#$PROMPT = '{env_name:{} }{BOLD_GREEN} {short_cwd} {branch_color}{curr_branch: {}}{NO_COLOR} {ret_code_color}{ret_code}{prompt_end}{NO_COLOR} '
	xontrib load powerline
	$TITLE = '{env_name:{} }{curr_branch: {}} {user}@{hostname}: {cwd} | xonsh'

	
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
			'/opt/local/share/bash-completion/bash_completion',
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