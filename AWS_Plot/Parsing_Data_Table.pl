#!/usr/bin/perl

open F1, "<Applications/MATLAB/R2014a/toolbox/GNAT/AWS_Plot/Gal_Data.txt" or die;
open F2, ">Applications/MATLAB/R2014a/toolbox/GNAT/AWS_Plot/Gal_Data_3.txt" or die;

#my $str = 'abc 123 x456xy 789foo';

#my ($first_num) = $str =~ /(\d+)/;   # 123
#my @all_nums    = $str =~ /(\d+)/g;  # (123, 456, 789)


while($line=<F1>){
	my $str=$line;
	my ($digits) = $str =~ /(\d+)/g;
	my @all_nums= $str =~ /(\d+)/g;
	print F2 "$all_nums[1] $all_nums[3] $all_nums[4] $all_nums[5] $all_nums[6]\n";		
	#print F2 "$all_nums[1]\t$all_nums[3]\t$all_nums[4]\t$all_nums[5]\t$all_nums[6]\n";	
	}

