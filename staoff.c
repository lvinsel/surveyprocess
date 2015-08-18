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
char  chainName[10] = "IL113";
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
float offsetCalc(float oldOS,float bsDist,float fsDist,char leftRight[]);

/* open files */
FILE *origData = fopen("geopakStaOff.txt","r");
FILE *fieldData = fopen("inputFieldData.csv","r");
FILE *outputFile = fopen("out.txt","a");
FILE *idotCodeList = fopen("mpsIdotCodes.txt","r");

//printf("%s \n","testing");
/* Read one line of input file */
	while (fscanf(fieldData,"%s %s %f %f %f %f %s",&fieldPointNo,leftRight,&backsightPlus,&bsDistFromPoint,\
			&foresightMinus,&fsDistFromPoint,fieldCode) == 7) {
		printf("\n\nchainName = %s\n",chainName);
		printf("fieldPointNo = %s\n",fieldPointNo);
		printf("leftRight = %s\n",leftRight);
		printf("backsightPlus = %f\n",backsightPlus);
		printf("bsDistFromPoint = %f\n",bsDistFromPoint);
		printf("foresightMinus = %f\n",foresightMinus);
		printf("fsDistFromPoint = %f\n",fsDistFromPoint);
		printf("fieldCode = %s\n",fieldCode);
		/* use point number to search for point number in origData and return variables */
		while (fscanf(origData,"%s %f %f %f",&origPointNo,&PointStation,&origPointOffset,&origPointElevation) == 4) {
			printf("\nchainName2 = %s\n",chainName);
			printf("fieldPointNo = %s\n",fieldPointNo);
			printf("origPointNo = %s\n",origPointNo);
			//printf("%s \n","testing1");
			//printf("origPointElevation = %f\n",origPointElevation);
			if (strcmp(fieldPointNo,origPointNo) == 0) {
			printf("fieldPointNo22 = %s\n",fieldPointNo);
			printf("origPointNo23 = %s\n",origPointNo);
			printf("origPointElevation24 = %f\n",origPointElevation);
//			/* Do calculations */
			offsetPointElevation = elevationCalc(origPointElevation,backsightPlus,foresightMinus);
			printf("\noffsetPointElevation = %f\n",offsetPointElevation);
			printf("\n\n%s \n","testing variables for offsetCalc");
			printf("origPointOffset = %f\n",origPointOffset);
			printf("bsDistFromPoint = %f\n",bsDistFromPoint);
			printf("fsDistFromPoint = %f\n",fsDistFromPoint);
			printf("leftRight = %s\n",leftRight);
			offsetPointOffset = offsetCalc(origPointOffset,bsDistFromPoint,fsDistFromPoint,leftRight);
//			/* use fieldCode to search for IDOTcode in ??? and return offsetPointCode */
//				while (fscanf(idotCodeList,"%s,%s",&alphaCode,&idotCode) == 2) {
//					if (strcmp(alphaCode,fieldCode) == 0) {
//						char *strcpy(char *offsetPointCode, const char *idotCode);
//						break;
//					}
//				}
//			/* print results */
			fprintf(outputFile,"Locate %s ON Chain %s STA %.1f Offset  %.1f\n", origPointNo, chainName, offsetPointStation, offsetPointOffset); 
			fprintf(outputFile,"Store Point %s Elevation %.1f\n", offsetPointNo, offsetPointElevation);
			fprintf(outputFile,"Store Point %s Feature \"%s\"\n", offsetPointNo, offsetPointCode);
			}
		}
	}
return 0;
}
float elevationCalc(float oldElev,float BS,float FS) {
	printf("\n\n%s \n","testing elevationCalc");
	printf("oldElev = %f \n",oldElev);
	printf("BS = %f \n",BS);
	printf("FS = %f \n",FS);
	float newElev;
	newElev = ((oldElev + BS) - FS);
	printf("newElev = %f \n",newElev);
	return newElev;
}

float offsetCalc(float oldOS,float bsDist,float fsDist,char side[]) {
	printf("\n\n%s \n","testing offsetCalc");
	printf("%s \n","testing2");
	printf("oldOS = %f \n",oldOS);
	printf("bsDist = %f \n",bsDist);
	printf("fsDist = %f \n",fsDist);
	printf("side = %s \n",side);
	float newOffset;
	if (side[0] == 'L') {
		printf("side is left = %s \n",side);
		newOffset = oldOS - bsDist - fsDist;
	}
	if (side[0] == 'R') {
		printf("side is right = %s \n",side);
		newOffset = oldOS + bsDist + fsDist;
	}
	printf("newOffset = %f \n",newOffset);
	return newOffset;
}
