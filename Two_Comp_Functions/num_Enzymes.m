function [ Graphing_Data ] = num_Enzymes( Two_Comp_Org_Data )
%counts the number of enzymes by their adders and by their total number
%across both compartments
Graphing_Data=Two_Comp_Org_Data;
noCells=size(Two_Comp_Org_Data,1)

for i=1:noCells
    First_Comp=Two_Comp_Org_Data{i,1}
    SecondCompSet=Two_Comp_Org_Data{i,2}
    i
    noSecondComp=size(SecondCompSet,1)
    for j=1:noSecondComp
        noSecondComp
        Second_Comp=SecondCompSet{j,1}
        ending=size(SecondCompSet(j,:),2)

        noEnz=length([First_Comp,Second_Comp])
        noEnzType=length(unique([First_Comp,Second_Comp]))
        
        Graphing_Data{i,2}{j,ending+1}=noEnz
        Graphing_Data{i,2}{j,ending+2}=noEnzType
    end
end



end

