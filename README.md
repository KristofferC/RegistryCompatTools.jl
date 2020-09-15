# RegistryCompatInfo.jl

## Usage


```julia 
julia> d = RegistryCompatTools.held_back_packages();

julia> d["Images"] # Packages that "Images" are holding bacK:
1-element Vector{RegistryCompatTools.HeldBack}:
 ImageQualityIndexes@0.2.0 0.1.3-0.1

julia> filter(p -> any(x -> x.name=="GeometryBasics", p.second), d) # all packages holding back GeometryBasics
Dict{String, Vector{RegistryCompatTools.HeldBack}} with 3 entries:
  "NeuroCore" => [StaticRanges@0.8.0 {0.7}, CoordinateTransformations@0.6.0 {0.5}, GeometryBasics@0.3.…
  "Porta"     => [AbstractPlotting@0.12.9 {0.11.2-0.11}, GeometryBasics@0.3.1 {0.2.11-0.2}]
  "BioMakie"  => [DataStructures@0.18.5 {0.17}, AbstractPlotting@0.12.9 {0.11}, GeometryBasics@0.3.1 {…
``` 
