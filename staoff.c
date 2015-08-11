#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main()
{
/* Input variables from geopakStaOff.txt */
char  origPointNo[11];
float PointStation;
float origPointOffset;
float origPointElevation;
/* Input variables from inputFieldData.csv */
char  fieldPointNo[11];
char  leftRight[2];
float backsightPlus;
float bsDistFromPoint;
float foresightMinus;
float fsDistFromPoint;
char  fieldCode[4];
/* Input variables from argument */
char  chainName[] = "IL113";
/* Interior variables */
char  alphaCode[4];
char  idotCode[4];
int   ret;

/* Output variable */
char  offsetPointNo[11];
float offsetPointStation;
float offsetPointOffset;
float offsetPointElevation;
char  offsetPointCode[4];

/* Function prototypes */
float elevationCalc(float oldElev,float BS,float FS);
float offsetCalc(float oldOS,float bsDist,float fsDist);

/* open files */
FILE *origData = fopen("geopakStaOff.txt","r");
FILE *fieldData = fopen("inputFieldData.csv","r");
FILE *outputFile = fopen("out.txt","w");
FILE *idotCodeList = fopen("mpsIdotCodes.txt","r");

/* Read one line of input file */
	while (fscanf(fieldData,"%s,%c,%f,%f,%f,%f,%s",fieldPointNo,leftRight,&backsightPlus,&bsDistFromPoint,\
			&foresightMinus,&fsDistFromPoint,fieldCode) == 7) {
		/* use point number to search for point number in origData and return variables */
		while (fscanf(origData,"%s,%f,%f,%f",origPointNo,&PointStation,&origPointOffset,&origPointElevation) == 4) {
			if(fieldPointNo == origPointNo) {
				/* Do calculations */
				offsetPointElevation = elevationCalc(origPointElevation,backsightPlus,foresightMinus);
				offsetPointOffset = offsetCalc(origPointOffset,bsDistFromPoint,fsDistFromPoint);
				/* use fieldCode to search for IDOTcode in ??? and return offsetPointCode */
					while (fscanf(idotCodeList,"%s,%s",&alphaCode,&idotCode) == 2) {
						if (strcmp(alphaCode,fieldCode) == 0) {
							char *strcpy(char *offsetPointCode, const char *idotCode);
							break;
						}
					}
				/* print results */
				fprintf(outputFile,"Locate %s ON Chain %s STA %.1f Offset  %.1f", offsetPointNo, chainName, offsetPointStation, offsetPointOffset); 
				fprintf(outputFile,"Store Point %s Elevation %.1f", offsetPointNo, offsetPointElevation);
				fprintf(outputFile,"Store Point %s Feature \"%s\"", offsetPointNo, offsetPointCode);
			}
		}
	}
return 0;
}
float elevationCalc(float oldElev,float BS,float FS) {
	float newElev;
	newElev = oldElev + BS + FS;
	return newElev;
}

float offsetCalc(float oldOS,float bsDist,float fsDist) {
	float newOffset;
	newOffset = oldOS + bsDist + fsDist;
	return newOffset;
}
