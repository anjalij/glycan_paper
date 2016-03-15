
files=dir('Three_Comp_Paths')
Files={};
for i=files
    Files=[Files,files.name]
end

for k=3:length(Files)
    fid=Files(k);
    load(fid{1});
    FilePath=['Three_Comp_Paths_All/',fid{1}];
    nocells=0;
    Three_Comp_Unravelled={};
    for i=1:size(Three_Comp_Path,1)
        if isempty(Three_Comp_Path{i,5})
        else
            for j=1:size(Three_Comp_Path{i,5},1)
                    nocells=nocells+1;
                    Three_Comp_Unravelled{nocells,1}=Three_Comp_Path{i,1};
                    Three_Comp_Unravelled{nocells,2}=Three_Comp_Path{i,2};
                    Three_Comp_Unravelled{nocells,3}=Three_Comp_Path{i,5}{j,1};
                    Three_Comp_Unravelled{nocells,4}=Three_Comp_Path{i,5}{j,3};
            end
        end
    end
    i
    save(FilePath,'Three_Comp_Path')
end