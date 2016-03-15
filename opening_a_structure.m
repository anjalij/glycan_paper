function [ Glycan ] = opening_a_structure( number )
%opens one of the files in glycan viewer by structure number
%clearvars
close all
number
filename=[num2str(number),'.mat'];
load(filename);
Glycan=glycanStrread(String,'glycoct_xml');
glycanViewer(Glycan)
end

