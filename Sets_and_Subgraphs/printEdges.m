function [ Edge_List ] = printEdges( Nodes, Adjacency_List )
%Takes in a list of all the possible edges anda  subset of nodes, to print
%out the relevant edges.
Edge_List=[];
%for i=1:length(Nodes)
    B=ismember(Adjacency_List,intersect(Adjacency_List,[Nodes,1]));
    indices=find(B(:,1)+B(:,2)==2)
    Edge_List=Adjacency_List(indices,:);


end

