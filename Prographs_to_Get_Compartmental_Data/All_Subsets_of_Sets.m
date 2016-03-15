function [ All_Subgraphs,Str_Subgraphs ] = All_Subsets_of_Sets(All_Paths)
%This function takes a set of sets, and generates all unique unions of sets 
%(thus it is all organizations with unique sets of elements). 
%It is supposed to take a set of paths in a rooted DAG and
%produce all unique subgraphs.

length_All_Paths=length(All_Paths);
All_Subgraphs={};
Str_Subgraphs={};

for i=1:length_All_Paths
        All_Subgraphs=[All_Subgraphs;All_Paths{i}];
        New_Subgraphs={All_Paths{i}};
        Str_Subgraphs=[Str_Subgraphs; mat2str(All_Paths{i})];
        index=i+1;
        for j=index:length_All_Paths
            num_graphs=length(New_Subgraphs);
            for k=1:num_graphs
                New_Path=[];
                if length(New_Subgraphs{k})<=length(All_Paths{j})
                    New_Path=[New_Subgraphs{k},All_Paths{j}];
                    New_Path=unique(sort(New_Path));
                    Str_Path=mat2str(New_Path);
                    if ismember(Str_Path,Str_Subgraphs)
                    else
                        New_Subgraphs=[New_Subgraphs;New_Path];
                        All_Subgraphs=[All_Subgraphs;New_Path];
                        Str_Subgraphs=[Str_Subgraphs;Str_Path];
                    end
                else
                    if isequal(all(ismember(New_Subgraphs{k},All_Paths{j})),1)
                    else
                        New_Path=[New_Subgraphs{k},All_Paths{j}];
                        New_Path=unique(sort(New_Path));
                        Str_Path=mat2str(New_Path);
                         if ismember(Str_Path,Str_Subgraphs);
                         else
                            New_Subgraphs=[New_Subgraphs;New_Path];
                            All_Subgraphs=[All_Subgraphs;New_Path];
                            Str_Subgraphs=[Str_Subgraphs;Str_Path];
                         end
                    end
                end
            end
        end
end
%length(All_Subgraphs)
%A={};
%for i=1:length(All_Subgraphs)
%    A{i,1}=mat2str(All_Subgraphs{i});
%end
%A
%A=unique(A)
Str_Subgraphs=sort(Str_Subgraphs);

end

