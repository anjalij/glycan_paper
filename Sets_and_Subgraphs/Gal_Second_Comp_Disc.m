clearvars
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

%Gal Paths that can be added after glcNac without drawing from the root. 
%Paths that involve GlcNac



PathA_1=[10,7];
PathA_2=[9,8];
PathA_3=[10,8];
PathA_4=[9,7];
PathA_5=[8];
PathA_6=[7];
Gal_Containing_Paths={PathA_1,PathA_2,PathA_3,PathA_4, PathA_5, PathA_6};
[Subgraphs_1,Str_1]=All_Subsets_of_Sets(Gal_Containing_Paths);

%Paths that do not involve GlcNac
PathA_7=[9,2];
PathA_8=[10,2];
PathA_9=[6];
PathA_10=[2];
PathA_11=[5];
nonGal_Containing_Paths={PathA_7,PathA_8, PathA_9, PathA_10, PathA_11};
[Subgraphs_2,Str_2]=All_Subsets_of_Sets(nonGal_Containing_Paths);

num_comps=length(Subgraphs_1)*length(Subgraphs_2);
galComp2=cell(num_comps,1);
index=0;
for i=1:length(Subgraphs_1)
    set1=Subgraphs_1{i};
    for j=1:length(Subgraphs_2)
        index=index+1;
        set2=[set1,Subgraphs_2{j}];
        %galComp2{index,1}=set2
        galComp2{index,1}=num2str(set2);
    end
end

galComp2=unique(galComp2)
for k=1:length(galComp2)
    galComp2{k}
%Discountinuous Second Compartment Orgs. These will not be covered by the
%Gal subtrees because they are not rooted. They are meant to be used in a
%GlcNac 1st compartment set-up.

