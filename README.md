# Bug demonstrator

Demonstrates a bug in micromamba 1.4.7

## Steps to reproduce

Run `docker build .` in this directory to test the the latest micromamba version.

```console
 > [5/5] RUN micromamba create -f /tmp/env.yml:                                                                                                                                                                                                                 
#0 0.512 error    libmamba ZSTD decompression error: Unknown frame descriptor                                                                                                                                                                                   
#0 0.665 error    libmamba ZSTD decompression error: Unknown frame descriptor                                                                                                                                                                                   
#0 1.381 critical libmamba Multiple errors occured:                                                                                                                                                                                                             
#0 1.381     Download error (23) Failed writing received data to disk/application [https://conda.anaconda.org/anaconda/noarch/repodata.json.zst]
#0 1.381     Failure writing output to destination
#0 1.381     Subdir pkgs/r/noarch not loaded!
#0 1.381     Subdir anaconda/noarch not loaded!
#0 1.381     Subdir conda-forge/noarch not loaded!
#0 1.381     
------
```

## Steps to verify this is caused by micromamba 1.4.7

Runing `docker build --build-arg MAMBA_VERSION=1.4.6 .` we can see it used to work in the previous version