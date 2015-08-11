#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
/* Input variables from geopakStaOff.txt */
char  origPointNo[11];
float PointStation;
float origPointOffset;
float origPointElevation;
/* Input variables from inputFieldData.csv */
char  fieldPointNo[11];
char  leftRight;
float backsitePlus;
float bsDistFromPoint;
float foresightPlus;
float fsDistFromPoint;
char  fieldCode[4];
/* Input variables from argument */
char  chainName[6];
/* Interior variables */
/* Output variable */
char  OffsetPointNo[11];
float OffsetPointStation;
float OffsetPointOffset;
float OffsetPointElevation;
char  OffsetPointCode[4];

/* Initialize variables */
chainName = "IL113";

/* open files */
FILE *origData = fopen("geopakStaOff.txt",r);
FILE *fieldData = fopen("inputFieldData.csv",r);
FILE *outputFile = fopen("out.txt",w);

/* Read one line of input file */
while (fscanf(fieldData,"%s,%c,%f,%f,%f,%f,%s",fieldPointNo,leftRight,&backsitePlus,&bsDistFromPoint,\
		&foresiteMinus,&fsDistFromPoint,fieldCode) == 7) {
	/* use point number to search for point number in origData and return variables */
	while (fscanf(origData,"%s,%f,%f,%f",origPointNo,&PointStation,&origPointOffset,&origPointElevation) == 4) {
		if(fieldPointNo == origPointNo) {
		/* Do calculations */
		/* use fieldCode to search for IDOTcode in ??? and return offsetPointCode */
		/* print results */
		fprintf(outputFile,"Locate %s ON Chain %s STA %.1f Offset  %.1f", OffsetPointNo, ChainName, OffsetPointStation, OffsetPointOffset); 
		fprintf(outputFile,"Store Point %s Elevation %.1f", OffsetPointNo, OffsetPointElevation);
		fprintf(outputFile,"Store Point %s Feature \"%s\"", OffsetPointNo, OffsetPointCode);
		}
	}
}
 *


