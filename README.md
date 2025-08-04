# jaspBmi

Jasp module for interacting with a remote model running the basic model interface (BMI) with [remotebmi](https://github.com/eWaterCycle/remotebmi).

## Developer installation

On Ubuntu 24.094 use miniforge3 to install R and the required packages.

```shell
# To get systemstools, ragg to compile, same extra packages have been added besides R stuff
mamba create -n jasp-bmi r-base r-essentials r-renv expat zlib liblzma-devel pkg-config
mamba activate jasp-bmi
export GITHUB_PAT=ghp_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

Problem with jaspBase

```
R
renv::install()
...
Cloning c++ dependency jaspColumnEncoder
Cloning into 'inst/include/jaspColumnEncoder'...
fatal: not a git repository: '/.git'
** libs
Error: C++20 standard requested but CXX20 is not defined
* removing ‘/home/stefanv/git/JASP-MOD/jaspBmi/renv/staging/1/jaspBase’
install of package 'jaspBase' failed [error code 1]
...
```

Workaround use local clone without C++20

```shell
git clone https://github.com/jasp-stats/jaspBase ../jaspBase
diff --git a/src/Makevars.in b/src/Makevars.in
index 868eec9..bb28f6d 100644
--- a/src/Makevars.in
+++ b/src/Makevars.in
@@ -1,4 +1,4 @@
-CXX_STD = CXX20
+#CXX_STD = CXX20
 PKG_CXXFLAGS = @cppflags@
 MAKEFLAGS=-j
```

Then install the jaspBase package from local dir

```shell
R
renv::install()
renv::install('jsonlite')
renv::install('httr2')
renv::install('jasp-stats/jaspGraphs')
renv::install('../jaspBase')
q('no')
```

```shell
R CMD INSTALL . --preclean --no-multiarch --with-keep.source jaspBmi
```

Follow instructions at https://github.com/jasp-stats/jasp-desktop/blob/development/Docs/development/jasp-module-workflow.md to get module to show up in JASP.

### Start a BMI server

Install ewatercycle mamba env following instructions at https://github.com/eWaterCycle/ewatercycle

```shell
mamba activate ewatercycle
pip install remotebmi leakybucket
BMI_MODULE=leakybucket.leakybucket_bmi BMI_CLASS=LeakyBucketBmi run-bmi-server
```

Test with curl
```shell
curl http://localhost:50051/get_component_name
{"name": "leakybucket"}
```

## How to use this repository

Fork this template repository to your own GitHub account to start developing your module.
You can then clone the repository to your local machine and start developing your module.

The repository contains example functionality.
Feel free to reuse and adapt the examples to your needs.
Feel also free to remove the ones you don't need.

## Contributing back new module to JASP

Once you have developed your module, you can contribute it back to JASP by creating a pull request.
The JASP team will review your module and provide feedback.
Once your module is accepted, a new repo is created in the JASP organization and your module is added to the JASP module repository.

## Reference
[Adding your own modules to JASP](https://github.com/jasp-stats/jasp-desktop/blob/development/Docs/development/jasp-adding-module.md)