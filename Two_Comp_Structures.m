%this script should assemble all the two compartment systems and record the
%structures


load('Enzyme_Set.mat')
%load('Structure_Library.mat')
%load('One_Comp_Common.mat')
%load('One_Comp_GlcNac_Data.mat')
%load('One_Comp_Gal_Data.mat')

%Common_Common
load('Common_Common_Final_2.mat')
tic
Two_Compartment_Structures(One_Comp_Common_Data, Common_Common_Final, Structures_List, Enzyme_Set, 'Common_Common_Data_New')
toc

%Common_Gal
load('Common_Gal_Final_2.mat')
%Two_Compartment_Structures( One_Comp_Common, Common_Gal_Final, Structures_List, Enzyme_Set, 'Common_Gal_Data')

%Common-GlcNac
load('Common_GlcNac_Final_2.mat')
%Two_Compartment_Structures( One_Comp_Common_Data, Common_GlcNac_Final, Structures_List, Enzyme_Set, 'Common_GlcNac_Data')

%GlcNac-Common
load('GlcNac_Common_Final_2.mat')
%Two_Compartment_Structures( One_Comp_GlcNac_Data, GlcNac_Common_Final, Structures_List, Enzyme_Set, 'GlcNac_Common_Data')

%GlcNac_Gal
load('GlcNac_GlcNac_Final_2.mat')
%Two_Compartment_Structures( One_Comp_GlcNac_Data, GlcNac_GlcNac_Final, Structures_List, Enzyme_Set, 'GlcNac_GlcNac_Data')

%GlcNac_GlcNac
load('GlcNac_Gal_Final_2.mat')
%Two_Compartment_Structures( One_Comp_GlcNac_Data, GlcNac_Gal_Final, Structures_List, Enzyme_Set, 'GlcNac_Gal_Data')

%Gal_Common
load('Gal_Common_Final_2.mat')
%Two_Compartment_Structures( One_Comp_Gal_Data, Gal_Common_Final, Structures_List, Enzyme_Set, 'Gal_Common_Data')

%Gal_GlcNac
load('Gal_GlcNac_Final_2.mat')
%Two_Compartment_Structures( One_Comp_Gal_Data, Gal_GlcNac_Final, Structures_List, Enzyme_Set, 'Gal_GlcNac_Data')

%Gal_Gal
load('Gal_Gal_Final_2.mat')
%Two_Compartment_Structures( One_Comp_Gal_Data, Gal_Gal_Final, Structures_List, Enzyme_Set, 'Gal_Gal_Data')


%check for Common_Common
%{
for i=1:size(A,1)
    for j=1:size(A{i,2},1);
        A{i,2}{j,1};
        enzymes=[A{i,1},A{i,2}{j,1}];
        enzymes=sort(enzymes);
        
        if ismember([3,4,6],enzymes)
        else
            for k=1:size(One_Comp_Common_Data,1)
                if isequal(enzymes, One_Comp_Common_Data{k,1})
                    if isequal(A{i,2}{j,4},One_Comp_Common_Data{k,3})
                    else
                        k
                        i
                        j
                    end
                end
            end
        end
    end
end

%}                