clear vars
%I just used this to make the different subgraph maps and the enzyme set
%list


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

Enzyme_Set{2}=Gal_13_GalNac;
Enzyme_Set{3}=GlcNac_13_GalNac;
Enzyme_Set{4}=GlcNac_16_GalNac;
Enzyme_Set{5}=NeuAc_26_GalNac;
Enzyme_Set{6}=Fuc_13_GlcNac;
Enzyme_Set{7}=Gal_13_GlcNac;
Enzyme_Set{8}=Gal_14_GlcNac;
Enzyme_Set{9}=Fuc_12_Gal;
Enzyme_Set{10}=NeuAc_23_Gal;
Enzyme_Set{11}=GlcNac_13_Gal;
Enzyme_Set{12}=GlcNac_16_Gal;


%Gal Paths
Path1=[10,7,3];
Path2=[10,7,4];
Path3=[9,8,4];
Path4=[9,8,3];
Path5=[10,8,3];
Path6=[10,8,4];
Path7=[9,7,3];
Path8=[9,7,4];
Path9=[9,2];
Path10=[10,2];
Path11=[8,4];
Path12=[7,4];
Path13=[8,3];
Path14=[7,3];
Path15=[6,4];
Path16=[6,3];
Path17=[2];
Path18=[3];
Path19=[4];
Path20=[5];

%reversing the order makes it easier to 
Path1=fliplr(Path1);
Path2=fliplr(Path2);
Path3=fliplr(Path3);
Path4=fliplr(Path4);
Path5=fliplr(Path5);
Path6=fliplr(Path6);
Path7=fliplr(Path7);
Path8=fliplr(Path8);
Path9=fliplr(Path9);
Path10=fliplr(Path10);
Path11=fliplr(Path11);
Path12=fliplr(Path12);
Path13=fliplr(Path13);
Path14=fliplr(Path14);
Path15=fliplr(Path15);
Path16=fliplr(Path16);
Path17=fliplr(Path17);
Path18=fliplr(Path18);


%GlcNac_Paths
Path2_1=[6,11,2];
Path2_2=[6,12,2];
Path2_3=[9,2];
Path2_4=[10,2];
Path2_5=[11,2];
Path2_6=[12,2];
Path2_7=[6,3];
Path2_8=[6,4];
Path2_9=[2];
Path2_10=[3];
Path2_11=[4];
Path2_12=[5];

Path2_1=fliplr(Path2_1);
Path2_2=fliplr(Path2_2);
Path2_3=fliplr(Path2_3);
Path2_4=fliplr(Path2_4);
Path2_5=fliplr(Path2_5);
Path2_6=fliplr(Path2_6);
Path2_7=fliplr(Path2_7);
Path2_8=fliplr(Path2_8);
Path2_9=fliplr(Path2_9);
Path2_10=fliplr(Path2_10);
Path2_11=fliplr(Path2_11);
Path2_12=fliplr(Path2_12);


%Defining starting substrate
O_Glycan_Root=GlycanSpecies(glycanMLread('Starting_O_Glycan.glycoct_xml'));
substrateArray=CellArrayList;
substrateArray.add(O_Glycan_Root);

%All Paths for Gal DAG
Gal_Paths={Path1, Path2, Path3, Path4, Path5, Path6, Path7, Path8, Path9, Path10, Path11, Path12, Path13, Path14, Path15, Path16, Path17, Path18, Path19, Path20};
[Gal_Subgraphs,Str_Gal]=All_Subsets_of_Sets(Gal_Paths);


%All Paths for GlcNac DAG
GlcNac_Paths={Path2_1, Path2_2, Path2_3, Path2_4, Path2_5, Path2_6, Path2_7, Path2_8, Path2_9, Path2_10, Path2_11, Path2_12};
[GlcNac_Subgraphs,Str_GlcNac]=All_Subsets_of_Sets(GlcNac_Paths);
length(GlcNac_Subgraphs)
length(Gal_Subgraphs)

Common_Subgraphs={};
Unique_Gal_Subgraphs={};
Unique_GlcNac_Subgraphs={};
Gal_indices_to_remove=[];
GlcNac_indices_to_remove=[];
Str_Common={};

for i=1:length(Str_Gal)
    for j=1:length(Str_GlcNac)
        if isequal(Str_Gal{i,1},Str_GlcNac{j,1})  
            Str_Common=[Str_Common,Str_Gal{i,1}];
            Gal_indices_to_remove=[Gal_indices_to_remove,i];
            GlcNac_indices_to_remove=[GlcNac_indices_to_remove,j];
        end
    end
end

Str_Gal(Gal_indices_to_remove)=[];
for i=1:length(Str_Gal)
    Unique_Gal_Subgraphs=[Unique_Gal_Subgraphs, str2num(Str_Gal{i})];
end

Str_GlcNac(GlcNac_indices_to_remove)=[];
for i=1:length(Str_GlcNac)
    Unique_GlcNac_Subgraphs=[Unique_GlcNac_Subgraphs, str2num(Str_GlcNac{i})];
end

for i=1:length(Str_Common)
    Common_Subgraphs=[Common_Subgraphs, str2num(Str_Common{i})];
end

common=length(Common_Subgraphs);
Gal_Sub=length(Unique_Gal_Subgraphs);
GlcNac_Sub=length(Unique_GlcNac_Subgraphs);