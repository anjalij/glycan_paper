function [ two_comp_organization ] = two_compartments( all_first_c_subtrees,all_second_c_paths,complete_graph)
%takes in all the non-polymerizing subtrees that compose a simple
%compartment organization (e.g. Gal or GlcNac or Common subtrees). Then it
%takes in all of the paths from a second non-polymerizing DAG (e.g. Gal or
%GlcNac or Common), and constructs all possible two compartment
%organizations. 

two_comp_organization={};

for i=1:length(all_first_c_subtrees)
    second_comp={};
    subgraph=all_first_c_subtrees{i};
    tips=finding_tips(subgraph,complete_graph);
    new_paths=finding_end_paths(tips,all_second_c_paths);
    [All_Subsets,Str_Subsets]=All_Subsets_of_Sets(new_paths);        
    two_comp_organization{i,1}=subgraph;
    two_comp_organization{i,2}=All_Subsets;
    %for j=1:length(All_Subsets)
    %    second_comp{j,1}=subgraph;
    %    second_comp{j,2}=All_Subsets{j};
    %end
    %two_comp_organization=[two_comp_organization;second_comp];
end

