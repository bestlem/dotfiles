#!/usr/bin/env python3
"""
Install files into root for setup of shell etc
Readonly config files + simple scripts
"""
import subprocess
import os
from os.path import dirname, expanduser
import sys
from pathlib import Path
import argparse
import shutil


def msg_level(level, message):
	""" Output a message to stdout if level >= number of v in -vvv verbose option """
	if args.verbose and args.verbose >= level:
		pad = '  ' * level
		print(pad + message)


def install(files, target, perms="0600"):
	""" install the files into the target directory including making it """
	install_exe = '/usr/bin/install'
	subprocess.check_call([install_exe, '-d', target])
	cmd = [install_exe, '-Cp']
	perm_str = '-m' + perms
	cmd.append(perm_str)
	cmd += files
	cmd.append(target)
	subprocess.check_call(cmd)


def link_list_paths(sources, target_dir):
	""" link the list on sources into the target directory """
	for s in sources:
		link_path(s, target_dir)


def delete_path(target_file):
	if not target_file.is_symlink() and target_file.is_dir():
		shutil.rmtree(target_file)
	else:
		target_file.unlink()


def link_path(source, target_dir):
	""" link one thing """
	target_name = source.stem if source.suffix == '.symlink' else source.name
	target = target_dir / target_name

	if need_to_update(source, target):
		if not target_dir.exists():
			msg_level(2, "Make dir {}".format(target_dir))
			if args.do_it:
				target_dir.mkdir(parents=True)
		msg_level(2, "Linking from {} to file {}".format(source, target))
		if args.do_it:
			target.symlink_to(source)


def need_to_update(source, target_file):
	"""Check to see if target needs to be replaced or does not exist"""
	need = True
	if target_file.is_symlink() or target_file.exists():
		if target_file.exists() and target_file.samefile(source):
			msg_level(2, "Matched {} and {} as same file".format(source, target_file))
			need = False
		else:
			msg_level(2, "Deleting existing file {}".format(target_file))
			if args.do_it:
				delete_path(target_file)
	else:
		msg_level(3, "File {} does not exist".format(target_file))
	return need


def home_dotfiles(user_root):
	""" config files to end up in ~"""
	dot_files_src_dir = Path(args.source_dir).absolute() / user_root
	for root, dirnames, files in os.walk(dot_files_src_dir):
		root_path = Path(dot_files_src_dir) / root
		target_sub_dir = Path(args.target_dir) / root_path.relative_to(dot_files_src_dir)
		paths_to_link = []
		if len(files) > 0:
			paths_to_link += files
		# Only link path if ends in symlink
		if len(dirnames) > 0:
			dirs_to_pass_down = []
			for d in dirnames:
				if d.endswith('.symlink'):
					paths_to_link.append(root_path / d)
				else:
					dirs_to_pass_down.append(d)
					# modify directories to recurse into
			dirnames[:] = dirs_to_pass_down

		if len(paths_to_link) > 0:
			msg_level(1, "Installing from {} to {}".format(root, target_sub_dir))
			root_paths = [root_path / x for x in paths_to_link]
			link_list_paths(root_paths, target_sub_dir)


def user_bin():
	""" executable files to be installed in ~/bin"""
	bin_files_dir = os.path.abspath(os.path.join(args.source_dir, 'bin'))
	files = [os.path.join(bin_files_dir, x) for x in os.listdir(bin_files_dir)]
	install_dir = os.path.join(args.target_dir, 'bin')
	msg_level(1, "Installing from {} to {}".format(bin_files_dir, install_dir))
	if args.do_it:
		install(files, install_dir, perms='0755')


def get_args():
	""" Set up the arguments from the command line """
	parser = argparse.ArgumentParser()
	parser.add_argument(
		"-d", "--doit", dest="do_it", action='store_true',
		help='Copy and link the files - if not set just shows what would be done')
	parser.add_argument(
		"-v", "--verbose", dest="verbose", action='count',
		help='Output what is being done - add more vs to show more')
	parser.add_argument(
		"-u", "--user_root", dest="user_root", action='store_true',
		help='Install to user ~ - overrides target_dir')
	parser.add_argument(
		"-i", "--target", dest="target_dir",
		#         default = expanduser('~'),
		default=expanduser('~/tmp/root'),
		help='Root directory to install to  default ~/tmp/root')
	parser.add_argument(
		"-s", "--source", dest="source_dir",
		default=dirname(__file__),
		help='Directory containing things to install from - default ~')
	parser.add_argument(
		"-t", "--test", dest="test", action='store_true',
		help='Just do test directory')

	_args = parser.parse_args()
	if _args.user_root:
		_args.target_dir = Path.home()
	return _args


if __name__ == '__main__':
	args = get_args()
	if args.test:
		home_dotfiles('test_root')
	else:
		home_dotfiles('user_root')
		if sys.platform == 'darwin':
			home_dotfiles('mac_user_root')
		user_bin()
