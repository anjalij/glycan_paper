%Problem with the previous Buildling_Enzymes was that it failed to prevent
%multiple additions of the same substrate to the same site....

residueMap=load('residueTypes.mat');
% Monosaccharide_Set=keys(residueMap.allresidues) %%lists the names of all
% the monosaccharides ''

GalNacResidue=residueMap.allresidues('GalNAc');
GlcNacResidue=residueMap.allresidues('GlcNAc');
GalResidue=residueMap.allresidues('Gal');
FucResidue=residueMap.allresidues('Fuc');
NeuAcResidue=residueMap.allresidues('NeuAc');

Bond_1_2=GlycanBond('2','1');
Bond_1_3=GlycanBond('3','1');
Bond_2_3=GlycanBond('3','2');
Bond_1_4=GlycanBond('4,','1');
Bond_1_6=GlycanBond('6','1');
Bond_2_6=GlycanBond('6','2');
AcceptorBond=GlycanBond('?','?');

%Have to include the Products as excluded substrate branches
Gal_13_GalNac_Product=glycanMLread('Gal_13_GalNac_Product.glycoct_xml');
GlcNac_16_GalNac_Product=glycanMLread('GlcNac_16_GalNac_Product.glycoct_xml');
GlcNac_13_Gal_Product=glycanMLread('GlcNac_13_Gal_Product.glycoct_xml');
GlcNac_14_Gal_Product=glycanMLread('GlcNac_14_Gal_Product.glycoct_xml');
GlcNac_16_Gal_Product=glycanMLread('GlcNac_16_Gal_Product.glycoct_xml');
GlcNac_13_GalNac_Product=glycanMLread('GlcNac_13_GalNac_Product.glycoct_xml');
NeuAc_16_GalNac_Product=glycanMLread('NeuAc_16_GalNac_Product.glycoct_xml');
Fuc_12_Gal_Product=glycanMLread('Fuc_12_Gal_Product.glycoct_xml');
Fuc_13_GlcNac_Product=glycanMLread('Fuc_13_GlcNac_Product.glycoct_xml');
NeuAc_23_Gal_Product=glycanMLread('NeuAc_23_Gal_Product.glycoct_xml');

%including the targetBranch
O_GlycanRoot=glycanMLread('Starting_O_Glycan.glycoct_xml');


%Enzyme1: Gal-1,3 GalNac
Gal_13_GalNac=GTEnz;
Gal_13_GalNac.resAtt2FG=GalNacResidue;
Gal_13_GalNac.resfuncgroup=GalResidue;
Gal_13_GalNac.linkFG=struct('bond',Bond_1_3, 'anomer','b');
Gal_13_GalNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');
%Gal_13_GalNac.targetNABranch=Gal_13_GalNac_Product;
%Gal_13_GalNac.targetNABranch=Galactose_Structure;
%Gal_13_GalNac.substMinStruct=O_GlycanRoot;
%Gal_13_GalNac.substMaxStruct=GlcNac_16_GalNac_Product;
Gal_13_GalNac.substNABranch=CellArrayList
Gal_13_GalNac.substNABranch.add(Gal_13_GalNac_Product);
Gal_13_GalNac.substNABranch.add(GlcNac_13_GalNac_Product);

%Enzyme2:GlcNac-1,6,GalNac
GlcNac_16_GalNac=GTEnz;
GlcNac_16_GalNac.resAtt2FG=GalNacResidue;
GlcNac_16_GalNac.resfuncgroup=GlcNacResidue;
GlcNac_16_GalNac.linkFG=struct('bond',Bond_1_6, 'anomer','b');
GlcNac_16_GalNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');
%GlcNac_16_GalNac.substMinStruct=O_GlycanRoot;
%GlcNac_16_GalNac.substMaxStruct=Gal_13_GalNac_Product
GlcNac_16_GalNac.substNABranch=CellArrayList;
GlcNac_16_GalNac.substNABranch.add(GlcNac_16_GalNac_Product);
GlcNac_16_GalNac.substNABranch.add(NeuAc_16_GalNac_Product);

%Enzyme3:GlcNac-1,3 GalNac
GlcNac_13_GalNac=GTEnz;
GlcNac_13_GalNac.resAtt2FG=GalNacResidue;
GlcNac_13_GalNac.resfuncgroup=GlcNacResidue;
GlcNac_13_GalNac.linkFG=struct('bond',Bond_1_3, 'anomer','b');
GlcNac_13_GalNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');
%GlcNac_13_GalNac.substMaxStruct=GlcNac_16_GalNac_Product;
GlcNac_13_GalNac.substNABranch=CellArrayList;
GlcNac_13_GalNac.substNABranch.add(GlcNac_13_GalNac_Product);
GlcNac_13_GalNac.substNABranch.add(Gal_13_GalNac_Product);

