# Graphene Carrier Density
 Matlab implementation of carrier density model for graphene and application to fit a 3D semiconductor carrier model to that of Graphene, finding a pseudo carrier effective mass around a set of values of Ef, Ec and a pseudothickness t.

 To fit the models, modify the file carrier_models.m for the the values of Ec, Ef and t of interest.

## Inputs
 * Ec = Energy of the conduction band (measured from the intrinsic level) in eV
 * Ef = Fermi level (or chemical potential), while fitting the model will minimize the error around this point.
 * t = thickness of a 3D semiconductor that would have the same equivalent 2D carrier density as that of Graphene when computed using the obtained parameters.

## Outputs
 * m = effective mass of carrier ()

The graphene model implemeted is forcing v_f=10^6 m/s, but this can be modified to the more accurate vf = sqrt(3)\*gamma1\*a/(2\*hbar).

The computed carrier densities are in m^(-2).


Juan Esteban Villegas

Photonics Research Lab NYUAD

NYU 2020
