# Marks’s dotfiles


**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!
### Using Git and the install script

You can clone the repository wherever you want. (I like to keep it in `~/src/dotfiles`.) The install.py script will link the files to your home folder.

This script does the thing but look at install first to check it does what you want.

```bash
git clone https://github.com/bestlem/dotfiles.git && cd dotfiles && python3 install.py --doit --user_root -vvv
```
Using links means that updates happen invisibly except for the executables in bin which need install to be run again with the same arguments as before.

### Git-free install

It could be done

## Install.py
The basic setup ie without arguments is to a dry run into ~/tmp/root

Extra flags are required to actually put it into root.

The --test flag is to use a small set of test files so that you can see what is being done.

    ./install.py --help                                                                                                  
    usage: install.py [-h] [-d] [-v] [-u] [-i TARGET_DIR] [-s SOURCE_DIR] [-t]

    optional arguments:
        -h, --help	      show this help message and exit
        -d, --doit        Copy and link the files - if not set just shows what
                             would be done
        -v, --verbose     Output what is being done - add more vs to show more
        -u, --user_root   Install to user ~ - overrides target_dir
        -i TARGET_DIR,  --target TARGET_DIR
                          Root directory to install to default ~/tmp/root
        -s SOURCE_DIR, --source SOURCE_DIR
                          Directory containing things to install from - default ~
       -t, --test         Just do test directory

### Extra non managed files.
The files are not complete to allow user identification etc to be in .local files

These files are:

.gitconfig includes .config/local/gitconfig to allow git credentials

    [user]
	name = Mark
	email = EMAIL ADDRESS
	
### Directories
Normally directories are not linked just the files. However if the source directory has a suffix `.symlink` then that will be lined to a directory 

### Inspiration
I came across the idea of dotfiles in repositories when I was looking for example initialisation files for xonsh as I thought I would like to switch to that as I was having to write scripts to work on MacOS and Linux and writing in python seems much clearer than shell. e.g. the [Github dotfiles page](https://dotfiles.github.io)

Then I looked at what I had already and I had a dotfiles script that used Unix install to copy files to the root. However seeing other dotfiles and the pain of having to edit one file then install it and then check made me want to link the files so I could edit them in place. However there will some files that a copy like install would be better for as a bit of pre-processing could be needed.


## Feedback

Suggestions/improvements
[welcome](https://github.com/bestlem/dotfiles/issues)!

## Author

Mark Bestley


## Thanks to…
Many over the years now lost to my memory (except the odd comment in the source files

*  
