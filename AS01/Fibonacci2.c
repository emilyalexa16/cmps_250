#include <stdio.h>

int nextTribonacci(int term1, int term2, int term3) {
   return term1 + term2 + term3;
}

int main()  {
   int limit;
   int term1 = 1;
   int term2 = 1;
   int term3 = 2;
   int next;
   printf("Tribonacci2 Program...\n");
   printf("Enter an integer:");
   scanf("%d", &limit);
   if(term1 <= limit) {
      printf("%d\n",term1);
      if(term2 <= limit) {
          printf("%d\n",term2);
          while(term3 <= limit) {
              printf("%d\n",term3);
              next = nextTribonacci(term1,term2, term3);
              term1 = term2;
              term2 = term3;
              term3 = next;
          }
      }
   }
   printf("Done!\n");
}
