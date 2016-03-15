function [ Edge_List ] = print2Edges( Nodes1,Nodes2, Adjacency_List )
%Takes in a list of the nodes from the first compartment and a list from
%the second compartment and finds the edges that can be between the two
%compartments. 
Edge_List=[];
    %edges between first comp and second comp
    B=ismember(Adjacency_List(:,1),intersect(Adjacency_List,[Nodes1,1]));
    C=ismember(Adjacency_List(:,2),intersect(Adjacency_List,[Nodes2,1]));
    indices=find(B+C==2);
    
    %new edges in second comp
    B=ismember(Adjacency_List,intersect(Adjacency_List,[Nodes2,1]));
    find(sum(B,2)==2);
    indices=[indices; find(sum(B,2)==2)];
    Edge_List=Adjacency_List(indices,:);

end

