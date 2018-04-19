# Setup

## Conda
Install from conda site using script file or as part of distribution
 
     conda update
     # Add conda-forge after others
     conda config --append channels conda-forge
     
     
## Oh My Fish - if using
  Note this is not in all branches
 Need to install omf asper instructions on https://github.com/oh-my-fish/oh-my-fish
 
     curl -L https://get.oh-my.fish | fish

and some combination of

    omf install
 
## macports
Need to edit `/opt/local/etc/macports/variants.conf`

    -x11 +no_x11 +quartz
    +bash_completion
    

