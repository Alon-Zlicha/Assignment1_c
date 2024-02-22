#include "numClass.h"
int powerRec(int num,int pow){
    if (pow==0){
        return 1;
    }
    return num*powerRec(num,pow-1);
}
int numOfDigits(int num){
    if(num<10){
        return 1;
    }
    return 1+numOfDigits(num/10);
}
int isArmstrongRecursive(int num, int numOfDig){
    if(num==0){
        return 0;
    }
    int dig=num%10;
    int powDig=powerRec(dig,numOfDig);
    return (powDig+isArmstrongRecursive(num/10,numOfDig));
}
int isArmstrong(int num){
    int numOfDig=numOfDigits(num);
    return (isArmstrongRecursive(num,numOfDig)==num);
}
int isPalindromeRecursive(int num,int reverse){
    if(num<10){
        return reverse*10+num; 
    }
    return isPalindromeRecursive(num/10,reverse*10+num%10);
}
int isPalindrome(int num){
    int reverse=isPalindromeRecursive(num,0);
    return (num==reverse);
}
