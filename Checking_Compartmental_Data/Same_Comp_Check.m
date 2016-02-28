% Identical_Comp_Check checks to see that the two compartment structures
% match with one of the one compartment structures.

%A=Two_Comp_Data;
%B=One_Comp_Data;
counter=0
for i=1:size(A,1)
    for j=1:size(A{i,2},1);
        A{i,2}{j,1};
        enzymes=[A{i,1},A{i,2}{j,1}];
        enzymes=sort(enzymes);
        
        if ismember([3,4,6],enzymes)
        else
            for k=1:size(One_Comp_Common_Data,1)
                if isequal(enzymes, One_Comp_Common_Data{k,1})
                    if isequal(A{i,2}{j,4},One_Comp_Common_Data{k,3})
                    else
                        k
                        i
                        j
                    end
                end
            end
        end
    end
end

  