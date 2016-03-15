
nocells=0;
Two_Comp_Unravelled={};
for i=1:size(Two_Comp_Path,1)
    if isempty(Two_Comp_Path{i,2})
    else
        for j=1:size(Two_Comp_Path{i,2},1)
                nocells=nocells+1;
                Two_Comp_Unravelled{nocells,1}=Two_Comp_Path{i,1};
                Two_Comp_Unravelled{nocells,2}=Two_Comp_Path{i,2}{j,1};
                Two_Comp_Unravelled{nocells,3}=unique([Two_Comp_Path{i,1},Two_Comp_Path{i,2}{j,1}]);
                Two_Comp_Unravelled(nocells,4:5)=Two_Comp_Path{i,2}(j,3:4);
        end
    end
end
        