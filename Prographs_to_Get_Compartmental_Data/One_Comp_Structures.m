function [ Structures_List,One_Comp_Data ] = One_Comp_Structures( Enzyme_Set,Unique_Subgraphs, Structures_List, One_Comp_Data, FileName)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

fileName=[FileName,'.mat']

%Defining starting substrate
load('Starting_O_Glycan.mat');
O_Glycan_Root=GlycanSpecies(glycanStrread(Starting_O_Glycan_xml,'glycoct_xml'));
substrateArray=CellArrayList;
substrateArray.add(O_Glycan_Root);


number_of_subgraphs=length(Unique_Subgraphs);
for i=177:number_of_subgraphs
    Enzyme_List=Unique_Subgraphs{i};
    num_enzymes=length(Enzyme_List);
    Enzymes_to_Add=cell(1,num_enzymes);
    enzArray=CellArrayList;
    Enzyme_numbers=[];
    for j=1:num_enzymes
        enzyme_number=Enzyme_List(j);
        enzArray.add(Enzyme_Set{enzyme_number});
        Enzymes_to_Add{j}=Enzyme_Set{enzyme_number};
        Enzyme_numbers(j)=enzyme_number;
    end
    load('Structures_Library.mat')
    [isPath,oglycanpath]=inferGlyForwPath_update4(substrateArray,enzArray);
    %glycanPathViewer(oglycanpath)
    One_Comp_Data{i,1}=Enzyme_numbers;
    One_Comp_Data{i,2}=num_enzymes;
    One_Comp_Data{i,3}=length(oglycanpath.theSpecies);
    One_Comp_Data{i,4}=length(oglycanpath.theRxns);
    One_Comp_Data{i,5}=getnResidues(getGlycanStruct(oglycanpath,length(oglycanpath.theSpecies)));
    [ Structures, Structure_nos, Structures_List] = Getting_Structures_from_Pathway( oglycanpath ,Structures_List)
    One_Comp_Data{i,6}=Structures;
    One_Comp_Data{i,7}=Structure_nos;
    save(fileName, 'One_Comp_Data');
    save('Structures_Library.mat','Structures_List')
end
end

