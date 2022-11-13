#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

char S[1000000];
char EX[1000];

extern int find_substring(int sizeOfS, int sizeOfEx);

int main(int argc, char* argv[]) {
  FILE *input, *output;
  int sizeOfS, sizeOfEx, res, i, c, temp;
  clock_t start, end;
  if (argc == 1) {
   input = fopen("random_input.txt", "w");
   sizeOfS = 1000000;
   for (i = 0; i < sizeOfS; ++i) {
     S[i] = (char)((rand() + clock()) % 32 + 32);
     fprintf(input, "%c", S[i]);
   }   
   printf("Random input was generated and is in file \"random_input.txt\"\n");
   sizeOfEx = (rand() + clock()) % 5 + 1;
   printf("Random substring was generated: ");
   for (i = 0; i < sizeOfEx; ++i) {
     EX[i] = (char)((rand() + clock()) % 32 + 32);
     printf("%c", EX[i]);
   }
   printf("\n");
   output = fopen("random_output.txt", "w");
   printf("The result is in file \"random_output.txt\"\n");
  } else if (argc >= 1000) {
    printf("size of string to find is too big\n");
    return 1;
  } else {
    if ((input = fopen(argv[1], "r")) == 0) {
      printf("Wrong filename\n");
      return 1;
    }
    output = fopen("output.txt", "w");
    for (i = 2; i < argc; ++i) {
      temp = strlen(argv[i]);
      for (c = 0; c < temp; ++c) {
        if (sizeOfEx == 1000) {
          printf("size of string to find is too big\n");
          return 1;
        }
        EX[sizeOfEx] = argv[i][c];
        ++sizeOfEx;
      }
      if (sizeOfEx < 1000 && i != argc - 1) {
        EX[sizeOfEx] = ' ';
        ++sizeOfEx;
      }
    }
    sizeOfS = 0;
    while (sizeOfS < 1000000 && (c = fgetc(input)) != EOF) {
      S[sizeOfS] = (char)c;
      ++sizeOfS;
      if (sizeOfS == 1000000) {
        printf("size of input is too big\n");
        return 1;
      }
    }
  }
  start = clock();
  for (i = 0; i < 1000; ++i) {
    res = find_substring(sizeOfS, sizeOfEx);
  }
  end = clock();
  fprintf(output, "%d", res);
  fclose(output);
  fclose(input);
  printf("Working time: %ld ms\n", (end - start) / 1000);
  return 0;
}
