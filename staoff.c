#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

const char chainName[10] = "IL113";
char counterString[11];

char * fetchCode(char *aCode){
	char  alphaCode[4];
	char  idotCode[4];
	char*  iCode = (char*) malloc(4);
	FILE *idotCodeList = fopen("mpsIdotCodes.txt","r");
	while (fscanf(idotCodeList,"%s %s",alphaCode,idotCode) == 2) {
//	while (fscanf(idotCodeList,"%s %s",&alphaCode,&idotCode) == 2) {
		if (strcmp(alphaCode,aCode) == 0) {
			printf("\n\n%s \n","testing fetchCode");
			printf("alphaCode = %s\n",alphaCode);
			printf("idotCode = %s\n",idotCode);
			printf("fieldCode(aCode) = %s\n",aCode);
			strcpy(iCode, idotCode);
			printf("offsetPointCode(iCode) = %s\n\n\n",iCode);
		}
	}
	fclose(idotCodeList);
	return iCode;
}
int main()
{
/* Input variables from geopakStaOff.txt */
char  origPointNo[11];
float pointStation;
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
//char  chainName[10] = "IL113";
/* Interior variables */
int   counter = 0;

/* Output variable */
char  offsetPointNo[11];
//float offsetPointStation;
float offsetPointOffset;
float offsetPointElevation;
char  *offsetPointCode;

/* Function prototypes */
float elevationCalc(float oldElev,float BS,float FS);
float offsetCalc(float oldOS,float bsDist,float fsDist,char leftRight[]);
// char* fetchcode(char *aCode);
/* open files */
FILE *fieldData = fopen("inputFieldData.csv","r");
FILE *outputFile = fopen("out.txt","a");
//FILE *idotCodeList = fopen("mpsIdotCodes.txt","r");

//printf("%s \n","testing");
/* Read one line of input file */
//	while (fscanf(fieldData,"%s %s %f %f %f %f %s",&fieldPointNo,leftRight,&backsightPlus,&bsDistFromPoint,
	while (fscanf(fieldData,"%s %s %f %f %f %f %s",fieldPointNo,leftRight,&backsightPlus,&bsDistFromPoint,\
			&foresightMinus,&fsDistFromPoint,fieldCode) == 7) {
		//Create new point number from old number and a counter
		if (counter == 8) {
			counter = 0;
		}
		printf("counter = %d\n",counter);
		sprintf(counterString, "%d", counter);
		printf("counterString = %s\n",counterString);
		printf("fieldPointNo = %s\n",fieldPointNo);
		strcpy(offsetPointNo, fieldPointNo);
		strcat(offsetPointNo, counterString);
		printf("offsetPointNo = %s\n",offsetPointNo);
		counter++;
//		printf("\n\nchainName = %s\n",chainName);
//		printf("fieldPointNo = %s\n",fieldPointNo);
//		printf("leftRight = %s\n",leftRight);
//		printf("backsightPlus = %f\n",backsightPlus);
//		printf("bsDistFromPoint = %f\n",bsDistFromPoint);
//		printf("foresightMinus = %f\n",foresightMinus);
//		printf("fsDistFromPoint = %f\n",fsDistFromPoint);
//		printf("fieldCode = %s\n",fieldCode);
		/* use point number to search for point number in origData and return variables */
		FILE *origData = fopen("geopakStaOff.txt","r");
//		while (fscanf(origData,"%s %f %f %f",&origPointNo,&pointStation,&origPointOffset,&origPointElevation) == 4) {
		while (fscanf(origData,"%s %f %f %f",origPointNo,&pointStation,&origPointOffset,&origPointElevation) == 4) {
//			printf("\nchainName2 = %s\n",chainName);
//			printf("fieldPointNo = %s\n",fieldPointNo);
//			printf("origPointNo = %s\n",origPointNo);
//			printf("pointStation = %f\n",pointStation);
//			printf("origPointOffset = %f\n",origPointOffset);
//			printf("origPointElevation = %f\n",origPointElevation);
			if (strcmp(fieldPointNo,origPointNo) == 0) {
				printf("\n\n\nfieldPointNo22 = %s\n",fieldPointNo);
//				printf("origPointNo23 = %s\n",origPointNo);
//				printf("origPointElevation24 = %f\n",origPointElevation);
				/* Do calculations */
				offsetPointElevation = elevationCalc(origPointElevation,backsightPlus,foresightMinus);
//				printf("\noffsetPointElevation = %f\n",offsetPointElevation);
//				printf("\n\n%s \n","testing variables for offsetCalc");
//				printf("origPointOffset = %f\n",origPointOffset);
//				printf("bsDistFromPoint = %f\n",bsDistFromPoint);
//				printf("fsDistFromPoint = %f\n",fsDistFromPoint);
//				printf("leftRight = %s\n",leftRight);
				offsetPointOffset = offsetCalc(origPointOffset,bsDistFromPoint,fsDistFromPoint,leftRight);
//				/* use fieldCode to search for IDOTcode in ??? and return offsetPointCode */
				char *tmp = fetchCode(fieldCode);
				offsetPointCode = tmp;
//				offsetPointCode = fetchCode(fieldCode);
				printf("offsetPointCode = %s\n\n\n",offsetPointCode);
				free(tmp);
//				while (fscanf(idotCodeList,"%s %s",&alphaCode,&idotCode) == 2) {
//					printf("alphaCode = %s\n",alphaCode);
//					printf("idotCode = %s\n",idotCode);
//					printf("fieldCode = %s\n",fieldCode);
//					if (strcmp(alphaCode,fieldCode) == 0) {
//						printf("alphaCode = %s\n",alphaCode);
//						printf("idotCode = %s\n",idotCode);
//						printf("fieldCode = %s\n",fieldCode);
//						strcpy(offsetPointCode, idotCode);
//						printf("offsetPointCode = %s\n",offsetPointCode);
////						break;
//					}
//					break;
//				}
				/* print results */
				fprintf(outputFile,"Locate %s ON Chain %s STA %.1f Offset  %.1f\n", offsetPointNo, chainName, pointStation, offsetPointOffset); 
				fprintf(outputFile,"Store Point %s Elevation %.1f\n", offsetPointNo, offsetPointElevation);
				fprintf(outputFile,"Store Point %s Feature \"%s\"\n", offsetPointNo, offsetPointCode);
				fieldPointNo[0] = 'x';
//				break;
			}
//			break;
		}
	fclose(origData);
	}
fclose(fieldData);
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
	printf("newOffset = %f \n\n\n",newOffset);
	return newOffset;
}
//char * fetchCode(char *aCode){
//	char  alphaCode[4];
//	char  idotCode[4];
//	char  iCode[4];
//	FILE *idotCodeList = fopen("mpsIdotCodes.txt","r");
//	while (fscanf(idotCodeList,"%s %s",&alphaCode,&idotCode) == 2) {
//		if (strcmp(alphaCode,aCode) == 0) {
//			printf("\n\n%s \n","testing fetchCode");
//			printf("alphaCode = %s\n",alphaCode);
//			printf("idotCode = %s\n",idotCode);
//			printf("fieldCode(aCode) = %s\n",aCode);
//			strcpy(iCode, idotCode);
//			printf("offsetPointCode(iCode) = %s\n",iCode);
//		}
//	}
//	fclose(idotCodeList);
//	return iCode;
//}
