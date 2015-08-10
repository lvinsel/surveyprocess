#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
/* Input variables from geopakStaOff.txt */
char  origPointNo[];
float PointStation;
float origPointOffset;
float origPointElevation;
/* Input variables from inputFieldData.csv */
/* Input variables from argument */
char  chainName[];
/* Interior variables */
/* Output variable */

char  OffsetPointNo[];
float OffsetPointStation;
float OffsetPointOffset;
float OffsetPointElevation;
char  OffsetPointCode[];


	fscanf(OrigData,




	fprintf(outputFile,"Locate %s ON Chain %s STA %.1f Offset  %.1f", OffsetPointNo, ChainName, OffsetPointStation, OffsetPointOffset); 
	fprintf(outputFile,"Store Point %s Elevation %.1f", OffsetPointNo, OffsetPointElevation);
	fprintf(outputFile,"Store Point %s Feature \"%s\"", OffsetPointNo, OffsetPointCode);
