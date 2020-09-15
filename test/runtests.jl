using RegistryCompatTools

using Test

@test held_back_packages() isa Dict
@test held_back_by("Requires") isa Vector{String}
