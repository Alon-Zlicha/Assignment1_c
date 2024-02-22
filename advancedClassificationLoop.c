#include "numClass.h"

int power(int num,int pow){
    int ans=1;
    for(int i=0;i<pow;i++){
        ans=ans*num;
    }
    return ans;
}
int isArmstrong(int num){
    int numOfDigits=0;
    int temp=num;
    int sumOfPowN=0;
    while(temp>0){
        numOfDigits++;
        temp=temp/10;
    }
    temp=num;
    while(temp>0){
        int dig=temp%10;
        sumOfPowN+=power(dig,numOfDigits);
        temp=temp/10;
    }
    return (sumOfPowN==num);
}
int isPalindrome(int num){
    int reverse=0;
    int temp=num;
    while(temp>0){
        int dig=temp%10;
        reverse=reverse*10+dig;
        temp=temp/10;
    }
    return (reverse==num);
}