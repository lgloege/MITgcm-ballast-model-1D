# Introduction
Code used in [Gloege et al. 2017](https://agupubs.onlinelibrary.wiley.com/doi/full/10.1002/2016GB005535)

- `source` = directory with model source code (do not modifity this)
- `inputs` = the inputs used to force the model in different provinces
- `code` = modified source code is here
- `build` = this is where compiled source code will go (it is currently empty)
- `running` = directory where you run the compiled model
- `build_MITgcm.bash` = script used to build and compile the model

# Compile
Set the paths to model source code, modified code, and optifle in  `build_MITgcm.bash`

Then compile the model with `./build_MITgcm.bash`

# Run model
The model is currently configured for the NADR province.

Change paths to correct input files in the data files.

Then use `run_1d_MITgcm_habanero.sh` to runt he model. This currently setup
to use the Habanero cluseter at Columbia University.

