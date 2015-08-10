#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
/* Input variables from geopakStaOff.txt */
char  origPointNo[];
float PointStation;
float origPointOffset;
float origPointElevation;
/* Input variables from inputFieldData.csv */
char  fieldPointNo[];
char  leftRight;
float backsitePlus;
float bsDistFromPoint;
float foresightPlus;
float fsDistFromPoint;
char  fieldCode[];
/* Input variables from argument */
char  chainName[];
/* Interior variables */
/* Output variable */
char  OffsetPointNo[];
float OffsetPointStation;
float OffsetPointOffset;
float OffsetPointElevation;
char  OffsetPointCode[];

FILE *origData = fopen("geopakStaOff.txt",r);
FILE *fieldData = fopen("inputFieldData.csv",r);

	fscanf(origData,"%s,%f,%f,%f",origPointNo,&PointStation,&origPointOffset,&origPointElevation);
	fscanf(fieldData,"%s,%c,%f,%f,%f,%f,%s",fieldPointNo,leftRight,&backsitePlus,&bsDistFromPoint,\
		&foresiteMinus,&fsDistFromPoint,fieldCode);	




	fprintf(outputFile,"Locate %s ON Chain %s STA %.1f Offset  %.1f", OffsetPointNo, ChainName, OffsetPointStation, OffsetPointOffset); 
	fprintf(outputFile,"Store Point %s Elevation %.1f", OffsetPointNo, OffsetPointElevation);
	fprintf(outputFile,"Store Point %s Feature \"%s\"", OffsetPointNo, OffsetPointCode);
