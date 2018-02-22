#include <test1.h>
#include <project.h>
#include <stdio.h>

void test1()
{
#ifdef USE_API1
  printf("test1 - USE_API1 is set\n");
#else
  printf("test1 - USE_API1 is not set\n");
#endif
}
