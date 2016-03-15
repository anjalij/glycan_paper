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
Bond_1_4=GlycanBond('4','1');
Bond_1_6=GlycanBond('6','1');
Bond_2_6=GlycanBond('6','2');
AcceptorBond=GlycanBond('?','?');

%including the targetBranch
O_GlycanRoot=glycanMLread('Starting_O_Glycan.glycoct_xml');


%Enzyme2: Gal-1,3 GalNac
Gal_13_GalNac=GTEnz;
Gal_13_GalNac.resAtt2FG=GalNacResidue;
Gal_13_GalNac.resfuncgroup=GalResidue;
Gal_13_GalNac.linkFG=struct('bond',Bond_1_3, 'anomer','b');
Gal_13_GalNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');

%Enzyme3:GlcNac-1,3 GalNac
GlcNac_13_GalNac=GTEnz;
GlcNac_13_GalNac.resAtt2FG=GalNacResidue;
GlcNac_13_GalNac.resfuncgroup=GlcNacResidue;
GlcNac_13_GalNac.linkFG=struct('bond',Bond_1_3, 'anomer','b');
GlcNac_13_GalNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');

%Enzyme4:GlcNac-1,6,GalNac
GlcNac_16_GalNac=GTEnz;
GlcNac_16_GalNac.resAtt2FG=GalNacResidue;
GlcNac_16_GalNac.resfuncgroup=GlcNacResidue;
GlcNac_16_GalNac.linkFG=struct('bond',Bond_1_6, 'anomer','b');
GlcNac_16_GalNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');

%Enzyme5:NeuAC-1,6,GalNac
NeuAc_26_GalNac=GTEnz;
NeuAc_26_GalNac.resAtt2FG=GalNacResidue;
NeuAc_26_GalNac.resfuncgroup=NeuAcResidue;
NeuAc_26_GalNac.linkFG=struct('bond',Bond_2_6, 'anomer','b');
NeuAc_26_GalNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');

%Enzyme6: Fuc 1,3 GlcNac
Fuc_13_GlcNac=GTEnz;
Fuc_13_GlcNac.resAtt2FG=GlcNacResidue;
Fuc_13_GlcNac.resfuncgroup=FucResidue;
Fuc_13_GlcNac.linkFG=struct('bond',Bond_1_3,'anomer','a');
Fuc_13_GlcNac.linkresAtt2FG=struct('bond',AcceptorBond,'anomer','b');

%Enzyme7:Gal-1,3 GlcNac
Gal_13_GlcNac=GTEnz;
Gal_13_GlcNac.resAtt2FG=GlcNacResidue;
Gal_13_GlcNac.resfuncgroup=GalResidue;
Gal_13_GlcNac.linkFG=struct('bond',Bond_1_3, 'anomer','b');
Gal_13_GlcNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');

%Enzyme8:Gal 1,4 GlcNAc
Gal_14_GlcNac=GTEnz;
Gal_14_GlcNac.resAtt2FG=GlcNacResidue;
Gal_14_GlcNac.resfuncgroup=GalResidue;
Gal_14_GlcNac.linkFG=struct('bond',Bond_1_4, 'anomer','b');
Gal_14_GlcNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');

%Enzyme9: Fuc-1-2, Gal
Fuc_12_Gal=GTEnz;
Fuc_12_Gal.resAtt2FG=GalResidue;
Fuc_12_Gal.resfuncgroup=FucResidue;
Fuc_12_Gal.linkFG=struct('bond',Bond_1_2, 'anomer','a');
Fuc_12_Gal.linkresAtt2FG=struct('bond',AcceptorBond,'anomer','b');

%Enzyme10: NeuAc 2,3 Gal
NeuAc_23_Gal=GTEnz;
NeuAc_23_Gal.resAtt2FG=GalResidue;
NeuAc_23_Gal.resfuncgroup=NeuAcResidue;
NeuAc_23_Gal.linkFG=struct('bond',Bond_2_3,'anomer','b');
NeuAc_23_Gal.linkresAtt2FG=struct('bond',AcceptorBond,'anomer','b');



%enzymes added to a cellArrayList
enzArray=CellArrayList;
enzArray.add(NeuAc_26_GalNac);
enzArray.add(GlcNac_16_GalNac);
enzArray.add(GlcNac_13_GalNac);
enzArray.add(Gal_13_GlcNac);
enzArray.add(Gal_13_GalNac);
enzArray.add(Fuc_12_Gal);
enzArray.add(Fuc_13_GlcNac);
enzArray.add(NeuAc_23_Gal);
enzArray.add(Gal_14_GlcNac);



%Defining starting substrate
O_Glycan_Root=GlycanSpecies(glycanMLread('Starting_O_Glycan.glycoct_xml'));
substrateArray=CellArrayList;
substrateArray.add(O_Glycan_Root);

[isPath,oglycanpath]=inferGlyForwPath_update4(substrateArray,enzArray);

glycanPathViewer(oglycanpath)
