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
const char  chainName[] = "IL113";
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
FILE *outputFile = fopen("out.txt","a");
FILE *idotCodeList = fopen("mpsIdotCodes.txt","r");

//printf("%s \n","testing");
/* Read one line of input file */
	while (fscanf(fieldData,"%s %s %f %f %f %f %s",&fieldPointNo,leftRight,&backsightPlus,&bsDistFromPoint,\
			&foresightMinus,&fsDistFromPoint,fieldCode) == 7) {
		printf("chainName = %s\n",chainName);
		//printf("fieldPointNo = %s\n",fieldPointNo);
		//printf("leftRight = %s\n",leftRight);
		/* use point number to search for point number in origData and return variables */
		while (fscanf(origData,"%s %f %f %f",&origPointNo,&PointStation,&origPointOffset,&origPointElevation) == 4) {
			printf("fieldPointNo = %s\n",fieldPointNo);
			printf("origPointNo = %s\n",origPointNo);
			//printf("%s \n","testing1");
			//printf("origPointElevation = %f\n",origPointElevation);
			if (strcmp(fieldPointNo,origPointNo) == 0) {
				//printf("fieldPointNo = %f\n",&fieldPointNo);
				//printf("origPointNo = %f\n",origPointNo);
				//printf("%s \n","testing");
				/* Do calculations */
				//printf("origPointElevation = %s\n",origPointElevation);
				offsetPointElevation = elevationCalc(origPointElevation,backsightPlus,foresightMinus);
				printf("offsetPointElevation = %f\n",offsetPointElevation);
				offsetPointOffset = offsetCalc(origPointOffset,bsDistFromPoint,fsDistFromPoint);
				/* use fieldCode to search for IDOTcode in ??? and return offsetPointCode */
					while (fscanf(idotCodeList,"%s,%s",&alphaCode,&idotCode) == 2) {
						if (strcmp(alphaCode,fieldCode) == 0) {
							char *strcpy(char *offsetPointCode, const char *idotCode);
							break;
						}
					}
				/* print results */
				fprintf(outputFile,"Locate %s ON Chain %s STA %.1f Offset  %.1f\n", origPointNo, chainName, offsetPointStation, offsetPointOffset); 
				fprintf(outputFile,"Store Point %s Elevation %.1f\n", offsetPointNo, offsetPointElevation);
				fprintf(outputFile,"Store Point %s Feature \"%s\"\n", offsetPointNo, offsetPointCode);
			}
		}
	}
return 0;
}
float elevationCalc(float oldElev,float BS,float FS) {
	printf("%s \n","testing elevationCalc");
	printf("oldElev = %f \n",oldElev);
	printf("BS = %f \n",BS);
	printf("FS = %f \n",FS);
	float newElev;
	newElev = ((oldElev + BS) - FS);
	printf("newElev = %f \n",newElev);
	return newElev;
}

float offsetCalc(float oldOS,float bsDist,float fsDist) {
	printf("%s \n","testing2");
	float newOffset;
	newOffset = oldOS + bsDist + fsDist;
	printf("%f \n",newOffset);
	return newOffset;
}
