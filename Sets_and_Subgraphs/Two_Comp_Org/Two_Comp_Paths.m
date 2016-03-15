clearvars


load('Complete_Linkage_Map')

load('Common_Common_Final_2');
load('One_Comp_Common_Paths');
Two_Comp_Path=Common_Common_Final;
One_Comp_Paths=One_Comp_Common_Paths;

max_len=10;
lens=[];
for i=1:size(Two_Comp_Path,1)
    for j=1:size(Two_Comp_Path{i,2},1)
        Two_Comp_Path{i,2}{j,3}=print2Edges(Two_Comp_Path{i,1},Two_Comp_Path{i,2}{j,1},Complete_Linkage_Map);
        New_Paths=printNewPaths(One_Comp_Paths{i,3},Two_Comp_Path{i,2}{j,3},max_len);
        mcs = cellfun(@(x)(mat2str(x)),New_Paths(:,1),'uniformoutput',false);
        [uni,idxs]=unique(mcs);
        Two_Comp_Path{i,2}{j,4}=New_Paths(idxs,:);
        Two_Comp_Path{i,2}{j,5}=New_Paths;
        lens=[lens,length(New_Paths(idxs,:))];
    end
end

lens=max(lens)