%Enzyme4:NeuAC-1,6,GalNac
NeuAc_16_GalNac=GTEnz;
NeuAc_16_GalNac.resAtt2FG=GalNacResidue;
NeuAc_16_GalNac.resfuncgroup=NeuAcResidue;
NeuAc_16_GalNac.linkFG=struct('bond',Bond_1_6, 'anomer','b');
NeuAc_16_GalNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');
NeuAc_16_GalNac.substNABranch=CellArrayList;
NeuAc_16_GalNac.substNABranch.add(NeuAc_16_GalNac_Product);
NeuAc_16_GalNac.substNABranch.add(GlcNac_16_GalNac_Product);

%Enzyme5:GlcNac-1,3 Gal
GlcNac_13_Gal=GTEnz;
GlcNac_13_Gal.resAtt2FG=GalResidue;
GlcNac_13_Gal.resfuncgroup=GlcNacResidue;
GlcNac_13_Gal.linkFG=struct('bond',Bond_1_3, 'anomer','b');
GlcNac_13_Gal.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');
GlcNac_13_Gal.substNABranch=CellArrayList;
GlcNac_13_Gal.substNABranch.add(NeuAc_23_Gal_Product);
GlcNac_13_Gal.substNABranch.add(GlcNac_13_Gal_Product);


%Enzyme6: Fuc-1-2, Gal
Fuc_12_Gal=GTEnz;
Fuc_12_Gal.resAtt2FG=GalResidue;
Fuc_12_Gal.resfuncgroup=FucResidue;
Fuc_12_Gal.linkFG=struct('bond',Bond_1_2, 'anomer','a');
Fuc_12_Gal.linkresAtt2FG=struct('bond',AcceptorBond,'anomer','b');
Fuc_12_Gal.substNABranch=CellArrayList;
Fuc_12_Gal.substNABranch.add(Fuc_12_Gal_Product);

%Enzyme7: Fuc 1,3 GlcNac
Fuc_13_GlcNac=GTEnz;
Fuc_13_GlcNac.resAtt2FG=GlcNacResidue;
Fuc_13_GlcNac.resfuncgroup=FucResidue;
Fuc_13_GlcNac.linkFG=struct('bond',Bond_1_3,'anomer','a');
Fuc_13_GlcNac.linkresAtt2FG=struct('bond',AcceptorBond,'anomer','b');
Fuc_13_GlcNac.substNABranch=CellArrayList;
Fuc_13_GlcNac.substNABranch.add(Fuc_13_GlcNac_Product);

%Enzyme8: NeuAc 2,3 Gal
NeuAc_23_Gal=GTEnz;
NeuAc_23_Gal.resAtt2FG=GalResidue;
NeuAc_23_Gal.resfuncgroup=NeuAcResidue;
NeuAc_23_Gal.linkFG=struct('bond',Bond_2_3,'anomer','b');
NeuAc_23_Gal.linkresAtt2FG=struct('bond',AcceptorBond,'anomer','b');
NeuAc_23_Gal.substNABranch=CellArrayList;
NeuAc_23_Gal.substNABranch.add(NeuAc_23_Gal_Product);
NeuAc_23_Gal.substNABranch.add(GlcNac_13_Gal_Product);

%Enzyme9:GlcNac 1,6 Gal
GlcNac_16_Gal=GTEnz;
GlcNac_16_Gal.resAtt2FG=GalResidue;
GlcNac_16_Gal.resfuncgroup=GlcNacResidue;
GlcNac_16_Gal.linkFG=struct('bond',Bond_1_6,'anomer','b');
GlcNac_16_Gal.linkresAtt2FG=struct('bond',AcceptorBond,'anomer','b');
GlcNac_16_Gal.substNABranch=CellArrayList;
GlcNac_16_Gal.substNABranch.add(GlcNac_16_Gal_Product);

%enzymes added to a cellArrayList
enzArray=CellArrayList;
enzArray.add(NeuAc_16_GalNac);
enzArray.add(GlcNac_16_GalNac);
enzArray.add(GlcNac_13_GalNac);
enzArray.add(GlcNac_13_Gal);
enzArray.add(Gal_13_GalNac);
enzArray.add(Fuc_12_Gal);
enzArray.add(Fuc_13_GlcNac);
enzArray.add(NeuAc_23_Gal);
enzArray.add(GlcNac_16_Gal);

%Defining starting substrate
O_Glycan_Root=GlycanSpecies(glycanMLread('Starting_O_Glycan.glycoct_xml'));
substrateArray=CellArrayList;
substrateArray.add(O_Glycan_Root);

[isPath,oglycanpath]=inferGlyForwPath(substrateArray,enzArray);
glycanPathViewer(oglycanpath)
