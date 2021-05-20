#include <stdio.h>

/* Yoel suggested to add prototypes */
void prin22_(double* a, int* n, FILE* out_file);
void print_inner(int ion, char *str, double *a, int *ia, long int *la, int *n, int itype);


/*

  PRINTING FUNCTIONS TO BE CALLED FROM FORTRAN

 */

void prin22_(double* a, int* n, FILE* out_file) {

  /*  printf("a = \n"); */
  int i, ix;

  i = 0;
  ix = 0;
  for (i = 0; i<*n; i++) {
    printf("  %11.4le", *(a+i));
    fprintf(out_file, "  %11.4le", *(a+i));
    ix = ix + 1;
    if (ix == 6) {
      ix = 0;
      printf("\n");
      fprintf(out_file, "\n");
    }
  }
  if (ix > 0) {
    printf("\n");
    fprintf(out_file, "\n");
  }

}


void cprina_(char *str, FILE *out_file) {

  int i;
  for (i = 0; i < 100; i++) {
    if (str[i] == '*') goto jump1;
    printf("%c", str[i]);
    fprintf(out_file, "%c", str[i]);
  }
 jump1:

  printf("\n");
  fprintf(out_file, "\n");

}


void cprin2_(char *str, double *a, int* n, FILE *out_file) {
  cprina_(str, out_file);  
  prin22_(a, n, out_file);
}

void cprinf_(char *str, int *a, int *n, FILE *out_file) {
  int i, ix;

  cprina_(str, out_file);
  

  i = 0;
  ix = 0;
  for (i = 0; i<*n; i++) {
    printf(" %7d", *(a+i));
    fprintf(out_file, " %7d", *(a+i));
    ix = ix + 1;
    if (ix == 10) {
      ix = 0;
      printf("\n");
      fprintf(out_file, "\n");
    }
  }
  if (ix > 0) {
    printf("\n");
    fprintf(out_file, "\n");
  }


}

void cprinl_(char *str, long int *a, int *n, FILE *out_file) {
  int i, ix;

  cprina_(str, out_file);
  

  i = 0;
  ix = 0;
  for (i = 0; i<*n; i++) {
    printf(" %7ld", *(a+i));
    fprintf(out_file, " %7ld", *(a+i));
    ix = ix + 1;
    if (ix == 10) {
      ix = 0;
      printf("\n");
      fprintf(out_file, "\n");
    }
  }
  if (ix > 0) {
    printf("\n");
    fprintf(out_file, "\n");
  }


}

/*

  SECOND GENERATION PRINTING FUNCTIONS

 */


void print_on_off__(int *ion) {
  char *str;
  double *a;
  int *ia;
  int *n;
  long int *la;
  print_inner(*ion, str, a, ia, la, n, 1);
}

void prina_(char* str) {
  double *a;
  int *ia;
  int *n;
  long int *la;
  print_inner(0, str, a, ia, la, n, 2);
}

void prin2_(char* str, double* a, int *n) {
  int *ia;
  long int *la;
  print_inner(0, str, a, ia, la, n, 3);
}

void prinf_(char* str, int* ia, int *n) {
  double *a;
  long int *la;
  print_inner(0, str, a, ia, la, n, 4);
}

void prinl_(char* str, long int* la, int *n) {
  double *a;
  int *ia;
  print_inner(0, str, a, ia, la, n, 5);
}

void print_inner(int ion, char *str, double *a, int *ia, long int *la, int *n, int itype) {

  static int iprint_on;
  static FILE *output_file;

  /* PRINT ON / OFF */
  if (itype == 1) {
    iprint_on = ion;
    if (iprint_on == 0) fclose(output_file);
    if (iprint_on == 1) output_file = fopen("myprin.13", "w");
    return;
  }

  if (iprint_on == 0) return;

  /* PRINT STRING */
  if (itype == 2) {
    cprina_(str, output_file);
  }

  /* PRINT DOUBLE */
  if (itype == 3) {
    cprin2_(str, a, n, output_file);
  }

  /* PRINT INT */
  if (itype == 4) {
    cprinf_(str, ia, n, output_file);
  }

  if (itype == 5) {
    cprinl_(str, la, n, output_file);
  }


}
