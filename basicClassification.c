#include "numClass.h"

int isPrime(int num){
    if(num<=1){
        return 0;
    }
    int i=2;
    while(num>=i*i){
        if(num%i==0){
            return 0;
        }
        i++;
    }
    return 1;
}
int factorial(int num){
    if(num==0 || num==1){
        return 1;
    }
    return num*factorial(num-1);
}
int isStrong(int num){
    int temp=num;
    int sum=0;
    int sumOfFactorials=0;
    while(temp>0){
        int dig=temp%10;
        sum+=dig;
        sumOfFactorials+=factorial(dig);
        temp=temp/10;
    }
    return (sumOfFactorials==num);
}
