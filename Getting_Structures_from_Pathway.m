function [ Structures, Structure_nos, Structures_List_New ] = Getting_Structures_from_Pathway( oglycanpath ,Structures_List)
%Takes in an oglycan path and extracts the structures, if they do not exist
%in my database, adds them to the Structures_List and writes to an xml file

no_Species=length(oglycanpath.theSpecies.list);
    Structure_nos=[];
    Structures={};
    Structures_List_New=Structures_List;
    for j=1:no_Species
       if isempty(oglycanpath.theSpecies.list{j,1})
       else
       Glycan=oglycanpath.theSpecies.list{j,1}.glycanStruct;
       [rindex,cindex]=find(strcmp(Structures_List(:,2),Glycan.name));
       %Structures=length(Structures_List)
       if isempty(rindex)
           new_index=length(Structures_List_New)+1;
           Glycan.number=new_index;
           Structures{j,1}=Glycan.number;
           Structures{j,2}=Glycan.name;
           Structures_List_New{new_index,2}=Glycan.name;
           Structures_List_New{new_index,1}=Glycan.number;
           savefile=[num2str(Glycan.number),'.mat'];
           String=[];
           String=glycanStrwrite(Glycan,'glycoct_xml');
           save(savefile,'String');
           save('Structure_Library.mat','Structures_List');
           Structure_nos=[Structure_nos,Glycan.number];
       else
           Glycan.number=cell2mat(Structures_List(rindex,1));
           Structures{j,1}=Glycan.number;
           Structures{j,2}=Glycan.name;
           Structure_nos=[Structure_nos,Glycan.number];
       end
       end
    end
    Structure_nos=sort(Structure_nos);

end

