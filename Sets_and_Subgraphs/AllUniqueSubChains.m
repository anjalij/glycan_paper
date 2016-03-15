function [ All_Chains,New_Chains ] = AllUniqueSubChains( ChainSet )
%Takes a set of maximal paths in a directed rooted graph and finds all
%unique paths. (subchains)

noChains=size(ChainSet,1);
All_Chains=ChainSet;
New_Chains={};
for i=1:noChains
    Chain=ChainSet{i,1};
    len=length(Chain)
    for j=1:len-1
        New_Chains=[New_Chains;Chain(1:j)];
    end
end

All_Chains=[All_Chains;New_Chains];
mcs = cellfun(@(x)(mat2str(x)),All_Chains(:,1),'uniformoutput',false);
[uni,idxs]=unique(mcs);
All_Chains=All_Chains(idxs,:);
