%three compartments

clearvars

%Two Compartment organization
load('U_Gal_Gal');
load('GlcNac_Paths');
Third_Comp_Paths=GlcNac_Paths;

    load('Complete_Linkage_Map');
    Third_Comp_Orgs=;

    no2cells=length(Two_Comp_Unravelled);
    for i=1:no2cells
    %for i=1
        total_nodes=Two_Comp_Unravelled{i,3};
        tips=finding_tips(total_nodes,Complete_Linkage_Map);
        new_paths=finding_end_paths(tips,Third_Comp_Paths);
        [All_Subsets,Str_Subsets]=All_Subsets_of_Sets(new_paths);   
         Third_Comp_Orgs{i,1}=Two_Comp_Unravelled{i,1};
            Third_Comp_Orgs{i,2}=Two_Comp_Unravelled{i,2};
            Third_Comp_Orgs{i,3}=All_Subsets;
    end
    
save('Gal_Gal_GlcNac.mat','Third_Comp_Orgs')
