load('Unique_Gal_Subgraphs.mat')
load('Complete_Linkage_Map.mat')
load('Common_Subgraphs.mat')
load('Unique_Gal_Subgraphs.mat')
load('Unique_GlcNac_Subgraphs.mat')
load('Common_Paths.mat')
load('GlcNac_Paths.mat')
load('Gal_Paths.mat')

%this will make the Gal-GlcNac two compartment systems
Gal_GlcNac=two_compartments(Unique_Gal_Subgraphs,GlcNac_Paths, Complete_Linkage_Map)

%GlcNac-Gal
GlcNac_Gal=two_compartments(Unique_GlcNac_Subgraphs,Gal_Paths, Complete_Linkage_Map)

%GlcNac-GlcNac
GlcNac_GlcNac=two_compartments(Unique_GlcNac_Subgraphs,GlcNac_Paths, Complete_Linkage_Map)

%Gal-Gal
Gal_Gal=two_compartments(Unique_Gal_Subgraphs,Gal_Paths, Complete_Linkage_Map)

%Gal-Common
Gal_Common=two_compartments(Unique_Gal_Subgraphs,Common_Paths, Complete_Linkage_Map)

%GlcNac-Common
GlcNac_Common=two_compartments(Unique_GlcNac_Subgraphs,Common_Paths, Complete_Linkage_Map)

%Common-Gal
Common_Gal=two_compartments(Common_Subgraphs,Gal_Paths, Complete_Linkage_Map)

%Common-GlcNa
Common_GlcNac=two_compartments(Common_Subgraphs,GlcNac_Paths, Complete_Linkage_Map)

%Common-Common
Common_Common=two_compartments(Common_Subgraphs,Common_Paths, Complete_Linkage_Map)