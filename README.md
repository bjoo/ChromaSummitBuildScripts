# ChromaSummitBuildScripts

## Introduction

This is a list of scripts I use to build Chroma on summit with QDP-JIT and QUDA
The scripts are all in the `cuda-jit/` directory, whereas the sources need to go to the `src/` directory. 

### Preliminaries
 * First, get the sources. The `populate.sh` script helps with that. 
 ```bash$
    cd src; ./populate.sh; cd ..
 ```
 * We need to change the toplevel directory in the `cuda-jit/env.sh` file.
 ```bash$
    cd cuda-jit
 ```
   now edit the file `env.sh` with your favourite editor. Replace the value of `TOPDIR_HIP` with the location
   of the current directory. A full path is recommended so you can source this  `env.sh` script also in your run scipts.
 
 Once this is done you should be able to build the code.
