function [ final_list ] = must_contain_elements( list, must_contain )
%takes in a list (cell array) of sets, and a set of nodes that must be contained. if
%there is no overlap, then the set is not included in the list

noSets=length(list);
final_list={};
for i=1:noSets
    if isempty(intersect(list{i,1},must_contain))
    else
        final_list=[final_list; list(i,:)];
    end
    

end

