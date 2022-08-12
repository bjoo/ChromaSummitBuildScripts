module load cuda
module load cmake
module load gcc/9.3.0
module load python
module load gdrcopy/2.2
module load ninja

export GCC_HOME=${OLCF_GCC_ROOT}
export TOPDIR_HIP=/gpfs/alpine/proj-shared/stf006/bjoo/ChromaTestbuild-6-3-22/cuda-jit
export SRCROOT=${TOPDIR_HIP}/../src
export BUILDROOT=${TOPDIR_HIP}/build
export INSTALLROOT=${TOPDIR_HIP}/install
export LD_LIBRARY_PATH=${INSTALLROOT}/chroma/lib:${INSTALLROOT}/quda/lib:${INSTALLROOT}/qdpxx/lib:${INSTALLROOT}/qmp/lib:${INSTALLROOT}/llvm-13/lib:${LD_LIBRARY_PATH}

export CUDA_HOME=$CUDA_DIR
export MPI_HOME=$MPI_ROOT
export NVSHMEM_HOME=${INSTALLROOT}/nvshmem-2.3
export GDRCOPY_HOME=/sw/summit/spack-envs/base/opt/linux-rhel8-ppc64le/gcc-8.3.1/gdrcopy-2.2-xk2w6ftqfas57fuzgcxcc7p5pebgthth
export LD_LIBRARY_PATH=${NVSHMEM_HOME}/lib:$LD_LIBRARY_PATH
