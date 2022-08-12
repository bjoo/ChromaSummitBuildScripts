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
 
### Summit specific issues

The codes can take a long time to build, especially LLVM, and QUDA. On Summit, long build times can trigger a resource limit which can stop the build process, with weird looking segfaults. For the moment, my suggestion is to build the code in an interactive, single node job. This also has the added benefit of not hogging the login CPU allowing one to use all the cores for building. To get an interactive node on Summit one should run:

```bash$
bsub -nnodes 1 -P <ProjectID> -W90 -Is /bin/bash
```
This should grab an interactive node for 90 minutes. The `<ProjectID>` here needs to be the allocated Project ID.
 
### Building the Code
In the `cuda-jit` directory are a variety of scripts. Essentially there is a script for building each software component which are in order...
 * `env.sh` -- sets up the build environmnent (CUDA modules, Ninja build system etc. and sets the LD_LIBRARY_PATH to the to-be installed codes)
 * `build_qmp.sh` -- builds QMP
 * `build_llvm_13.sh` -- builds the LLVM library (currently using LLVM-13)
 * `build_qdpxx.sh` -- builds QDP-JIT
 * `build_quda.sh` -- builds QUDA (with Clover and DWF fermions)
 * `build_chroma.sh` -- builds Chroma

There is a `build_all.sh` package which should build the packages in order. 

#### Build and Install directories
Each package will be built in a subdirectory of `cuda-jit/build` called `build_<packagename>/` (e.g. `cuda-jit/build/build_qmp`)

The packages be installed in `cuda-jit/install/<packagename>` (e.g. `cuda-jit/install/chroma`)

If alternate build-directories are required, these can be customized in the `env.sh` script by setting the `BUILDROOT` and `INSTALLROOT` variables.


### Running the Code
The general recommendation is to symbolic link from the build. I.e. to run Chroma:
```bash$
 cd RUNDIR;
 ln -s PACKAGE_DIR/cuda-jit/env.sh .
 ln -s PACKAGE_DIR/cuda-jit/install/chroma/bin/chroma .
 ```
 where `RUNDIR` is the directory where you will be running, and `PACKAGE_DIR` is the top of this repository (containing the `cuda-jit` and `src` directories).
 
