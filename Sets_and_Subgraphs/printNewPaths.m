function [ Paths ] = printNewPaths( firstCompPaths, newEdges,maxLen )
%Takes in a set of paths and ends, and lists all chains from the second
%compartment up until maxLen.

%old paths
Paths=firstCompPaths;
New_Paths={};
Old_Paths=firstCompPaths;


%defining edges to add to

    ends=cell2mat(Old_Paths(:,2));
    for m=2:maxLen
        if isempty(ends)
        else
            for i=1:length(ends)
                ends(i)
                indices=find(newEdges(:,1)==ends(i))
                for j=1:length(indices)
                        j
                        New_Path={[Old_Paths{i,1},newEdges(indices(j),2)],newEdges(indices(j),end),m}
                        New_Paths=[New_Paths;New_Path];
                end
            end
                Paths=[Paths;New_Paths]
                Old_Paths=New_Paths;
                New_Paths={};
                if isempty(Old_Paths)
                    ends=[];
                else
                    ends=cell2mat(Old_Paths(:,2))
                end
        end
    end

end

