#include <stdio.h>

extern char S[];
extern char EX[];

int find_substring(int sizeOfS, int sizeOfEx) {
  int diff, c, i, j;
  diff = sizeOfS - sizeOfEx;
  for (i = 0; i < diff; ++i) {
    c = 0;
    for (j = 0; j < sizeOfEx; ++j) {
      if (S[i + j] != EX[j]) {
        break;
      }
      ++c;
    }
    if (c == sizeOfEx) {
      return i;
    }
  }
  return -1;
}
