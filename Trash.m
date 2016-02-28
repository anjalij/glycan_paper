function [ Data ] = Trash( One_Comp_Data, Two_Comp_Orgs, Structures_List, Enzyme_Set,name)
%Takes in one compartment data and all possible two compartment
%organizations (gal-gal/gal-glcnac etc) and spits out the second
%compartment pathway/structures

[same_order,index]=Check_Same_Ordering(One_Comp_Data(:,1),Two_Comp_Orgs(:,1));
Data=Two_Comp_Orgs;
               
if same_order==1
    for i=3:69
        if isempty(Two_Comp_Orgs{i,2})
            ans='no second'
        else
            First_Comp_Struct_List={};
            First_Comp_Struct_List=One_Comp_Data{i,7};
            substrateArray=CellArrayList;
            
            for j=1:length(First_Comp_Struct_List)
                Structure_no=First_Comp_Struct_List(j);
                filename=[num2str(Structure_no),'.mat'];
                load(filename);
                glycan=glycanStrread(String,'glycoct_xml');
                glycan=GlycanSpecies(glycan);
                substrateArray.add(glycan);
            end

            Second_Compartments=Two_Comp_Orgs{i,2};
            noSecondComp=size(Second_Compartments,1);
            for k=1:noSecondComp
                Second_Comp_Struct={};
                Structure_nos=[];
                Second_Comp_Enz_List=Second_Compartments{k}
                noEnzymes=length(Second_Comp_Enz_List)
                enzArray=CellArrayList;
                for m=1:noEnzymes
                    enzyme=Enzyme_Set{Second_Comp_Enz_List(m)}
                    enzArray.add(enzyme);
                end
                [isPath,oglycanpath]=inferGlyForwPath_update4(substrateArray,enzArray);
                [Second_Comp_Struct, Structure_nos]=Getting_Structures_from_Pathway(oglycanpath, Structures_List);
                Structure_nos=sort(Structure_nos);
                Data{i,2}{k,3}=Second_Comp_Struct;
                Data{i,2}{k,4}=Structure_nos;
                Data{i,2}{k,5}=length(oglycanpath.theSpecies);
                Data{i,2}{k,6}=length(oglycanpath.theRxns);
                Data{i,2}{k,7}=length(oglycanpath.theEnzs);
                Data{i,2}{k,8}=getnResidues(getGlycanStruct(oglycanpath,length(oglycanpath.theSpecies)));
                save(name,'Data');
                save('Structures_Library.mat','Structures_List');
            end
        end
    end
else
    Data='not same order'
    index
end
