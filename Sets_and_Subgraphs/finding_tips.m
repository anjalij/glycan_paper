function [ new_tips ] = finding_tips( subgraph,linkage_map )
%this takes a set of nodes on a larger graph and finds the tip nodes that
%will be able to add to the subgraph

links_to_be_added=[];

for j=1:size(linkage_map,1)
        if ismember(linkage_map(j,2),subgraph)
        else
            if ismember(linkage_map(j,1),[subgraph,1])
               links_to_be_added=[links_to_be_added;linkage_map(j,2)];
               %before I had a linkage_map(j,:)...dont know why I put that
               %in...
            end
        end
end


new_tips=unique(links_to_be_added);


end

%{

links_to_be_added=[];

for j=1:size(linkage_map,1)
        if ismember(linkage_map(j,2),subgraph)
        else
            if ismember(linkage_map(j,1),[subgraph,1])
               links_to_be_added=[links_to_be_added;linkage_map(j,:)];
            end
        end
end


new_tips=unique(links_to_be_added(:,2));


end

%}