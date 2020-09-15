# RegistryCompatTools.jl

## Usage


```julia
julia> using RegistryCompatTools

julia> d = held_back_packages();

julia> d["Images"] # Packages that "Images" are holding bacK:
1-element Vector{RegistryCompatTools.HeldBack}:
 ImageQualityIndexes@0.2.0 0.1.3-0.1

julia> filter(p -> any(x -> x.name=="GeometryBasics", p.second), d) # all packages holding back GeometryBasics
Dict{String, Vector{RegistryCompatTools.HeldBack}} with 3 entries:
  "NeuroCore" => [StaticRanges@0.8.0 {0.7}, CoordinateTransformations@0.6.0 {0.5}, GeometryBasics@0.3.…
  "Porta"     => [AbstractPlotting@0.12.9 {0.11.2-0.11}, GeometryBasics@0.3.1 {0.2.11-0.2}]
  "BioMakie"  => [DataStructures@0.18.5 {0.17}, AbstractPlotting@0.12.9 {0.11}, GeometryBasics@0.3.1 {…

julia> held_back_by("Images")   # Packages that are holding back "Images"
14-element Vector{String}:
 "Arena"
 "EchogramImages"
 "EdgeCameras"
 "FFmpegPipe"
 "Graphene"
 "ImageHistogram"
 "ImagePhaseCongruency"
 "ImageSegmentationEvaluation"
 "Immerse"
 "Kahuna"
 "MetaImageFormat"
 "PerceptualColourMaps"
 "Photon"
 "PrairieIO"
```

### Collecting packages you have commit access to:

It can be useful to filter the output above to only those packages you have
commit access to. `find_julia_packages_github()` returns a list of such packages
by using the GitHub API.  This requires you to have given a github API token
into the environment variable `GITHUB_AUTH`.  Note that due to what looks like a
bug in the GitHub API, this does currently not return the repos you have access
to via membership in an organization, making it not a lot less useful than
otherwise.

```julia
julia> d = held_back_packages();

julia> my_pkgs = find_julia_packages_github();
Set{SubString{String}} with 43 elements:
  "MethodAnalysis"
  "InplaceOps"
  "Literate"
  "SIMD"
  "Clang_jll"
  "CSparse"
...

julia> my_d = filter(p -> p.first in my_pkgs || any(x -> x.name in my_pkgs, p.second), d);

# Show all packages that we are either holding back or others are holding back
julia> my_d = filter(p -> p.first in my_pkgs || any(x -> x.name in my_pkgs, p.second), d)
Dict{String, Vector{RegistryCompatTools.HeldBack}} with 22 entries:
  "Reproduce"               => RegistryCompatTools.HeldBack[CodeTracking@1.0.2 {0.5}, JLD2@0.2.0 {0.1}]
  "Revise"                  => RegistryCompatTools.HeldBack[LoweredCodeUtils@1.2.0 {0.4}, CodeTracking@1.0.2 {0.5.9-0.5}, JuliaInterpreter…
  "Graph500"                => RegistryCompatTools.HeldBack[ProgressMeter@1.3.3 {0.0.0-0.9}]
  "MagneticReadHead"        => RegistryCompatTools.HeldBack[CodeTracking@1.0.2 {0.5}, Cassette@0.3.3 {0.2.2-0.2}]
```
