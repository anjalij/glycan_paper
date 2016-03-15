%pulling out the human references
clearvars

load('Ref_Data_Library.mat')
human_data={}
for i=1:size(Ref_Data_Library,1)
    if strfind(Ref_Data_Library{i,1},'human')
       human_data=[human_data; Ref_Data_Library(i,:)]
    end
end
