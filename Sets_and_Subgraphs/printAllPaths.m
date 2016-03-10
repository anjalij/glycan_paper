function [ Paths ] = printAllPaths( Adjacency,maxLen )
%functions takes in a list of edges and prints out all unique paths starting from
%a root. 

Paths={};
New_Paths={};
Old_Paths={};

ends=1;

for m=2:maxLen
    if isempty(ends)
    else
        for i=1:length(ends)
            ends(i)
            indices=find(Adjacency(:,1)==ends(i))
            for j=1:length(indices)
                if isempty(Old_Paths)
                    New_Path={Adjacency(indices(j),2),Adjacency(indices(j),end),m};
                    New_Paths=[New_Paths;New_Path];
                else
                    [Old_Paths{i,1},Adjacency(indices(j),2)]
                    New_Path={[Old_Paths{i,1},Adjacency(indices(j),2)],Adjacency(indices(j),end),m};
                    New_Paths=[New_Paths;New_Path];
                end
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

