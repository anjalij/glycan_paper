function [ Extra_Linkages ] = Check_Linkages( Linkage_Set, Glycan_Struct )
%Want to have a set of possible linkages, and check if structure has only
%these links....

%first check to see if the root is GalNac

%check each residue link with it's parent
% is it alpha or beta correctly
% is it one of the allowed bonds

%Enzymes
%{
%Enzyme2: Gal-1,3 GalNac
Gal_13_GalNac=GTEnz;
Gal_13_GalNac.resAtt2FG=GalNacResidue;
Gal_13_GalNac.resfuncgroup=GalResidue;
Gal_13_GalNac.linkFG=struct('bond',Bond_1_3, 'anomer','b');
Gal_13_GalNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');
Gal_13_GalNac.name='2';

%Enzyme3:GlcNac-1,3 GalNac
GlcNac_13_GalNac=GTEnz;
GlcNac_13_GalNac.resAtt2FG=GalNacResidue;
GlcNac_13_GalNac.resfuncgroup=GlcNacResidue;
GlcNac_13_GalNac.linkFG=struct('bond',Bond_1_3, 'anomer','b');
GlcNac_13_GalNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');
GlcNac_13_GalNac.name='3';

%Enzyme4:GlcNac-1,6,GalNac
GlcNac_16_GalNac=GTEnz;
GlcNac_16_GalNac.resAtt2FG=GalNacResidue;
GlcNac_16_GalNac.resfuncgroup=GlcNacResidue;
GlcNac_16_GalNac.linkFG=struct('bond',Bond_1_6, 'anomer','b');
GlcNac_16_GalNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');
GlcNac_16_GalNac.name='4';

%Enzyme5:NeuAC-1,6,GalNac
NeuAc_26_GalNac=GTEnz;
NeuAc_26_GalNac.resAtt2FG=GalNacResidue;
NeuAc_26_GalNac.resfuncgroup=NeuAcResidue;
NeuAc_26_GalNac.linkFG=struct('bond',Bond_2_6, 'anomer','b');
NeuAc_26_GalNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');
NeuAc_26_GalNac.name='5';

%Enzyme6: Fuc 1,3 GlcNac
Fuc_13_GlcNac=GTEnz;
Fuc_13_GlcNac.resAtt2FG=GlcNacResidue;
Fuc_13_GlcNac.resfuncgroup=FucResidue;
Fuc_13_GlcNac.linkFG=struct('bond',Bond_1_3,'anomer','a');
Fuc_13_GlcNac.linkresAtt2FG=struct('bond',AcceptorBond,'anomer','b');
Fuc_13_GlcNac.name='6';

%Enzyme7:Gal-1,3 GlcNac
Gal_13_GlcNac=GTEnz;
Gal_13_GlcNac.resAtt2FG=GlcNacResidue;
Gal_13_GlcNac.resfuncgroup=GalResidue;
Gal_13_GlcNac.linkFG=struct('bond',Bond_1_3, 'anomer','b');
Gal_13_GlcNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');
Gal_13_GlcNac.name='7';

%Enzyme8:Gal 1,4 GlcNAc
Gal_14_GlcNac=GTEnz;
Gal_14_GlcNac.resAtt2FG=GlcNacResidue;
Gal_14_GlcNac.resfuncgroup=GalResidue;
Gal_14_GlcNac.linkFG=struct('bond',Bond_1_4, 'anomer','b');
Gal_14_GlcNac.linkresAtt2FG=struct('bond',AcceptorBond, 'anomer','b');
Gal_14_GlcNac.name='8';

%Enzyme9: Fuc-1-2, Gal
Fuc_12_Gal=GTEnz;
Fuc_12_Gal.resAtt2FG=GalResidue;
Fuc_12_Gal.resfuncgroup=FucResidue;
Fuc_12_Gal.linkFG=struct('bond',Bond_1_2, 'anomer','a');
Fuc_12_Gal.linkresAtt2FG=struct('bond',AcceptorBond,'anomer','b');
Fuc_12_Gal.name='9';

%Enzyme10: NeuAc 2,3 Gal
NeuAc_23_Gal=GTEnz;
NeuAc_23_Gal.resAtt2FG=GalResidue;
NeuAc_23_Gal.resfuncgroup=NeuAcResidue;
NeuAc_23_Gal.linkFG=struct('bond',Bond_2_3,'anomer','a');
NeuAc_23_Gal.linkresAtt2FG=struct('bond',AcceptorBond,'anomer','b');
NeuAc_23_Gal.name='10';

%Enzyme11:GlcNac_13_Gal
GlcNac_13_Gal=GTEnz;
GlcNac_13_Gal.resAtt2FG=GalResidue;
GlcNac_13_Gal.resfuncgroup=GlcNacResidue;
GlcNac_13_Gal.linkFG=struct('bond',Bond_1_3,'anomer','b');
GlcNac_13_Gal.linkresAtt2FG=struct('bond',AcceptorBond,'anomer','b');
GlcNac_13_Gal.name='11';

%Enzyme12:GlcNac_16_Gal
GlcNac_16_Gal=GTEnz;
GlcNac_16_Gal.resAtt2FG=GalResidue;
GlcNac_16_Gal.resfuncgroup=GlcNacResidue;
GlcNac_16_Gal.linkFG=struct('bond',Bond_1_6,'anomer','b');
GlcNac_16_Gal.linkresAtt2FG=struct('bond',AcceptorBond,'anomer','b');
GlcNac_16_Gal.name='12';

%}
end

