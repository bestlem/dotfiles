#!/usr/bin/python

'''
Look for all the git folders in source and fetch or clone them to the destination
'''

import os
import subprocess
import logging
from logging.handlers import SysLogHandler

syslog_handler = SysLogHandler(address='/var/run/syslog')
syslog_handler.formatter = logging.Formatter('git-copy: %(levelname)s %(message)s')

stream_handler = logging.StreamHandler()
stream_handler.formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
logging.basicConfig(level=logging.INFO,
				handlers=[syslog_handler, stream_handler]
				)


def list_git_root( source_dir ):
	for root, dirs, files in os.walk( source_dir ) :
		parent, simple_dir = os.path.split( root )
		for x in ['.Trash', 'tmp', 'ThirdParty',
                      'Caches', 'Google Drive', 'Object Arts',
                      '.cocoapods', 'Dropbox', '.build', "Wineskin", "SyncServices",
                      ".cache", ".local",".cookiecutters", "Aquamacs Emacs/Packages",
                      ".emacs.d/straight/repos"]:
			if x in dirs:
				dirs.remove(x)

		# return the root as it contains a git repository
		if '.git' in dirs:
			dirs.remove( '.git' )
			yield  root


def process_one_repo( dest_root, source_root, source ):
	dest = os.path.join( dest_root, os.path.relpath(source, source_root) )

	try:
		logging.info( 'processing ' + source )
		dest_rep = dest + '.git'
		if os.path.exists( dest_rep ):
			logging.info( 'git push on' + dest )
			subprocess.check_call( ['git', 'push', '--mirror',	dest ], cwd=source )
			subprocess.check_call( ['git', 'gc', '--auto' ], cwd=dest_rep )
		else:
			dest_dir = os.path.split(dest)[0]
			if not os.path.exists( dest_dir ):
				os.makedirs( dest_dir )
			logging.info('git clone ' + source)
			subprocess.check_call( ['git', 'clone', '--mirror',	 source ], cwd=dest_dir )
			subprocess.check_call( ['git', 'gc', '--aggressive' ], cwd=dest_rep )
	except Exception as inst:
		logging.warning('exception in ' + dest )
			
def copy( source_root, dest_root ):
	if not os.path.exists( dest_root ):
		os.makedirs( dest_root)

	for source in list_git_root( source_root ):
		 process_one_repo( dest_root, source_root, source )

			
if __name__	 == '__main__':
	source_root = '/Users/mark'
	dest_root = '/Users/mark/SyncServices/DropBox/backup/git-repos'
	#dest_root = '/Users/mark/tmp/git-repos'
	copy( source_root, dest_root )
