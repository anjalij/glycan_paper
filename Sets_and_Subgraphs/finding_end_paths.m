function [ new_paths ] = finding_end_paths( tips,total_paths )

%takes in the set of tips and should find paths that start there from this
%these tips. the one concern I have is that there might be some error. need
%to think about how to systematically check it. some algorithm for checking
%for 1. connectedness of the trees and 2. making sure 

new_paths={};

for i=1:length(total_paths)
    path=total_paths{1,i};
    indices=find(ismember(path,tips));
    min_index=max(indices);
    new_path=path(min_index:end);
    new_paths=[new_paths,new_path];
   
end

end

%Why did I have the min index before?


%{



for i=1:length(total_paths)
    path=total_paths{i};
    indices=find(ismember(path,tips));
    max_index=max(indices);
    new_path={path(max_index:end),mat2str(path(max_index:end))};
    if isempty(new_paths)
        new_paths=[new_paths;new_path];
    else
        if ismember(new_path{1,2},new_paths(:,2))
        else
            new_paths=[new_paths;new_path];
        end
    end
end
new_paths=new_paths(:,1)

end
%}