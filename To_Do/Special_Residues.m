function [ isMatch, extraEnzs] = Special_Residues( Residue_Set,Glycan )
%takes in a glycan structure and a set of residues, and checks if the
%structure contains only these, or if it also contains others (including anomeric forms of the same structures). Marks
%structure with the specified residues with a 1, and the structure with
%extra residues with a 0 and a list of the residues.


%NOTE if multiple anomer types are permitted a bit of tweaking will be
%needed will need to put the anomeric state in with the linkage info in the
%Residue_List

Glycan_Residues=Glycan.getAllResidues;
extraRes={}
extraEnzs={}

resSet=Residue_Set(:,2)
anSet=Residue_Set(:,3)
noRes=length(Glycan_Residues)

for i=1:noRes
    Residue_name=Glycan_Residues{1,i}.residueType.name;
    %Anomer_type=Glycan_Residues{1,i}.anomer.symbol;
    Residue_Children=Glycan_Residues{1,i}.getChildren;
    if ismember(Residue_name, resSet)
        resIndex=find(strcmp(Residue_name,resSet));
        if isempty(Residue_Set{resIndex,4})
        else
        
                   Possible_Children=Residue_Set{resIndex,4}(:,3);
                   for k=1:length(Residue_Children)
                       Child=Residue_Children(k,1);
                       Child_Type=Child.residueType.name;
                       Parent_Bond=Child.getLinkageParent.bonds.posParent;
                       Anomer_Type=Child.getAnomericState
                       if ismember(Child_Type,Possible_Children)
                           index2=find(strcmp(Child_Type, Possible_Children));
                           possibleBonds=Residue_Set{resIndex,4}(:,1);
                           possibleBonds=cell2mat(possibleBonds(index2));
                           if ismember(Parent_Bond,possibleBonds)
                               %Child_Type
                               %Anomer_Type
                               index_Child=find(strcmp(Child_Type,resSet))
                               %D=anSet(index_Child)
                               if ismember(Anomer_Type,anSet(index_Child))
                                   'yes'
                               else
                                   extra={Residue_name,Parent_Bond,Child_Type,Anomer_Type,Residue_Children(k,1)}
                                   extraEnzs=[extraEnzs;extra]
                               end
                           else
                               extra={Residue_name,Parent_Bond,Child_Type,Anomer_Type,Residue_Children(k,1)};
                               extraEnzs=[extraEnzs;extra];
                           end
                       else
                           extra={Residue_name,Parent_Bond,Child_Type,Anomer_Type,Residue_Children(k,1)};
                           extraEnzs=[extraEnzs;extra];
                       end
                   end
        end
    else
    end
end
if isempty(extraEnzs)
    isMatch=1;
else
    isMatch=0;
end

