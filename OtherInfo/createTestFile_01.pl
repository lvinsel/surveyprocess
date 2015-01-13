########################
# CreateTestFile_01 20110728
#
#	for creating a test ASCII file to test Proess against the surrent codes and Checkin and Process
########################

#####################
# Some Global Vars
$northing="100000.000";
$easting0="1025.000";
$easting1="1050.000";
$easting2="1075.000";
$easting3="1100.000";
$easting4="1125.000";
$ptNum="1";
$elevation="100";
%activeStrings=();
$curIsString=0;
$lastWasString=0;
$$rawCode=""; #lv added
$codeWithLineOne="";

#####################


##########################################################################################################
###################################################################################################
####################################### Start of Main Program
if ($#ARGV<0) {
	die "Syntax:\nperl fbk.pl <input file name> <start ptnum for new pts>\n";
}
$fname=$ARGV[0];
$fname =~ s/\.[^.]*$//;
open(IN,$ARGV[0]);
open(OUT1,">${fname}_test.txt");

if ($#ARGV>0) {
	$_nextAutogenPtNum=$ARGV[1];
}
else {
	$_nextAutogenPtNum=100000;
}
while (<IN>) {
#	$curIsString=0;
#	print OUT1 "variable 	=	$_";
	my $rawCode = $_;
	chomp ($rawCode);
#	print OUT1 "rawCode = $rawCode\n";
	my $one = '1';
	my $two = '2';
	$codeWithLineOne="${rawCode}${one}";
#	print OUT1 "codeWithLineOne=$codeWithLineOne\n";
	my ($codeWithLineTwo) = "${rawCode}${two}";
#	print OUT1 "codeWithLineTwo=$codeWithLineTwo\n";
	my ($codeStartLineOne) = "${codeWithLineOne}.";
#	print OUT1 "codeStartLineOne=$codeStartLineOne\n";
	my ($codeStartLineTwo) = "${codeWithLineTwo}.";
#	print OUT1 "codeStartLineTwo=$codeStartLineTwo\n";

print OUT1 "$ptNum,$northing,$easting0,$elevation,$codeStartLineOne $rawCode\n";
#	increment point number
	$ptNum = $ptNum + 1;
#	increment elevation
	$elevation = $elevation + 1;
print OUT1 "$ptNum,$northing,$easting1,$elevation,$codeWithLineOne $rawCode\n";
#	increment point number
	$ptNum = $ptNum + 1;
#	increment elevation
	$elevation = $elevation + 1;
print OUT1 "$ptNum,$northing,$easting2,$elevation,$codeWithLineOne $rawCode\n";
#	increment point number
	$ptNum = $ptNum + 1;
#	increment elevation
	$elevation = $elevation + 1;
print OUT1 "$ptNum,$northing,$easting3,$elevation,$codeWithLineOne $rawCode\n";
#	increment point number
	$ptNum = $ptNum + 1;
#	increment elevation
	$elevation = $elevation + 1;
print OUT1 "$ptNum,$northing,$easting4,$elevation,$codeWithLineOne $rawCode\n";
#	increment point number
	$ptNum = $ptNum + 1;
#	increment elevation
	$elevation = $elevation + 1;
#	increment northing
	$northing = $northing - 25;
#########################################
print OUT1 "$ptNum,$northing,$easting0,$elevation,$codeStartLineTwo $rawCode\n";
#	increment point number
	$ptNum = $ptNum + 1;
#	increment elevation
	$elevation = $elevation + 1;
print OUT1 "$ptNum,$northing,$easting1,$elevation,$codeWithLineTwo $rawCode\n";
#	increment point number
	$ptNum = $ptNum + 1;
#	increment elevation
	$elevation = $elevation + 1;
print OUT1 "$ptNum,$northing,$easting2,$elevation,$codeWithLineTwo $rawCode\n";
#	increment point number
	$ptNum = $ptNum + 1;
#	increment elevation
	$elevation = $elevation + 1;
print OUT1 "$ptNum,$northing,$easting3,$elevation,$codeWithLineTwo $rawCode\n";
#	increment point number
	$ptNum = $ptNum + 1;
#	increment elevation
	$elevation = $elevation + 1;
print OUT1 "$ptNum,$northing,$easting4,$elevation,$codeWithLineTwo $rawCode\n";
#	increment point number
	$ptNum = $ptNum + 1;
#	increment elevation
	$elevation = $elevation + 1;
#	increment northing
	$northing = $northing - 25;


##############Test Section	
#print OUT1 "alksdf;alkdj   $pointCodes{$csplit[0]}\n";
#print OUT5 "\n\n\n\in[0] point number             = $in[0]\n";                            
#print OUT5 "in[4] full code & $rawCode      = $in[4]\n";                            
#print OUT5 "fsplit[0] full code no $rawCode = $fsplit[0]\n";                        
#print OUT5 "fsplit[1] $rawCode              = $fsplit[1]\n";                        
#print OUT5 "ssplit[0] code and line no.    = $ssplit[0]\n";                        
#print OUT5 "ssplit[1] line code            = $ssplit[1]\n";                        
#print OUT5 "tok[0] line code               = $tok[0]\n";                           
#print OUT5 "tok[1] code, line no., $rawCode = $tok[1]\n";                           
#print OUT5 "csplit[0] alpha code	   = $csplit[0]\n";                        
#print OUT5 "csplit[1] line number	   = $csplit[1]\n";                        
#print OUT5 "hold 			   = $hold\n";                             
#print OUT5 "c linecode                     = $c\n";     
#print OUT5 "Icode idot code, line no.      = $Icode\n\n";                    	
        
	 
	 
     

 
#	#prepare for next loop
#	if ($curIsString) {
#		$activeStrings{$figname}=1; #make sure the list contains an entry for this string
#	}
#	$lastWasString=$curIsString;
#	$lastFigname=$figname;
		
}
close(IN);
close(OUT1);
