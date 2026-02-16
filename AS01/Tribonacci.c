// Emily Alexa Gotiangco
// CMPS 250, Professor Jackowitz
// AS01: Tribonacci

#include <stdio.h>
int main()  {
  int limit;
  int term1 = 1;
  int term2 = 1;
  int term3 = 2;
  int next;
  printf("Tribonacci Program...\n");
  printf("Enter an integer:");
  scanf("%d", &limit);
  if(term1 <= limit) {
    printf("%d\n",term1);
    if(term2 <= limit) {
        printf("%d\n",term2);
        while(term3 <= limit) {
            printf("%d\n",term3);
            next = term1 + term2 + term3;
            term1 = term2;
            term2 = term3;
            term3 = next;
        }
    }
  }
  printf("Done!\n");
}
