
#!/bin/bash

# install netcdf at known location in travis ubuntu environment.
NFDIR=/travis/local #make sure its in the default location...

# basis for the below was found here: https://gist.github.com/perrette/cd815d03830b53e24c82

BASHRC="~/.bashrc"

# Install zlib
v=1.2.8
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4/zlib-${v}.tar.gz
tar -xf zlib-${v}.tar.gz && cd zlib-${v}
./configure --prefix=/usr/local
#sudo make check install
sudo make install
cd ..

echo "zlib done"

# Install HDF5
v=1.8.13
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4/hdf5-${v}.tar.gz
tar -xf hdf5-${v}.tar.gz && cd hdf5-${v}
prefix="/usr/local/hdf5-$v"
echo export HDF5_DIR=$prefix >> $BASHRC
./configure --enable-shared --enable-hl --prefix=$HDF5_DIR
make -j 2 # 2 for number of procs to be used
sudo make install
cd ..

echo "hdf5 done"

     # Install Netcdf
     v=4.1.3
     wget http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-${v}.tar.gz
     tar -xf netcdf-${v}.tar.gz && cd netcdf-${v}

    ./configure --enable-netcdf-4  --enable-shared --prefix=${NFDIR}

      make check install
cd ..
echo "done"
