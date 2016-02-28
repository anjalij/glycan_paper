function [ unique_list ] = eliminate_list_redundancy( list )
%takes in a cell array list of number arrays and produces a unique list.
%but the list has to be vertical concatenation. 
    strings={};
    unique_list={};
for i=1:length(list)
    str=num2str(list{i,1});
    if ismember(str,strings)
    else
        strings=[strings, str];
        unique_list=[unique_list; list(i,:)];
    end
end



end

