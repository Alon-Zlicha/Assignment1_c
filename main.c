#include <stdio.h>
#include "numClass.h"

int main(){
    int num1,num2;
    printf("Please enter two integers: \n");
    scanf("%d %d",&num1,&num2);
    int min=num1;
    int max=num2;
    if(num1>num2){
        min=num2;
        max=num1;
    }
    printf("The Armstrong numbers are: ");
    for(int i=min;i<=max;i++){
        if(isArmstrong(i)){
            printf("%d ", i);
        }
    }
    printf("\nThe Palindrome numbers are: ");
    for(int i=min;i<=max;i++){
        if(isPalindrome(i)){
            printf("%d ", i);
        }
    }
    printf("\nThe prime numbers are: ");
    for(int i=min;i<=max;i++){
        if(isPrime(i)){
            printf("%d ", i);
        }
    }
    printf("\nThe strong numbers are: ");
    for(int i=min;i<=max;i++){
        if(isStrong(i)){
            printf("%d ", i);
        }
    }
    printf("\n");
    return 0;
}