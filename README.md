<h1 align="center"> MITgcm-ballast-model-1D</h1>

<p align="center">
   <img height="400" src="https://github.com/lgloege/MITgcm-ballast-model-1D/blob/master/results/figures/bcp_schematic.jpg">
</p>

# Introduction
Code used in [Gloege et al. 2017](https://agupubs.onlinelibrary.wiley.com/doi/full/10.1002/2016GB005535)

- `source` = directory with model source code (do not modifity this)
- `inputs` = the inputs used to force the model in different provinces
- `code` = modified source code is here
- `running` = directory where you run the compiled model
- `build_MITgcm.bash` = script used to build and compile the model

# Compile
Set the paths to model source code, modified code, and optifle in  `build_MITgcm.bash`

Then compile the model with `./build_MITgcm.bash`

# Run model
The model is currently configured for the NADR province.

In the data files, change the paths to correct forcing files in `inputs`.

Then use `run_1d_MITgcm_habanero.sh` to run the model. Make sure you moved the `mitgcmuv` executable
from the build directory.
This is currently setup to use the Habanero cluster at Columbia University.

