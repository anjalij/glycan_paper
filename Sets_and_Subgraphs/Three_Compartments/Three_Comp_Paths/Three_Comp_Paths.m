%Three Comp Paths
load('Complete_Linkage_Map');
max_len=15;

files=dir('Three_Comp_Organizations')
Files={};
for i=files
    Files=[Files,files.name]
end

for k=15:29
    fid=Files(k);
    load(fid{1});
    FilePath=['Three_Comp_Paths/',fid{1}]
    Three_Comp_Path=Third_Comp_Orgs;
    for i=1:size(Third_Comp_Orgs,1)
        earlyNodes=Third_Comp_Orgs{i,3};
        earlyPaths=Third_Comp_Orgs{i,4};
        if isempty(Third_Comp_Orgs{i,5})
        else
            for j=1:size(Third_Comp_Orgs{i,5},1)
                newEdges=print2Edges(earlyNodes,Third_Comp_Orgs{i,5}{j,1},Complete_Linkage_Map);
                newEdges=unique(newEdges,'rows');
                New_Paths=printNewPaths(earlyPaths,newEdges,max_len);
                mcs = cellfun(@(x)(mat2str(x)),New_Paths(:,1),'uniformoutput',false);
                [uni,idxs]=unique(mcs);
                Three_Comp_Path{i,5}{j,2}=newEdges;
                Three_Comp_Path{i,5}{j,3}=New_Paths(idxs,:);
            end
        end
        save(FilePath,'Three_Comp_Path')
        i
    end
end
