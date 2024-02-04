using RegistryCompatTools

using Test

const rexversion = "\\d+\\.\\d+\\.?\\d*"

@test held_back_packages() isa Dict
@test held_back_by("Requires") isa Vector{String}
let d = held_back_packages()
    io = IOBuffer()
    show(IOContext(io, :color=>true), MIME("text/plain"), first(values(d)))
    str = String(take!(io))
    pkgs = split(chomp(str), '\n')[2:end]
    @test !isempty(pkgs)
    @test occursin(Regex(".*@.*$rexversion.* .*$rexversion"), first(pkgs))   # check for version string (allow ANSI skip)
    @test occursin("\e[", first(pkgs))   # test ANSI terminal codes for coloration
end

# The following test assumes that at least one of the dependents of ColorTypes is compatible with the latest version
@test length(held_back_by("ColorTypes", typemax(VersionNumber))) > length(held_back_by("ColorTypes"))
