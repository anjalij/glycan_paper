%Makes the two compartment paths

load('Common_Common_Final_2');
load('Complete_Linkage_Map');
load('One_Comp_Common_Paths');

FirstCompPaths=One_Comp_Common_Paths;
FirstComp=Common_Common_Final;
Two_Comp_Paths=Common_Common_Final;
max_Len=10;

noFirstComp=size(FirstComp,1);

for i=1:noFirstComp
    noSecondComp=size(FirstComp{i,2},1)
    Nodes1=FirstComp{i,1};
    Paths=FirstCompPaths{i,3};
    if isempty(FirstComp{i,2})
        i
    else
        for j=1:noSecondComp
            Nodes2=FirstComp{i,2}{j,1};
            Adjacency=print2Edges(Nodes1,Nodes2,Complete_Linkage_Map);
            Paths=printNewPaths(Paths,Adjacency,max_Len);
            Two_Comp_Paths{i,2}{j,3}=Adjacency
            Two_Comp_Paths{i,2}{j,4}=Paths;
        end
        
    end
end