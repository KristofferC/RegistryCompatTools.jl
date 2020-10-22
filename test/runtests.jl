using RegistryCompatTools

using Test

@test held_back_packages() isa Dict
@test held_back_by("Requires") isa Vector{String}
# The following test assumes that at least one of the dependents of ColorTypes is compatible with the latest version
@test length(held_back_by("ColorTypes", typemax(VersionNumber))) > length(held_back_by("ColorTypes"))
