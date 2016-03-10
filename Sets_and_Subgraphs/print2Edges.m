function [ Edge_List ] = print2Edges( Nodes1,Nodes2, Adjacency_List )
%Takes in a list of the nodes from the first compartment and a list from
%the second compartment and finds the edges that can be between the two
%compartments. 
Edge_List=[];

    B=ismember(Adjacency_List(:,1),intersect(Adjacency_List,[Nodes1]))
    C=ismember(Adjacency_List(:,2),intersect(Adjacency_List,[Nodes2]))
    indices=find(B+C==2)
    Edge_List=Adjacency_List(indices,:);



end

