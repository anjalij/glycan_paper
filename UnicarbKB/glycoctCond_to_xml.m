i=9999;
while i<20000;
    i
    Cond_filename=strcat('Structure_',num2str(i),'.glycoctCond');
    fileID=fopen(Cond_filename);
    if fileID~=-1;
        xml_filename=strcat('Structure_',num2str(i),'.glycoct_xml');
        glycoctcond2Glycoct(Cond_filename,xml_filename);
        i=i+1;
    else
        i=i+1;
    end
end