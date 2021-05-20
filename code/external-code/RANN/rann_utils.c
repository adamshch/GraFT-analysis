/* this code was generated with the help of f2c */
typedef int integer;
typedef double doublereal;
typedef struct mycomplex {double r; double i;} doublecomplex;

/* Table of constant values */

static integer c__1 = 1;
static integer c__11 = 11;

/* Subroutine */ int dcffti_(integer *n, doublereal *wsave);
/* Subroutine */ int dura1_(integer *n, doublereal *wa, integer *ifac);

/* Subroutine */ int dcfftb_(integer *n, doublereal *c__, doublereal *wsave);
/* Subroutine */ int durab1_(integer *n, doublereal *c__, doublereal *ch, 
			     doublereal *wa, integer *ifac);
/* Subroutine */ int durab2_(integer *ido, integer *l1, doublereal *cc, 
			     doublereal *ch, doublereal *wa1);
/* Subroutine */ int durab3_(integer *ido, integer *l1, doublereal *cc, 
			     doublereal *ch, doublereal *wa1, doublereal *wa2);
/* Subroutine */ int durab4_(integer *ido, integer *l1, doublereal *cc, 
			     doublereal *ch, doublereal *wa1,
			     doublereal *wa2, doublereal *wa3);
/* Subroutine */ int durab5_(integer *ido, integer *l1, doublereal *cc, 
			     doublereal *ch, doublereal *wa1,
			     doublereal *wa2, doublereal *wa3, 
			     doublereal *wa4);

/* Subroutine */ int dcfftf_(integer *n, doublereal *c__, doublereal *wsave);
/* Subroutine */ int duraf1_(integer *n, doublereal *c__, doublereal *ch, 
			     doublereal *wa, integer *ifac);
/* Subroutine */ int duraf2_(integer *ido, integer *l1, doublereal *cc, 
			     doublereal *ch, doublereal *wa1);
/* Subroutine */ int duraf3_(integer *ido, integer *l1, doublereal *cc, 
			     doublereal *ch, doublereal *wa1, doublereal *wa2);
/* Subroutine */ int duraf4_(integer *ido, integer *l1, doublereal *cc, 
			     doublereal *ch, doublereal *wa1,
			     doublereal *wa2, doublereal *wa3);
/* Subroutine */ int duraf5_(integer *ido, integer *l1, doublereal *cc, 
			     doublereal *ch, doublereal *wa1,
			     doublereal *wa2, doublereal *wa3, 
			     doublereal *wa4);

/* Subroutine */ int durdec_0_(int n__, doublecomplex *f, doublecomplex *c__, 
			       doublecomplex *coscoe, doublecomplex *sincoe,
			       doublecomplex *w, doublecomplex *wsave,
			       integer *n77);
/* Subroutine */ int durdec_(doublecomplex *f, doublecomplex *c__, 
			     doublecomplex *coscoe, doublecomplex *sincoe,
			     doublecomplex *w, doublecomplex *wsave);
/* Subroutine */ int durini_(doublecomplex *wsave, integer *n77);
/* Subroutine */ int dursyn_(doublecomplex *c__, doublecomplex *coscoe, 
			     doublecomplex *sincoe,
			     doublecomplex *f, doublecomplex *wsave);





/* Subroutine */ int corrand_one_integer_4__(integer *n, integer *i__);
/* Subroutine */ int corrand_integer_knuth_4__(integer *n, integer *ixs);
/* Subroutine */ int corrand_norm_4__(integer *n, doublereal *y1, doublereal *y2);
/* Subroutine */ int corrand4_0_(int n__, integer *n, doublereal *y);
/* Subroutine */ int corrand4_(integer *n, doublereal *y);
/* Subroutine */ int corrand4_restart__(void);
/* Subroutine */ int corrand_comp_4__(doublereal *x, doublereal *rint);
/* Subroutine */ int corrand_onestep_4__(integer *m, integer *ic, integer *ia,
					 integer *ixk);
/* Subroutine */ int corrand_primes_4__(integer *js21, integer *js22, integer 
					*js23);




/* Subroutine */ int random_transf_matr__(integer *if_inverse__,
					  doublereal *a, integer *n,
					  doublereal *w, integer *nsteps,
					  integer *ifinit, 
					  integer *keep, integer *lused);
/* Subroutine */ int random_transf__(doublereal *x, doublereal *y,
				     doublereal *w);
/* Subroutine */ int random_transf_init__(integer *nsteps, integer *n, 
					  doublereal *w, integer *keep);
/* Subroutine */ int random_transf_inverse__(doublereal *x, doublereal *y, 
					     doublereal *w);
/* Subroutine */ int random_transf_usefft__(integer *n, doublereal *x, 
					    doublereal *wsave,
					    doublereal *alphas, doublereal *betas,
					    integer *ixs, integer *ixs2,
					    doublereal *w2, integer *k);
/* Subroutine */ int random_transf_usefft_inv__(integer *n, doublereal *x, 
						doublereal *wsave,
						doublereal *alphas,
						doublereal *betas,
						integer *ixs, integer *ixs2,
						doublereal *w2, integer *k);
/* Subroutine */ int random_transf0_inv__(integer *nsteps, doublereal *x, 
					  doublereal *y, integer *n,
					  doublereal *w2, doublereal *albetas, 
					  integer *iixs);
/* Subroutine */ int random_transf00_inv__(doublereal *x, doublereal *y, 
					   integer *n,
					   doublereal *alphas, doublereal *betas,
					   integer *ixs);
/* Subroutine */ int random_transf0__(integer *nsteps, doublereal *x, 
				      doublereal *y, integer *n,
				      doublereal *w2, doublereal *albetas, 
				      integer *iixs);
/* Subroutine */ int random_transf00__(doublereal *x, doublereal *y, integer *
				       n, doublereal *alphas, doublereal *betas,
				       integer *ixs);
/* Subroutine */ int random_transf_init0__(integer *nsteps, integer *n, 
					   doublereal *albetas, integer *ixs);
/* Subroutine */ int random_transf_init00__(integer *n, doublereal *alphas, 
					    doublereal *betas, integer *ixs);
/* Subroutine */ int random_transf_small_init__(integer *n, doublereal *umatr,
						doublereal *w);
/* Subroutine */ int random_transf_piv__(doublereal *b, integer *n, integer *m,
					 doublereal *eps, doublereal *rnorms,
					 integer *ipivots, integer *ncols);
/* Subroutine */ int random_transf_scap__(doublereal *x, doublereal *y, 
					  integer *n, doublereal *prod);
/* Subroutine */ int random_transf_small__0_(int n__, integer *n, doublereal *u,
					     doublereal *x, doublereal *y);
/* Subroutine */ int random_transf_small__(integer *n, doublereal *u, 
					   doublereal *x, doublereal *y);
/* Subroutine */ int random_transf_small_inv__(integer *n, doublereal *u, 
					       doublereal *x, doublereal *y);
/* Subroutine */ int random_transf_copy__(doublereal *a, doublereal *b, 
					  integer *n);


/* ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc */


/*        This file contains four user-callable subroutines: corrand4, */
/*        corrand_norm_4, corrand_integer_knuth_4, corrand_one_integer_4. */
/*        Following is a brief description of the said four subroutines. */

/*   corrand4 - returns to the user a pseudo-random vector distributed */
/*        uniformly on the interval [0,1]. The algorithm used by this */
/*        subroutine is a pompous one: constructs nine pseudo-random */
/*        sequences using nine different congruential generators, */
/*        averages them, and uses the obvious transformation to bring it */
/*        back to the uniform distribution. */

/*   corrand_norm_4 - returns to the user two random vectors y1, y2, */
/*        each of which is distributed normally with the */
/*        distribution density */

/*        1/sqrt(2 * \pi) * e^(y^2/2)                         (1) */

/*   corrand_integer_knuth_4 - for a user-specified n, returns to */
/*        the user a random permutation of n integers 1,2,...,n */

/*   corrand_one_integer_4 - for a user-specified n, returns to */
/*        the user a random integer on the interval [1,n] */


/* cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc */




/* Subroutine */ int corrand_one_integer_4__(integer *n, integer *i__)
{
    static doublereal tt[10];
    extern /* Subroutine */ int corrand4_(integer *, doublereal *);


/*        This subroutine returns to the user a random integer */
/*        number i on the interval [0,n] */

    corrand4_(&c__1, &tt[5]);

    *i__ = (integer) (tt[5] * *n);
    ++(*i__);

    return 0;
} /* corrand_one_integer_4__ */






/* Subroutine */ int corrand_integer_knuth_4__(integer *n, integer *ixs)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static doublereal h__;
    static integer i__, j, k, jj;
    static doublereal tt[12], done;
    extern /* Subroutine */ int corrand4_(integer *, doublereal *);


/*        This subroutine returns to the user a random permutation */
/*        of n integer numbers 1,2,...,n. */

/*              Input parameters: */

/*  n - random numbers in the array ixs will be the distributed */
/*        uniformly on the interval [1,n] */

/*              Output parameters: */

/*  ixs - a pseudo-random permutation of length n */

    /* Parameter adjustments */
    --ixs;

    /* Function Body */
    corrand4_(&c__11, tt);
    corrand4_(&c__11, tt);
    corrand4_(&c__11, tt);
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	ixs[i__] = i__;
/* L1200: */
    }

    done = 1.;
    i__1 = *n - 1;
    for (i__ = 1; i__ <= i__1; ++i__) {

	corrand4_(&c__1, tt);

	k = *n - i__ + 1;
/* ccc        call prinf('k=*',k,1) */
	h__ = done / k;
	j = (integer) (tt[0] / h__ + 1);
/* ccc        call prinf('and j=*',j,1) */

	jj = ixs[k];
	ixs[k] = ixs[j];
	ixs[j] = jj;
/* L1400: */
    }

    return 0;
} /* corrand_integer_knuth_4__ */






/* Subroutine */ int corrand_norm_4__(integer *n, doublereal *y1, doublereal *
	y2)
{
    /* System generated locals */
    integer i__1;

    /* Builtin functions */
    double atan(doublereal), log(doublereal), sqrt(doublereal), cos(
	    doublereal), sin(doublereal);

    /* Local variables */
    static integer i__;
    static doublereal z1, z2, pi, done;
    extern /* Subroutine */ int corrand4_(integer *, doublereal *);


/*        This subroutine returns to the user two random */
/*        vectors y1, y2, each of which is distiibuted */
/*        normally with the distribution density */

/*        1/sqrt(2 * \pi) * e^(y^2/2)                         (1) */


/*              Input parameters: */

/*  n - the number of elements to be returned in each of the */
/*        arrays y1, y2 */

/*              Output parameters: */
/*  y1, y2 - two pseudo-random arrays distributed normally */
/*        with the distribution density (1) */


/*        . . . construct vectors of variables distributed */
/*              uniformly on the interval [0,1] */

    /* Parameter adjustments */
    --y2;
    --y1;

    /* Function Body */
    corrand4_(n, &y1[1]);
    corrand4_(n, &y2[1]);

/*       combine the variables y1, y2 converting them */
/*       into variables distributed normally (Box-Muller */
/*       algorithm) */

    done = 1.;
    pi = atan(done) * 4;
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	z1 = sqrt(log(y1[i__]) * -2) * cos(pi * 2 * y2[i__]);
	z2 = sqrt(log(y1[i__]) * -2) * sin(pi * 2 * y2[i__]);

	y1[i__] = z1;
	y2[i__] = z2;
/* L1400: */
    }

    return 0;
} /* corrand_norm_4__ */

/* Subroutine */ int corrand4_0_(int n__, integer *n, doublereal *y)
{
    /* Initialized data */

    static integer ias[10] = { 97,17,31,37,43,53,61,67,79,91 };
    static integer ifcalled = 0;

    /* System generated locals */
    integer i__1;

    /* Local variables */
    extern /* Subroutine */ int corrand_primes_4__(integer *, integer *, 
	    integer *);
    static doublereal d__;
    static integer i__, j;
    extern /* Subroutine */ int corrand_onestep_4__(integer *, integer *, 
	    integer *, integer *);
    static doublereal ds[10], dd1, dd2, dd3;
    static integer js21[10], js22[10], js23[10];
    static doublereal done;
    static integer ixks[10];
    extern /* Subroutine */ int corrand_comp_4__(doublereal *, doublereal *);

/* cc        data ias/7,17,31,37,43,53,61,67,79,91/ */
    /* Parameter adjustments */
    if (y) {
	--y;
	}

    /* Function Body */
    switch(n__) {
	case 1: goto L_corrand4_restart;
	}

    done = 1.;

/*       retrieve the prime numbers and conduct preliminary */
/*       randomization */

    if (ifcalled != 0) {
	goto L1350;
    }

    corrand_primes_4__(js21, js22, js23);

    for (i__ = 1; i__ <= 10; ++i__) {

	ixks[i__ - 1] = js21[i__ - 1];
/* L1200: */
    }
    ifcalled = 1;

    for (i__ = 1; i__ <= 100; ++i__) {
	for (j = 1; j <= 9; ++j) {

	    corrand_onestep_4__(&js23[j - 1], &js22[j - 1], &ias[j - 1], &
		    ixks[j - 1]);
/* L1250: */
	}
/* L1300: */
    }

L1350:

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	for (j = 1; j <= 3; ++j) {
	    corrand_onestep_4__(&js23[j - 1], &js22[j - 1], &ias[j - 1], &
		    ixks[j - 1]);

	    ds[j - 1] = ixks[j - 1] * done / (js23[j - 1] - 1);
/* L1400: */
	}

	d__ = ds[0] + ds[1] + ds[2];
	corrand_comp_4__(&d__, &dd1);

	for (j = 4; j <= 6; ++j) {
	    corrand_onestep_4__(&js23[j - 1], &js22[j - 1], &ias[j - 1], &
		    ixks[j - 1]);

	    ds[j - 1] = ixks[j - 1] * done / (js23[j - 1] - 1);
/* L1600: */
	}

	d__ = ds[3] + ds[4] + ds[5];
	corrand_comp_4__(&d__, &dd2);

	for (j = 7; j <= 9; ++j) {
	    corrand_onestep_4__(&js23[j - 1], &js22[j - 1], &ias[j - 1], &
		    ixks[j - 1]);

	    ds[j - 1] = ixks[j - 1] * done / (js23[j - 1] - 1);
/* L1800: */
	}

	d__ = ds[6] + ds[7] + ds[8];
	corrand_comp_4__(&d__, &dd3);

	d__ = dd1 + dd2 + dd3;
	corrand_comp_4__(&d__, &y[i__]);

/* L2000: */
    }

    return 0;

L_corrand4_restart:
    ifcalled = 0;
    return 0;
    return 0;
} /* corrand4_ */

/* Subroutine */ int corrand4_(integer *n, doublereal *y)
{
    return corrand4_0_(0, n, y);
    }

/* Subroutine */ int corrand4_restart__(void)
{
    return corrand4_0_(1, (integer *)0, (doublereal *)0);
    }






/* Subroutine */ int corrand_comp_4__(doublereal *x, doublereal *rint)
{
    /* System generated locals */
    doublereal d__1;


    if (*x < 1.) {
/* Computing 3rd power */
	d__1 = *x;
	*rint = d__1 * (d__1 * d__1) / 6;
	return 0;
    }

    if (*x >= 1. && *x <= 2.) {
/* Computing 3rd power */
	d__1 = *x - 1.5;
	*rint = *x * .75 - d__1 * (d__1 * d__1) / 3 - .625;
	return 0;
    }

/* Computing 3rd power */
    d__1 = *x - 3;
    *rint = d__1 * (d__1 * d__1) / 6 + 1;

    return 0;
} /* corrand_comp_4__ */






/* Subroutine */ int corrand_onestep_4__(integer *m, integer *ic, integer *ia,
	 integer *ixk)
{
    static integer j, jj;


    jj = *ia * *ixk + *ic;
    j = jj / *m;
    *ixk = jj - j * *m;

    return 0;
} /* corrand_onestep_4__ */






/* Subroutine */ int corrand_primes_4__(integer *js21, integer *js22, integer 
	*js23)
{
    /* Initialized data */

    static integer is21[10] = { 9,19,21,55,61,69,105,111,121,129 };
    static integer is22[10] = { 3,17,27,33,57,87,105,113,117,123 };
    static integer is23[10] = { 15,21,27,37,61,69,135,147,157,159 };

    static integer i__, i21, i22, i23;


    /* Parameter adjustments */
    --js23;
    --js22;
    --js21;

    /* Function Body */

    i21 = 2097152;
    i22 = i21 << 1;
    i23 = i22 << 1;

    for (i__ = 1; i__ <= 10; ++i__) {

	js21[i__] = i21 - is21[i__ - 1];
	js22[i__] = i22 - is22[i__ - 1];
	js23[i__] = i23 - is23[i__ - 1];
/* L1200: */
    }

    return 0;
} /* corrand_primes_4__ */

/* ccccccccccc */

/*       random_transf4.f */

/* cccc */


/* ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc */

/*       This is the end of the debugging code, and the beginning of the */
/*       random transform code proper */

/* ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc */

/*       This file contains 6 user-callable subroutines: random_transf, */
/*       random_transf_inverse, random_transf_c,random_transf_c_inverse, */
/*       random_transf_init. Following is a brief description of these */
/*       subroutines. */

/*   random_transf_matr - applies rapidly a fairly random orthogonal */
/*       matrix to the user-supplied matrix a */

/*   random_transf - applies rapidly a fairly random orthogonal matrix to */
/*       the user-supplied vector x, using the data in array w stored there */
/*       by a preceding call to the subroutine random_transf_init (see) */

/*   random_transf_inverse - applies rapidly the inverse of the operator */
/*       applied by the subroutine random_transf_inverse */

/*   random_transf_init - initialization subroutine. It prepares and stores */
/*        in array w the data used by the subroutines random_transf, */
/*        random_transf_c (see). */

/* cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc */



/* Subroutine */ int random_transf_matr__(integer *if_inverse__, doublereal *
	a, integer *n, doublereal *w, integer *nsteps, integer *ifinit, 
	integer *keep, integer *lused)
{
    /* System generated locals */
    integer a_dim1, a_offset, i__1, i__2;

    /* Local variables */
    static integer i__, j;
    extern /* Subroutine */ int random_transf_init__(integer *, integer *, 
	    doublereal *, integer *), random_transf_copy__(doublereal *, 
	    doublereal *, integer *);
    static integer iww, lww, iwww, lwww;
    extern /* Subroutine */ int random_transf__(doublereal *, doublereal *, 
	    doublereal *), random_transf_inverse__(doublereal *, doublereal *,
	     doublereal *);


/*       This subroutine applies a "fast" random orthogonal */
/*       transformation to the user-supplied matrix a(n,n). In other */
/*       words, it replaces the input matrix a with the matrix */

/*                U^{-1} A U, */

/*       where A is the user-supplied matrix, and U is defined by the */
/*       subroutine random_transf (see) */

/*                     Input parameters: */

/*  if_inverse - integer parameter telling the subroutine whether it */
/*       should apply the forward (if_inverse=0) or inverse (if_inverse=1) */
/*       transformation */
/*  a - the n \times n matrix to be transformed */
/*  n - the dimensionality of the matrix a */
/*  w - the array used by the subroutine random_transf (see). Please */
/*       note that w is an input array only if ifinit=0; otherwise, */
/*       it is an output/work array */
/*  nsteps - the number of steps used by the randomizer; 4 is a good */
/*       value */
/*  ifinit - integer parameter telling the subroutine whether a new */
/*       random orthogonal transformation is to be created (ifinit=1), */
/*       or the old one (stored in the array w) is to be used (ifinit=0). */
/*       Please note that for the first call to this subroutine (with a */
/*       given n), ifinit must be set to 1. */

/*                      Output parameters: */

/*  a - the transformed matrix */
/*  w - the array containing data used by the subroutine random_transf */
/*       (see) to apply a random orthogonal matrix to a vector. Please */
/*       note that w is an output array only if ifinit=1; otherwise, */
/*       it is an input/work array. */
/*  keep - the number of double precision elements in array w that must be kept */
/*       unchanged between calls to this subroutine, if the said calls */
/*       are to apply the same orthogonal matrix */
/*  lused - the total number of (real 88) elements of array w actually */
/*       used by this subroutine. Always equal to keep+2*n+4. */


/*       . . . if the user so requested, initialize the random */
/*             matrix subroutine */

    /* Parameter adjustments */
    a_dim1 = *n;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    --w;

    /* Function Body */
    if (*ifinit != 0) {
	random_transf_init__(nsteps, n, &w[1], keep);
    }

/*       allocate memory */

    iww = *keep + 2;
    lww = *n + 2;

    iwww = iww + lww;
    lwww = *n + 2;

    *lused = iwww + lwww;

/*       multiply a from the left by the random matrix */

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	if (*if_inverse__ == 0) {
	    random_transf__(&a[i__ * a_dim1 + 1], &w[iww], &w[1]);
	}
	if (*if_inverse__ != 0) {
	    random_transf_inverse__(&a[i__ * a_dim1 + 1], &w[iww], &w[1]);
	}
	random_transf_copy__(&w[iww], &a[i__ * a_dim1 + 1], n);
/* L1400: */
    }

/*       multiply a from the right by the adjoint of the random */
/*       matrix */

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	i__2 = *n;
	for (j = 1; j <= i__2; ++j) {

	    w[iww + j - 1] = a[i__ + j * a_dim1];
/* L2200: */
	}

	if (*if_inverse__ == 0) {
	    random_transf__(&w[iww], &w[iwww], &w[1]);
	}
	if (*if_inverse__ != 0) {
	    random_transf_inverse__(&w[iww], &w[iwww], &w[1]);
	}

	i__2 = *n;
	for (j = 1; j <= i__2; ++j) {

	    a[i__ + j * a_dim1] = w[iwww + j - 1];
/* L2400: */
	}
/* L2600: */
    }

    return 0;
} /* random_transf_matr__ */






/* Subroutine */ int random_transf__(doublereal *x, doublereal *y, doublereal 
	*w)
{
    static integer ialbetas, k, n, iu, iww;
    extern /* Subroutine */ int random_transf_small__(integer *, doublereal *,
	     doublereal *, doublereal *);
    static integer iixs, iixs2, iixs3;
    extern /* Subroutine */
      int random_transf_usefft__(integer *n, doublereal *x, 
				 doublereal *wsave,
				 doublereal *alphas, doublereal *betas,
				 integer *ixs, integer *ixs2,
				 doublereal *w2, integer *k);
    extern
      int random_transf0__(integer *nsteps, doublereal *x, 
			   doublereal *y, integer *n,
			   doublereal *w2, doublereal *albetas, 
			   integer *iixs);
    static integer iwsave, nsteps, ibetas2, ialphas2;




    
/*        This subroutine applies rapidly a fairly random */
/*        orthogonal matrix to the user-specified real vector x, */
/*        using the data in array w stored there by a preceding */
/*        call to the subroutine random_transf_init (see) */

/*                Input parameters: */

/*  x - the vector of length n to which the matrix is to be applied */
/*  w - array containing all the data to be used by this subroutine. */

/*                Output parameters: */

/*  y - the results of applying the said matrix to the said vector */

/*        . . . if n is less than 21 -  act accordingly */

    /* Parameter adjustments */
    --w;
    --y;
    --x;

    /* Function Body */
    n = (integer) w[5];
    if (n > 5) {
	goto L1100;
    }
    iu = 11;

    random_transf_small__(&n, &w[iu], &x[1], &y[1]);

    return 0;
L1100:


/*        . . . allocate memory */

    ialbetas = (integer) w[1];
    iixs = (integer) w[2];
    nsteps = (integer) w[3];
    iww = (integer) w[4];
    n = (integer) w[5];
    k = (integer) w[6];
    iwsave = (integer) w[7];
    iixs2 = (integer) w[8];
    ialphas2 = (integer) w[9];
    ibetas2 = (integer) w[10];
    iixs3 = (integer) w[11];

    random_transf0__(&nsteps, &x[1], &y[1], &n, &w[iww], &w[ialbetas],
		     (integer*)(&w[iixs]));

    random_transf_usefft__(&n, &y[1], &w[iwsave], &w[ialphas2], &w[ibetas2],
			   (integer*)(&w[iixs3]), (integer*)(&w[iixs2]),
			   &w[iww], &k);
    return 0;
} /* random_transf__ */






/* Subroutine */ int random_transf_init__(integer *nsteps, integer *n, 
	doublereal *w, integer *keep)
{
    static integer ialbetas, lalbetas, i__, k;
    extern /* Subroutine */ int random_transf_small_init__(integer *, 
	    doublereal *, doublereal *);
    static integer iw, lw, iww, lww;

    extern /* Subroutine */
      int random_transf_init0__(integer *nsteps, integer *n, 
				doublereal *albetas, integer *ixs);
    static integer iww2, lww2;
    extern /* Subroutine */
      int random_transf_init00__(integer *n, doublereal *alphas, 
				 doublereal *betas, integer *ixs);
    static integer iixs, lixs, iixs2, iixs3, lixs2, lixs3;
    extern /* Subroutine */ int dcffti_(integer *, doublereal *);
    static integer ninire, iwsave, iumatr, lwsave, lumatr, ibetas2, lbetas2;
    extern /* Subroutine */ int corrand_integer_knuth_4__(integer *, integer *
	    );
    static integer ialphas2, lalphas2;


/*        This is the initialization subroutine. It prepares and stores */
/*        in array w the data used by the subroutines random_transf, */
/*        random_transf_c (see) to apply rapidly a fairly random */
/*        orthogonal matrix to an arbitrary user-specified vector. */

/*                Input parameters: */

/*  nsteps - the degree of randomness of the operator to be applied */
/*  n - the dimensionality of the matrix to be applied */

/*                Output parameters: */

/*  w - the first keep elements of w contain all the data to be used */
/*        by the subroutine. Please note that the number of elements */
/*        by this subroutine is also equal to keep. The length of */
/*        this array should be at least */
/*        2*nsteps*n + nsteps*n/ninire +8*n +n/4 + 2*n/ninire + 300. */

/*  keep - the number of elements in w that have been actually used */
/*        by this subroutine; also the number that should not be */
/*        changed between the call to this subroutine and the subsequent */
/*        calls to the subroutine random_transf (see). */

/*        . . . if n is less than 21, act accordingly */

/*       call prinf('n=*',n,1) */

    /* Parameter adjustments */
    --w;

    /* Function Body */
    if (*n > 5) {
	goto L1100;
    }
    iumatr = 11;
    lumatr = *n * *n + 2;

    iw = iumatr + lumatr;
    lw = *n * (*n + 2) + 4;

    random_transf_small_init__(n, &w[iumatr], &w[iw]);
    *keep = *n * *n + 12;
    w[5] = *n + .1f;
    return 0;

L1100:

/*        . . . allocate memory */

    ninire = 2;

    ialbetas = 20;
    lalbetas = (*n << 1) * *nsteps + 10;

    iixs = ialbetas + lalbetas;
    lixs = *n * *nsteps / ninire + 10;

/*        find the size of the FFT to be used */

    k = 1;
    for (i__ = 1; i__ <= 1000; ++i__) {

	if (k > *n) {
	    goto L1400;
	}

	k <<= 1;
/* L1200: */
    }
L1400:

    k /= 4;

    iwsave = iixs + lixs;
    lwsave = (k << 2) + 30;

    iixs2 = iwsave + lwsave;
    lixs2 = *n / ninire + 5;

    ialphas2 = iixs2 + lixs2;
    lalphas2 = *n + 4;

    ibetas2 = ialphas2 + lalphas2;
    lbetas2 = *n + 4;

    iixs3 = ibetas2 + lbetas2;
    lixs3 = *n / ninire + 5;
    iww = iixs3 + lixs3;
    lww = (*n << 1) + *n / 4 + 20;

    iww2 = iww + lww;
    lww2 = (*n << 1) + *n / 4 + 20;

    *keep = iww2 + lww2;

    w[1] = ialbetas + .1f;
    w[2] = iixs + .1f;
    w[3] = *nsteps + .1f;
    w[4] = iww + .1f;
    w[5] = *n + .1f;
    w[6] = k + .1f;
    w[7] = iwsave + .1f;
    w[8] = iixs2 + .1f;
    w[9] = ialphas2 + .1f;
    w[10] = ibetas2 + .1f;
    w[11] = iixs3 + .1f;
    w[12] = iww2 + .1f;

    random_transf_init0__(nsteps, n, &w[ialbetas], (integer*)(&w[iixs]));

    dcffti_(&k, (doublereal*)(&w[iwsave]));
    corrand_integer_knuth_4__(n, (integer*)&w[iixs2]);
    random_transf_init00__(n, &w[ialphas2], &w[ibetas2], (integer*)(&w[iixs3]));

    return 0;
} /* random_transf_init__ */





/* Subroutine */ int random_transf_inverse__(doublereal *x, doublereal *y, 
	doublereal *w)
{
    static integer ialbetas;
    extern /* Subroutine */
      int random_transf_small_inv__(integer *n, doublereal *u, 
				    doublereal *x, doublereal *y);
    static integer k, n;
    extern /* Subroutine */
      int random_transf_usefft_inv__(integer *n, doublereal *x, 
				     doublereal *wsave,
				     doublereal *alphas,
				     doublereal *betas,
				     integer *ixs, integer *ixs2,
				     doublereal *w2, integer *k);
    static integer iu;
    extern /* Subroutine */
      int random_transf0_inv__(integer *nsteps, doublereal *x, 
			       doublereal *y, integer *n,
			       doublereal *w2, doublereal *albetas, 
			       integer *iixs);
    static integer iww, iww2, iixs, iixs2, iixs3, iwsave, nsteps, ibetas2, 
	    ialphas2;


/*        This subroutine applies rapidly a fairly random */
/*        orthogonal matrix to the user-specified real vector x, */
/*        using the data in array w stored there by a preceding */
/*        call to the subroutine random_transf_init (see) */

/*        PLEASE NOTE THAT the transformation applied by this */
/*        subroutine is the inverse of the transformation applied */
/*        by the subroutine random_transf (see) */


/*                Input parameters: */

/*  x - the vector of length n to which the matrix is to be applied */
/*  w - array containing all the data to be used by this subroutine. */

/*                Output parameters: */

/*  y - the result of applying the said matrix to the said vector */

/*        . . . if n is less than 21 -  act accordingly */


    /* Parameter adjustments */
    --w;
    --y;
    --x;

    /* Function Body */
    n = (integer) w[5];
    if (n > 5) {
	goto L1100;
    }
    iu = 11;

    random_transf_small_inv__(&n, &w[iu], &x[1], &y[1]);

    return 0;
L1100:

/*        . . . allocate memory */

    ialbetas = (integer) w[1];
    iixs = (integer) w[2];
    nsteps = (integer) w[3];
    iww = (integer) w[4];
    n = (integer) w[5];
    k = (integer) w[6];
    iwsave = (integer) w[7];
    iixs2 = (integer) w[8];
    ialphas2 = (integer) w[9];
    ibetas2 = (integer) w[10];
    iixs3 = (integer) w[11];
    iww2 = (integer) w[12];

/*       undo the effects of the FFT block */

    random_transf_copy__(&x[1], &w[iww2], &n);
    random_transf_usefft_inv__(&n,
			       &w[iww2], &w[iwsave], &w[ialphas2], &w[ibetas2],
			       (integer*)(&w[iixs3]), (integer*)(&w[iixs2]),
			       &w[iww], &k);

/*       undo the effects of the rotations */

    random_transf0_inv__(&nsteps,
			 &w[iww2], &y[1], &n, &w[iww], &w[ialbetas], 
			 (integer*)(&w[iixs]));

    return 0;
} /* random_transf_inverse__ */





/* Subroutine */ int random_transf_usefft__(integer *n, doublereal *x, 
	doublereal *wsave, doublereal *alphas, doublereal *betas, integer *
	ixs, integer *ixs2, doublereal *w2, integer *k)
{
    /* System generated locals */
    integer i__1;

    /* Builtin functions */
    double sqrt(doublereal);

    /* Local variables */
    static doublereal d__;
    static integer i__, j;
    static doublereal done;
    extern /* Subroutine */ int dcfftf_(integer *, doublereal *, doublereal *)
	    , random_transf00__(doublereal *, doublereal *, integer *, 
	    doublereal *, doublereal *, integer *);


/*       perform the extra permutation */

    /* Parameter adjustments */
    --x;
    --wsave;
    --alphas;
    --betas;
    --ixs;
    --ixs2;
    --w2;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	j = ixs2[i__];
	w2[i__] = x[j];
/* L1200: */
    }

/*        apply the FFT */

    dcfftf_(k, &w2[1], &wsave[1]);

    done = 1.;
    d__ = sqrt(done / *k);
    i__1 = *k << 1;
    for (i__ = 1; i__ <= i__1; ++i__) {

	w2[i__] *= d__;
/* L1600: */
    }

/*        . . . apply the permutation & combination */

    random_transf00__(&w2[1], &x[1], n, &alphas[1], &betas[1], &ixs[1]);

    return 0;
} /* random_transf_usefft__ */






/* Subroutine */ int random_transf_usefft_inv__(integer *n, doublereal *x, 
	doublereal *wsave, doublereal *alphas, doublereal *betas, integer *
	ixs, integer *ixs2, doublereal *w2, integer *k)
{
    /* System generated locals */
    integer i__1;

    /* Builtin functions */
    double sqrt(doublereal);

    /* Local variables */
    static doublereal d__;
    static integer i__, j;
    extern /* Subroutine */ int random_transf00_inv__(doublereal *, 
	    doublereal *, integer *, doublereal *, doublereal *, integer *);
    static doublereal done;
    extern /* Subroutine */ int dcfftb_(integer *, doublereal *, doublereal *);


/*       undo the permutation and combination */

    /* Parameter adjustments */
    --x;
    --wsave;
    --alphas;
    --betas;
    --ixs;
    --ixs2;
    --w2;

    /* Function Body */
    random_transf00_inv__(&x[1], &w2[1], n, &alphas[1], &betas[1], &ixs[1]);

/*       . . . and the FFT */

    dcfftb_(k, &w2[1], &wsave[1]);
/* ccc        call DCFFTf(k,w2,WSAVE) */

    done = 1.;
    d__ = sqrt(done / *k);
    i__1 = *k << 1;
    for (i__ = 1; i__ <= i__1; ++i__) {

	w2[i__] *= d__;
/* L1200: */
    }

/*       undo the extra permutation */

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	j = ixs2[i__];
	x[j] = w2[i__];
/* L1100: */
    }

    return 0;
} /* random_transf_usefft_inv__ */








/* Subroutine */ int random_transf0_inv__(integer *nsteps, doublereal *x, 
	doublereal *y, integer *n, doublereal *w2, doublereal *albetas, 
	integer *iixs)
{
    /* System generated locals */
    integer albetas_dim1, albetas_offset, iixs_dim1, iixs_offset, i__1;

    /* Local variables */
    static integer i__, j;
    extern /* Subroutine */ int random_transf00_inv__(doublereal *, 
	    doublereal *, integer *, doublereal *, doublereal *, integer *);
    static integer ijk;


    /* Parameter adjustments */
    --x;
    --y;
    iixs_dim1 = *n;
    iixs_offset = 1 + iixs_dim1;
    iixs -= iixs_offset;
    albetas_dim1 = *n;
    albetas_offset = 1 + albetas_dim1 * 3;
    albetas -= albetas_offset;
    --w2;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	w2[i__] = x[i__];
/* L1200: */
    }

    for (ijk = *nsteps; ijk >= 1; --ijk) {

	random_transf00_inv__(&w2[1], &y[1], n, &albetas[((ijk << 1) + 1) * 
		albetas_dim1 + 1], &albetas[((ijk << 1) + 2) * albetas_dim1 + 
		1], &iixs[ijk * iixs_dim1 + 1]);

	i__1 = *n;
	for (j = 1; j <= i__1; ++j) {

	    w2[j] = y[j];
/* L1400: */
	}
/* L2000: */
    }

    return 0;
} /* random_transf0_inv__ */






/* Subroutine */ int random_transf00_inv__(doublereal *x, doublereal *y, 
	integer *n, doublereal *alphas, doublereal *betas, integer *ixs)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__, j;
    static doublereal d1, d2;


/*        implement 2 \times 2 matrices */

    /* Parameter adjustments */
    --ixs;
    --betas;
    --alphas;
    --y;
    --x;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {
	y[i__] = x[i__];
/* L1600: */
    }

    for (i__ = *n - 1; i__ >= 1; --i__) {

	d1 = alphas[i__] * y[i__] - betas[i__] * y[i__ + 1];
	d2 = betas[i__] * y[i__] + alphas[i__] * y[i__ + 1];

	y[i__] = d1;
	y[i__ + 1] = d2;
/* L1800: */
    }

/*       implement the permutation */

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	j = ixs[i__];
	x[j] = y[i__];
/* L2600: */
    }

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	y[i__] = x[i__];
/* L2800: */
    }

    return 0;
} /* random_transf00_inv__ */





/* Subroutine */ int random_transf0__(integer *nsteps, doublereal *x, 
	doublereal *y, integer *n, doublereal *w2, doublereal *albetas, 
	integer *iixs)
{
    /* System generated locals */
    integer albetas_dim1, albetas_offset, iixs_dim1, iixs_offset, i__1, i__2;

    /* Local variables */
    static integer i__, j, ijk;
    extern /* Subroutine */ int random_transf00__(doublereal *, doublereal *, 
	    integer *, doublereal *, doublereal *, integer *);


    /* Parameter adjustments */
    --x;
    --y;
    iixs_dim1 = *n;
    iixs_offset = 1 + iixs_dim1;
    iixs -= iixs_offset;
    albetas_dim1 = *n;
    albetas_offset = 1 + albetas_dim1 * 3;
    albetas -= albetas_offset;
    --w2;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	w2[i__] = x[i__];
/* L1200: */
    }

    i__1 = *nsteps;
    for (ijk = 1; ijk <= i__1; ++ijk) {

	random_transf00__(&w2[1], &y[1], n, &albetas[((ijk << 1) + 1) * 
		albetas_dim1 + 1], &albetas[((ijk << 1) + 2) * albetas_dim1 + 
		1], &iixs[ijk * iixs_dim1 + 1]);

	i__2 = *n;
	for (j = 1; j <= i__2; ++j) {

	    w2[j] = y[j];
/* L1400: */
	}
/* L2000: */
    }

    return 0;
} /* random_transf0__ */






/* Subroutine */ int random_transf00__(doublereal *x, doublereal *y, integer *
	n, doublereal *alphas, doublereal *betas, integer *ixs)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__, j;
    static doublereal d1, d2;


/*       implement the permutation */

    /* Parameter adjustments */
    --ixs;
    --betas;
    --alphas;
    --y;
    --x;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	j = ixs[i__];
	y[i__] = x[j];
/* L1600: */
    }

/*        implement 2 \times 2 matrices */

    i__1 = *n - 1;
    for (i__ = 1; i__ <= i__1; ++i__) {

	d1 = alphas[i__] * y[i__] + betas[i__] * y[i__ + 1];
	d2 = -betas[i__] * y[i__] + alphas[i__] * y[i__ + 1];

	y[i__] = d1;
	y[i__ + 1] = d2;
/* L1800: */
    }

    return 0;
} /* random_transf00__ */






/* Subroutine */ int random_transf_init0__(integer *nsteps, integer *n, 
	doublereal *albetas, integer *ixs)
{
    /* System generated locals */
    integer albetas_dim1, albetas_offset, ixs_dim1, ixs_offset, i__1;

    /* Local variables */
    static integer ijk;
    extern /* Subroutine */ int random_transf_init00__();


    /* Parameter adjustments */
    ixs_dim1 = *n;
    ixs_offset = 1 + ixs_dim1;
    ixs -= ixs_offset;
    albetas_dim1 = *n;
    albetas_offset = 1 + albetas_dim1 * 3;
    albetas -= albetas_offset;

    /* Function Body */
    i__1 = *nsteps;
    for (ijk = 1; ijk <= i__1; ++ijk) {

	random_transf_init00__(n, &albetas[((ijk << 1) + 1) * albetas_dim1 + 
		1], &albetas[((ijk << 1) + 2) * albetas_dim1 + 1], &ixs[ijk * 
		ixs_dim1 + 1]);

/* L2000: */
    }
    return 0;
} /* random_transf_init0__ */






/* Subroutine */ int random_transf_init00__(integer *n, doublereal *alphas, 
	doublereal *betas, integer *ixs)
{
    /* System generated locals */
    integer i__1;

    /* Builtin functions */
    double sqrt(doublereal);

    /* Local variables */
    static integer ifrepeat;
    static doublereal d__;
    static integer i__;
    extern /* Subroutine */ int corrand_integer_knuth_4__(integer *, integer *
	    ), corrand4_(integer *, doublereal *);


/*       construct the random permutation */

    /* Parameter adjustments */
    --ixs;
    --betas;
    --alphas;

    /* Function Body */
    ifrepeat = 0;
    corrand_integer_knuth_4__(n, &ixs[1]);

/*       construct the random variables */

    i__1 = *n / 2;
    corrand4_(&i__1, &alphas[1]);
    i__1 = *n / 2;
    corrand4_(&i__1, &betas[1]);
    corrand4_(n, &alphas[1]);
    corrand4_(n, &betas[1]);

/*       construct the random 2 \times 2 transformations */

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

/* ANDREI: **2 */
/*        d=alphas(i)**2+betas(i)**2 */
	d__ = alphas[i__] * alphas[i__] + betas[i__] * betas[i__];
	d__ = 1 / sqrt(d__);
	alphas[i__] *= d__;
	betas[i__] *= d__;
/* L1400: */
    }
    return 0;
} /* random_transf_init00__ */





/* Subroutine */ int random_transf_small_init__(integer *n, doublereal *umatr,
	 doublereal *w)
{
    /* System generated locals */
    integer umatr_dim1, umatr_offset, w_dim1, w_offset, i__1, i__2;

    /* Local variables */
    static integer i__, j;
    extern /* Subroutine */ int random_transf_piv__(doublereal *, integer *, 
	    integer *, doublereal *, doublereal *, integer *, integer *);
    static doublereal eps;
    static integer ncols;
    extern /* Subroutine */ int corrand_norm_4__(integer *, doublereal *, 
	    doublereal *);
    static doublereal rnorms[1000];
    static integer ipivots[10000];


/*       generate the random matrix */

    /* Parameter adjustments */
    w_dim1 = *n;
    w_offset = 1 + w_dim1;
    w -= w_offset;
    umatr_dim1 = *n;
    umatr_offset = 1 + umatr_dim1;
    umatr -= umatr_offset;

    /* Function Body */
    i__1 = *n * *n;
    corrand_norm_4__(&i__1, &w[w_offset], &umatr[umatr_offset]);
    i__1 = *n << 1;
    corrand_norm_4__(&i__1, &w[(*n + 1) * w_dim1 + 1], &umatr[umatr_offset]);
/*        call prin2('w as created, w=*',w,n*(n+2) ) */

/*       run the obtained random matrix through */
/*       the Gram-Schmidr */

    eps = 0.;
    i__1 = *n + 2;
    random_transf_piv__(&w[w_offset], n, &i__1, &eps, rnorms, ipivots, &ncols)
	    ;

/*        call prin2('and rnorms=*',rnorms,ncols) */

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {
	i__2 = *n;
	for (j = 1; j <= i__2; ++j) {

	    umatr[j + i__ * umatr_dim1] = w[j + i__ * w_dim1];
/* L2200: */
	}
/* L2400: */
    }

    return 0;
} /* random_transf_small_init__ */






/* Subroutine */ int random_transf_piv__(doublereal *b, integer *n, integer *
	m, doublereal *eps, doublereal *rnorms, integer *ipivots, integer *
	ncols)
{
    /* System generated locals */
    integer b_dim1, b_offset, i__1, i__2, i__3;

    /* Builtin functions */
    double sqrt(doublereal);

    /* Local variables */
    static doublereal d__;
    static integer i__, j, l;
    static doublereal cd, rn;
    extern /* Subroutine */ int random_transf_scap__(doublereal *, doublereal 
	    *, integer *, doublereal *);
    static doublereal rrn, done;
    static integer iijj;
    static doublereal dtot, thresh;
    static integer ipivot;


/*        . . . initialize the array of pivots */

    /* Parameter adjustments */
    b_dim1 = *n;
    b_offset = 1 + b_dim1;
    b -= b_offset;
    --rnorms;
    --ipivots;

    /* Function Body */
    i__1 = *m;
    for (i__ = 1; i__ <= i__1; ++i__) {
	ipivots[i__] = i__;
/* L1100: */
    }

/*       . . . prepare the array of values of norms */
/*             of columns */

    done = 1.;
    dtot = 0.;
    i__1 = *m;
    for (i__ = 1; i__ <= i__1; ++i__) {

	d__ = 0.;
	i__2 = *n;
	for (j = 1; j <= i__2; ++j) {
	    d__ += b[j + i__ * b_dim1] * b[j + i__ * b_dim1];
/* L1200: */
	}
	rnorms[i__] = sqrt(d__);
	dtot += d__;
/* L1400: */
    }

/* ANDREI: **2 */
/*        thresh=dtot*eps**2 */
    thresh = dtot * *eps * *eps;
    thresh = sqrt(thresh);

/*       . . . conduct gram-schmidt iterations */

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

/*       find the pivot */

	ipivot = i__;
	rn = rnorms[i__];

	i__2 = *m;
	for (j = i__ + 1; j <= i__2; ++j) {
	    if (rnorms[j] <= rn) {
		goto L2200;
	    }
	    rn = rnorms[j];
	    ipivot = j;
L2200:
	    ;
	}
/* L2400: */

/*       put the column number ipivot in the i-th place */

	i__2 = *n;
	for (j = 1; j <= i__2; ++j) {
	    cd = b[j + i__ * b_dim1];
	    b[j + i__ * b_dim1] = b[j + ipivot * b_dim1];
	    b[j + ipivot * b_dim1] = cd;
/* L2600: */
	}

	iijj = ipivots[i__];
	ipivots[i__] = ipivots[ipivot];
	ipivots[ipivot] = iijj;

	d__ = rnorms[ipivot];
	rnorms[ipivot] = rnorms[i__];
	rnorms[i__] = d__;

/*       orthogonalize the i-th column to all preceding ones */

	if (i__ == 1) {
	    goto L2790;
	}
	i__2 = i__ - 1;
	for (j = 1; j <= i__2; ++j) {

	    random_transf_scap__(&b[i__ * b_dim1 + 1], &b[j * b_dim1 + 1], n, 
		    &cd);

	    i__3 = *n;
	    for (l = 1; l <= i__3; ++l) {
		b[l + i__ * b_dim1] -= b[l + j * b_dim1] * cd;
/* L2770: */
	    }
/* L2780: */
	}
L2790:

/*       normalize the i-th column */

	random_transf_scap__(&b[i__ * b_dim1 + 1], &b[i__ * b_dim1 + 1], n, &
		cd);

	d__ = cd;
/* ANDREI: **2 */
/*        if(d .lt. thresh**2 ) return */
	if (d__ < thresh * thresh) {
	    return 0;
	}

	*ncols = i__;

	d__ = done / sqrt(d__);
	i__2 = *n;
	for (j = 1; j <= i__2; ++j) {
	    b[j + i__ * b_dim1] *= d__;
/* L2800: */
	}

	if (i__ == *m) {
	    goto L3400;
	}

/*        orthogonalize everything else to it */

	i__2 = *m;
	for (j = i__ + 1; j <= i__2; ++j) {

	    if (rnorms[j] < thresh) {
		goto L3200;
	    }

	    random_transf_scap__(&b[i__ * b_dim1 + 1], &b[j * b_dim1 + 1], n, 
		    &cd);

	    cd = cd;

	    rrn = 0.;
	    i__3 = *n;
	    for (l = 1; l <= i__3; ++l) {
		b[l + j * b_dim1] -= b[l + i__ * b_dim1] * cd;
		rrn += b[l + j * b_dim1] * b[l + j * b_dim1];
/* L3000: */
	    }
	    rnorms[j] = sqrt(rrn);
L3200:
	    ;
	}
L3400:

/* L4000: */
	;
    }

    return 0;
} /* random_transf_piv__ */






/* Subroutine */ int random_transf_scap__(doublereal *x, doublereal *y, 
	integer *n, doublereal *prod)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__;


    /* Parameter adjustments */
    --y;
    --x;

    /* Function Body */
    *prod = 0.;
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {
	*prod += x[i__] * y[i__];
/* L1200: */
    }
    return 0;
} /* random_transf_scap__ */






/* Subroutine */ int random_transf_small__0_(int n__, integer *n, doublereal *
	u, doublereal *x, doublereal *y)
{
    /* System generated locals */
    integer u_dim1, u_offset, i__1, i__2;

    /* Local variables */
    static integer i__, j;
    static doublereal cd;


    /* Parameter adjustments */
    u_dim1 = *n;
    u_offset = 1 + u_dim1;
    u -= u_offset;
    --x;
    --y;

    /* Function Body */
    switch(n__) {
	case 1: goto L_random_transf_small_inv;
	}

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {
	cd = 0.;
	i__2 = *n;
	for (j = 1; j <= i__2; ++j) {

	    cd += u[i__ + j * u_dim1] * x[j];
/* L1200: */
	}
	y[i__] = cd;
/* L1400: */
    }

    return 0;





L_random_transf_small_inv:

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {
	cd = 0.;
	i__2 = *n;
	for (j = 1; j <= i__2; ++j) {

	    cd += u[j + i__ * u_dim1] * x[j];
/* L2200: */
	}
	y[i__] = cd;
/* L2400: */
    }

    return 0;
} /* random_transf_small__ */

/* Subroutine */ int random_transf_small__(integer *n, doublereal *u, 
	doublereal *x, doublereal *y)
{
    return random_transf_small__0_(0, n, u, x, y);
    }

/* Subroutine */ int random_transf_small_inv__(integer *n, doublereal *u, 
	doublereal *x, doublereal *y)
{
    return random_transf_small__0_(1, n, u, x, y);
    }






/* Subroutine */ int random_transf_copy__(doublereal *a, doublereal *b, 
	integer *n)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__;


    /* Parameter adjustments */
    --b;
    --a;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	b[i__] = a[i__];
/* L1400: */
    }

    return 0;
} /* random_transf_copy__ */

/* cccc */

/*       durdec.f */

/* cccc */



/*     SUBROUTINE DCFFTI(N,WSAVE) */

/*     ****************************************************************** */

/*     SUBROUTINE DCFFTI INITIALIZES THE ARRAY WSAVE WHICH IS USED IN */
/*     BOTH DCFFTF AND DCFFTB. THE PRIME FACTORIZATION OF N TOGETHER WITH */
/*     A TABULATION OF THE TRIGONOMETRIC FUNCTIONS ARE COMPUTED AND */
/*     STORED IN WSAVE. */

/*     INPUT PARAMETER */

/*     N       THE LENGTH OF THE SEQUENCE TO BE TRANSFORMED */

/*     OUTPUT PARAMETER */

/*     WSAVE   A WORK ARRAY WHICH MUST BE DIMENSIONED AT LEAST 4*N+15 */
/*             THE SAME WORK ARRAY CAN BE USED FOR BOTH DCFFTF AND DCFFTB */
/*             AS LONG AS N REMAINS UNCHANGED. DIFFERENT WSAVE ARRAYS */
/*             ARE REQUIRED FOR DIFFERENT VALUES OF N. THE CONTENTS OF */
/*          WSAVE MUST NOT BE CHANGED BETWEEN CALLS OF DCFFTF OR DCFFTB */

/* Subroutine */ int dcffti_(integer *n, doublereal *wsave)
{
    static integer iw1, iw2;
    extern /* Subroutine */ int dura1_(integer *, doublereal *, integer *);

    /* Parameter adjustments */
    --wsave;

    /* Function Body */
    if (*n == 1) {
	return 0;
    }
    iw1 = *n + *n + 1;
    iw2 = iw1 + *n + *n;
    dura1_(n, &wsave[iw1], (integer*)(&wsave[iw2]));
    return 0;
} /* dcffti_ */

/* DECK DURA1 */
/* Subroutine */ int dura1_(integer *n, doublereal *wa, integer *ifac)
{
    /* Initialized data */

    static integer ntryh[4] = { 3,4,2,5 };

    /* System generated locals */
    integer i__1, i__2, i__3;

    /* Builtin functions */
    double atan(doublereal), cos(doublereal), sin(doublereal);

    /* Local variables */
    static integer i__, j, i1, k1, l1, l2, ib;
    static doublereal fi;
    static integer ld, ii, nf, ip, nl, nq, nr;
    static doublereal arg;
    static integer ido, ipm;
    static doublereal tpi, argh;
    static integer idot, ntry;
    static doublereal argld;

    /* Parameter adjustments */
    --ifac;
    --wa;

    /* Function Body */
    nl = *n;
    nf = 0;
    j = 0;
L101:
    ++j;
    if (j - 4 <= 0) {
	goto L102;
    } else {
	goto L103;
    }
L102:
    ntry = ntryh[j - 1];
    goto L104;
L103:
    ntry += 2;
L104:
    nq = nl / ntry;
    nr = nl - ntry * nq;
    if (nr != 0) {
	goto L101;
    } else {
	goto L105;
    }
L105:
    ++nf;
    ifac[nf + 2] = ntry;
    nl = nq;
    if (ntry != 2) {
	goto L107;
    }
    if (nf == 1) {
	goto L107;
    }
    i__1 = nf;
    for (i__ = 2; i__ <= i__1; ++i__) {
	ib = nf - i__ + 2;
	ifac[ib + 2] = ifac[ib + 1];
/* L106: */
    }
    ifac[3] = 2;
L107:
    if (nl != 1) {
	goto L104;
    }
    ifac[1] = *n;
    ifac[2] = nf;

    tpi = 1.;
    tpi = atan(tpi) * 8;

    argh = tpi / *n;
    i__ = 2;
    l1 = 1;
    i__1 = nf;
    for (k1 = 1; k1 <= i__1; ++k1) {
	ip = ifac[k1 + 2];
	ld = 0;
	l2 = l1 * ip;
	ido = *n / l2;
	idot = ido + ido + 2;
	ipm = ip - 1;
	i__2 = ipm;
	for (j = 1; j <= i__2; ++j) {
	    i1 = i__;
	    wa[i__ - 1] = 1.f;
	    wa[i__] = 0.f;
	    ld += l1;
	    fi = 0.f;
	    argld = ld * argh;
	    i__3 = idot;
	    for (ii = 4; ii <= i__3; ii += 2) {
		i__ += 2;
		fi += 1.;
		arg = fi * argld;
		wa[i__ - 1] = cos(arg);
		wa[i__] = sin(arg);
/* L108: */
	    }
	    if (ip <= 5) {
		goto L109;
	    }
	    wa[i1 - 1] = wa[i__ - 1];
	    wa[i1] = wa[i__];
L109:
	    ;
	}
	l1 = l2;
/* L110: */
    }
    return 0;
} /* dura1_ */

/* DECK DCFFTB */
/*     ****************************************************************** */

/*     SUBROUTINE DCFFTB(N,C,WSAVE) */

/*     ****************************************************************** */

/*     SUBROUTINE DCFFTB COMPUTES THE BACKWARD COMPLEX DISCRETE FOURIER */
/*     TRANSFORM (THE FOURIER SYNTHESIS). EQUIVALENTLY , DCFFTB COMPUTES */
/*     A COMPLEX PERIODIC SEQUENCE FROM ITS FOURIER COEFFICIENTS. */
/*     THE TRANSFORM IS DEFINED BELOW AT OUTPUT PARAMETER C. */

/*     A CALL OF DCFFTF FOLLOWED BY A CALL OF DCFFTB WILL MULTIPLY THE */
/*     SEQUENCE BY N. */

/*     THE ARRAY WSAVE WHICH IS USED BY SUBROUTINE DCFFTB MUST BE */
/*     INITIALIZED BY CALLING SUBROUTINE DCFFTI(N,WSAVE). */

/*     INPUT PARAMETERS */


/*     N      THE LENGTH OF THE COMPLEX SEQUENCE C. THE METHOD IS */
/*            MORE EFFICIENT WHEN N IS THE PRODUCT OF SMALL PRIMES. */

/*     C      A COMPLEX ARRAY OF LENGTH N WHICH CONTAINS THE SEQUENCE */

/*     WSAVE   A REAL WORK ARRAY WHICH MUST BE DIMENSIONED AT LEAST 4N+15 */
/*             IN THE PROGRAM THAT CALLS DCFFTB. THE WSAVE ARRAY MUST BE */
/*             INITIALIZED BY CALLING SUBROUTINE DCFFTI(N,WSAVE) AND A */
/*             DIFFERENT WSAVE ARRAY MUST BE USED FOR EACH DIFFERENT */
/*             VALUE OF N. THIS INITIALIZATION DOES NOT HAVE TO BE */
/*             REPEATED SO LONG AS N REMAINS UNCHANGED THUS SUBSEQUENT */
/*             TRANSFORMS CAN BE OBTAINED FASTER THAN THE FIRST. */
/*             THE SAME WSAVE ARRAY CAN BE USED BY DCFFTF AND DCFFTB. */

/*     OUTPUT PARAMETERS */

/*     C      FOR J=1,...,N */

/*                C(J)=THE SUM FROM K=1,...,N OF */

/*                      C(K)*EXP(I*J*K*2*PI/N) */

/*                            WHERE I=SQRT(-1) */

/*     WSAVE   CONTAINS INITIALIZATION CALCULATIONS WHICH MUST NOT BE */
/*             DESTROYED BETWEEN CALLS OF SUBROUTINE DCFFTF OR DCFFTB */
/* Subroutine */ int dcfftb_(integer *n, doublereal *c__, doublereal *wsave)
{
    static integer iw1, iw2;
    extern /* Subroutine */ int durab1_(integer *, doublereal *, doublereal *,
	     doublereal *, integer *);

    /* Parameter adjustments */
    --wsave;
    --c__;

    /* Function Body */
    if (*n == 1) {
	return 0;
    }
    iw1 = *n + *n + 1;
    iw2 = iw1 + *n + *n;
    durab1_(n, &c__[1], &wsave[1], &wsave[iw1], (integer*)(&wsave[iw2]));
    return 0;
} /* dcfftb_ */

/* DECK DURAF1 */
/* Subroutine */ int durab1_(integer *n, doublereal *c__, doublereal *ch, 
	doublereal *wa, integer *ifac)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__, k1, l1, l2, n2, na, nf, ip, iw, ix2, ix3, ix4, nac, 
	    ido, idl1, idot;
    extern /* Subroutine */ int durab_(integer *, integer *, integer *, 
	    integer *, integer *, doublereal *, doublereal *, doublereal *, 
	    doublereal *, doublereal *, doublereal *), durab2_(integer *, 
	    integer *, doublereal *, doublereal *, doublereal *), durab3_(
	    integer *, integer *, doublereal *, doublereal *, doublereal *, 
	    doublereal *), durab4_(integer *, integer *, doublereal *, 
	    doublereal *, doublereal *, doublereal *, doublereal *), durab5_(
	    integer *, integer *, doublereal *, doublereal *, doublereal *, 
	    doublereal *, doublereal *, doublereal *);

    /* Parameter adjustments */
    --ifac;
    --wa;
    --ch;
    --c__;

    /* Function Body */
    nf = ifac[2];
    na = 0;
    l1 = 1;
    iw = 1;
    i__1 = nf;
    for (k1 = 1; k1 <= i__1; ++k1) {
	ip = ifac[k1 + 2];
	l2 = ip * l1;
	ido = *n / l2;
	idot = ido + ido;
	idl1 = idot * l1;
	if (ip != 4) {
	    goto L103;
	}
	ix2 = iw + idot;
	ix3 = ix2 + idot;
	if (na != 0) {
	    goto L101;
	}
	durab4_(&idot, &l1, &c__[1], &ch[1], &wa[iw], &wa[ix2], &wa[ix3]);
	goto L102;
L101:
	durab4_(&idot, &l1, &ch[1], &c__[1], &wa[iw], &wa[ix2], &wa[ix3]);
L102:
	na = 1 - na;
	goto L115;
L103:
	if (ip != 2) {
	    goto L106;
	}
	if (na != 0) {
	    goto L104;
	}
	durab2_(&idot, &l1, &c__[1], &ch[1], &wa[iw]);
	goto L105;
L104:
	durab2_(&idot, &l1, &ch[1], &c__[1], &wa[iw]);
L105:
	na = 1 - na;
	goto L115;
L106:
	if (ip != 3) {
	    goto L109;
	}
	ix2 = iw + idot;
	if (na != 0) {
	    goto L107;
	}
	durab3_(&idot, &l1, &c__[1], &ch[1], &wa[iw], &wa[ix2]);
	goto L108;
L107:
	durab3_(&idot, &l1, &ch[1], &c__[1], &wa[iw], &wa[ix2]);
L108:
	na = 1 - na;
	goto L115;
L109:
	if (ip != 5) {
	    goto L112;
	}
	ix2 = iw + idot;
	ix3 = ix2 + idot;
	ix4 = ix3 + idot;
	if (na != 0) {
	    goto L110;
	}
	durab5_(&idot, &l1, &c__[1], &ch[1], &wa[iw], &wa[ix2], &wa[ix3], &wa[
		ix4]);
	goto L111;
L110:
	durab5_(&idot, &l1, &ch[1], &c__[1], &wa[iw], &wa[ix2], &wa[ix3], &wa[
		ix4]);
L111:
	na = 1 - na;
	goto L115;
L112:
	if (na != 0) {
	    goto L113;
	}
	durab_(&nac, &idot, &ip, &l1, &idl1, &c__[1], &c__[1], &c__[1], &ch[1]
		, &ch[1], &wa[iw]);
	goto L114;
L113:
	durab_(&nac, &idot, &ip, &l1, &idl1, &ch[1], &ch[1], &ch[1], &c__[1], 
		&c__[1], &wa[iw]);
L114:
	if (nac != 0) {
	    na = 1 - na;
	}
L115:
	l1 = l2;
	iw += (ip - 1) * idot;
/* L116: */
    }
    if (na == 0) {
	return 0;
    }
    n2 = *n + *n;
    i__1 = n2;
    for (i__ = 1; i__ <= i__1; ++i__) {
	c__[i__] = ch[i__];
/* L117: */
    }
    return 0;
} /* durab1_ */

/* DECK DURAB2 */
/* Subroutine */ int durab2_(integer *ido, integer *l1, doublereal *cc, 
	doublereal *ch, doublereal *wa1)
{
    /* System generated locals */
    integer cc_dim1, cc_offset, ch_dim1, ch_dim2, ch_offset, i__1, i__2;

    /* Local variables */
    static integer i__, k;
    static doublereal ti2, tr2;

    /* Parameter adjustments */
    ch_dim1 = *ido;
    ch_dim2 = *l1;
    ch_offset = 1 + ch_dim1 * (1 + ch_dim2);
    ch -= ch_offset;
    cc_dim1 = *ido;
    cc_offset = 1 + cc_dim1 * 3;
    cc -= cc_offset;
    --wa1;

    /* Function Body */
    if (*ido > 2) {
	goto L102;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
	ch[(k + ch_dim2) * ch_dim1 + 1] = cc[((k << 1) + 1) * cc_dim1 + 1] + 
		cc[((k << 1) + 2) * cc_dim1 + 1];
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 1] = cc[((k << 1) + 1) * cc_dim1 
		+ 1] - cc[((k << 1) + 2) * cc_dim1 + 1];
	ch[(k + ch_dim2) * ch_dim1 + 2] = cc[((k << 1) + 1) * cc_dim1 + 2] + 
		cc[((k << 1) + 2) * cc_dim1 + 2];
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 2] = cc[((k << 1) + 1) * cc_dim1 
		+ 2] - cc[((k << 1) + 2) * cc_dim1 + 2];
/* L101: */
    }
    return 0;
L102:
    if (*ido / 2 < *l1) {
	goto L105;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
/* DIR$ IVDEP */
	i__2 = *ido;
	for (i__ = 2; i__ <= i__2; i__ += 2) {
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = cc[i__ - 1 + ((k << 1) + 
		    1) * cc_dim1] + cc[i__ - 1 + ((k << 1) + 2) * cc_dim1];
	    tr2 = cc[i__ - 1 + ((k << 1) + 1) * cc_dim1] - cc[i__ - 1 + ((k <<
		     1) + 2) * cc_dim1];
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + ((k << 1) + 1) * 
		    cc_dim1] + cc[i__ + ((k << 1) + 2) * cc_dim1];
	    ti2 = cc[i__ + ((k << 1) + 1) * cc_dim1] - cc[i__ + ((k << 1) + 2)
		     * cc_dim1];
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * ti2 + 
		    wa1[i__] * tr2;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * tr2 
		    - wa1[i__] * ti2;
/* L103: */
	}
/* L104: */
    }
    return 0;
L105:
    i__1 = *ido;
    for (i__ = 2; i__ <= i__1; i__ += 2) {
/* DIR$ IVDEP */
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = cc[i__ - 1 + ((k << 1) + 
		    1) * cc_dim1] + cc[i__ - 1 + ((k << 1) + 2) * cc_dim1];
	    tr2 = cc[i__ - 1 + ((k << 1) + 1) * cc_dim1] - cc[i__ - 1 + ((k <<
		     1) + 2) * cc_dim1];
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + ((k << 1) + 1) * 
		    cc_dim1] + cc[i__ + ((k << 1) + 2) * cc_dim1];
	    ti2 = cc[i__ + ((k << 1) + 1) * cc_dim1] - cc[i__ + ((k << 1) + 2)
		     * cc_dim1];
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * ti2 + 
		    wa1[i__] * tr2;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * tr2 
		    - wa1[i__] * ti2;
/* L106: */
	}
/* L107: */
    }
    return 0;
} /* durab2_ */

/* DECK DURAB3 */
/* Subroutine */ int durab3_(integer *ido, integer *l1, doublereal *cc, 
	doublereal *ch, doublereal *wa1, doublereal *wa2)
{
    /* System generated locals */
    integer cc_dim1, cc_offset, ch_dim1, ch_dim2, ch_offset, i__1, i__2;

    /* Builtin functions */
    double sqrt(doublereal);

    /* Local variables */
    static integer i__, k;
    static doublereal ci2, ci3, di2, di3, cr2, cr3, dr2, dr3, ti2, tr2, taui, 
	    taur;


/* ccc      DATA TAUR,TAUI /-.5D0,.866025403784439D0/ */

    /* Parameter adjustments */
    ch_dim1 = *ido;
    ch_dim2 = *l1;
    ch_offset = 1 + ch_dim1 * (1 + ch_dim2);
    ch -= ch_offset;
    cc_dim1 = *ido;
    cc_offset = 1 + (cc_dim1 << 2);
    cc -= cc_offset;
    --wa1;
    --wa2;

    /* Function Body */
    taur = 1.;
    taur = -taur / 2;
    taui = 3.;
    taui /= 4;
    taui = sqrt(taui);
    if (*ido != 2) {
	goto L102;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
	tr2 = cc[(k * 3 + 2) * cc_dim1 + 1] + cc[(k * 3 + 3) * cc_dim1 + 1];
	cr2 = cc[(k * 3 + 1) * cc_dim1 + 1] + taur * tr2;
	ch[(k + ch_dim2) * ch_dim1 + 1] = cc[(k * 3 + 1) * cc_dim1 + 1] + tr2;
	ti2 = cc[(k * 3 + 2) * cc_dim1 + 2] + cc[(k * 3 + 3) * cc_dim1 + 2];
	ci2 = cc[(k * 3 + 1) * cc_dim1 + 2] + taur * ti2;
	ch[(k + ch_dim2) * ch_dim1 + 2] = cc[(k * 3 + 1) * cc_dim1 + 2] + ti2;
	cr3 = taui * (cc[(k * 3 + 2) * cc_dim1 + 1] - cc[(k * 3 + 3) * 
		cc_dim1 + 1]);
	ci3 = taui * (cc[(k * 3 + 2) * cc_dim1 + 2] - cc[(k * 3 + 3) * 
		cc_dim1 + 2]);
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 1] = cr2 - ci3;
	ch[(k + ch_dim2 * 3) * ch_dim1 + 1] = cr2 + ci3;
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 2] = ci2 + cr3;
	ch[(k + ch_dim2 * 3) * ch_dim1 + 2] = ci2 - cr3;
/* L101: */
    }
    return 0;
L102:
    if (*ido / 2 < *l1) {
	goto L105;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
/* DIR$ IVDEP */
	i__2 = *ido;
	for (i__ = 2; i__ <= i__2; i__ += 2) {
	    tr2 = cc[i__ - 1 + (k * 3 + 2) * cc_dim1] + cc[i__ - 1 + (k * 3 + 
		    3) * cc_dim1];
	    cr2 = cc[i__ - 1 + (k * 3 + 1) * cc_dim1] + taur * tr2;
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = cc[i__ - 1 + (k * 3 + 1) *
		     cc_dim1] + tr2;
	    ti2 = cc[i__ + (k * 3 + 2) * cc_dim1] + cc[i__ + (k * 3 + 3) * 
		    cc_dim1];
	    ci2 = cc[i__ + (k * 3 + 1) * cc_dim1] + taur * ti2;
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + (k * 3 + 1) * 
		    cc_dim1] + ti2;
	    cr3 = taui * (cc[i__ - 1 + (k * 3 + 2) * cc_dim1] - cc[i__ - 1 + (
		    k * 3 + 3) * cc_dim1]);
	    ci3 = taui * (cc[i__ + (k * 3 + 2) * cc_dim1] - cc[i__ + (k * 3 + 
		    3) * cc_dim1]);
	    dr2 = cr2 - ci3;
	    dr3 = cr2 + ci3;
	    di2 = ci2 + cr3;
	    di3 = ci2 - cr3;
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * di2 + 
		    wa1[i__] * dr2;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * dr2 
		    - wa1[i__] * di2;
	    ch[i__ + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * di3 + wa2[
		    i__] * dr3;
	    ch[i__ - 1 + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * dr3 - 
		    wa2[i__] * di3;
/* L103: */
	}
/* L104: */
    }
    return 0;
L105:
    i__1 = *ido;
    for (i__ = 2; i__ <= i__1; i__ += 2) {
/* DIR$ IVDEP */
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    tr2 = cc[i__ - 1 + (k * 3 + 2) * cc_dim1] + cc[i__ - 1 + (k * 3 + 
		    3) * cc_dim1];
	    cr2 = cc[i__ - 1 + (k * 3 + 1) * cc_dim1] + taur * tr2;
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = cc[i__ - 1 + (k * 3 + 1) *
		     cc_dim1] + tr2;
	    ti2 = cc[i__ + (k * 3 + 2) * cc_dim1] + cc[i__ + (k * 3 + 3) * 
		    cc_dim1];
	    ci2 = cc[i__ + (k * 3 + 1) * cc_dim1] + taur * ti2;
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + (k * 3 + 1) * 
		    cc_dim1] + ti2;
	    cr3 = taui * (cc[i__ - 1 + (k * 3 + 2) * cc_dim1] - cc[i__ - 1 + (
		    k * 3 + 3) * cc_dim1]);
	    ci3 = taui * (cc[i__ + (k * 3 + 2) * cc_dim1] - cc[i__ + (k * 3 + 
		    3) * cc_dim1]);
	    dr2 = cr2 - ci3;
	    dr3 = cr2 + ci3;
	    di2 = ci2 + cr3;
	    di3 = ci2 - cr3;
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * di2 + 
		    wa1[i__] * dr2;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * dr2 
		    - wa1[i__] * di2;
	    ch[i__ + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * di3 + wa2[
		    i__] * dr3;
	    ch[i__ - 1 + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * dr3 - 
		    wa2[i__] * di3;
/* L106: */
	}
/* L107: */
    }
    return 0;
} /* durab3_ */

/* DECK DURAB4 */
/* Subroutine */ int durab4_(integer *ido, integer *l1, doublereal *cc, 
	doublereal *ch, doublereal *wa1, doublereal *wa2, doublereal *wa3)
{
    /* System generated locals */
    integer cc_dim1, cc_offset, ch_dim1, ch_dim2, ch_offset, i__1, i__2;

    /* Local variables */
    static integer i__, k;
    static doublereal ci2, ci3, ci4, cr2, cr3, cr4, ti1, ti2, ti3, ti4, tr1, 
	    tr2, tr3, tr4;

    /* Parameter adjustments */
    ch_dim1 = *ido;
    ch_dim2 = *l1;
    ch_offset = 1 + ch_dim1 * (1 + ch_dim2);
    ch -= ch_offset;
    cc_dim1 = *ido;
    cc_offset = 1 + cc_dim1 * 5;
    cc -= cc_offset;
    --wa1;
    --wa2;
    --wa3;

    /* Function Body */
    if (*ido != 2) {
	goto L102;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
	ti1 = cc[((k << 2) + 1) * cc_dim1 + 2] - cc[((k << 2) + 3) * cc_dim1 
		+ 2];
	ti2 = cc[((k << 2) + 1) * cc_dim1 + 2] + cc[((k << 2) + 3) * cc_dim1 
		+ 2];
	tr4 = cc[((k << 2) + 4) * cc_dim1 + 2] - cc[((k << 2) + 2) * cc_dim1 
		+ 2];
	ti3 = cc[((k << 2) + 2) * cc_dim1 + 2] + cc[((k << 2) + 4) * cc_dim1 
		+ 2];
	tr1 = cc[((k << 2) + 1) * cc_dim1 + 1] - cc[((k << 2) + 3) * cc_dim1 
		+ 1];
	tr2 = cc[((k << 2) + 1) * cc_dim1 + 1] + cc[((k << 2) + 3) * cc_dim1 
		+ 1];
	ti4 = cc[((k << 2) + 2) * cc_dim1 + 1] - cc[((k << 2) + 4) * cc_dim1 
		+ 1];
	tr3 = cc[((k << 2) + 2) * cc_dim1 + 1] + cc[((k << 2) + 4) * cc_dim1 
		+ 1];
	ch[(k + ch_dim2) * ch_dim1 + 1] = tr2 + tr3;
	ch[(k + ch_dim2 * 3) * ch_dim1 + 1] = tr2 - tr3;
	ch[(k + ch_dim2) * ch_dim1 + 2] = ti2 + ti3;
	ch[(k + ch_dim2 * 3) * ch_dim1 + 2] = ti2 - ti3;
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 1] = tr1 + tr4;
	ch[(k + (ch_dim2 << 2)) * ch_dim1 + 1] = tr1 - tr4;
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 2] = ti1 + ti4;
	ch[(k + (ch_dim2 << 2)) * ch_dim1 + 2] = ti1 - ti4;
/* L101: */
    }
    return 0;
L102:
    if (*ido / 2 < *l1) {
	goto L105;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
/* DIR$ IVDEP */
	i__2 = *ido;
	for (i__ = 2; i__ <= i__2; i__ += 2) {
	    ti1 = cc[i__ + ((k << 2) + 1) * cc_dim1] - cc[i__ + ((k << 2) + 3)
		     * cc_dim1];
	    ti2 = cc[i__ + ((k << 2) + 1) * cc_dim1] + cc[i__ + ((k << 2) + 3)
		     * cc_dim1];
	    ti3 = cc[i__ + ((k << 2) + 2) * cc_dim1] + cc[i__ + ((k << 2) + 4)
		     * cc_dim1];
	    tr4 = cc[i__ + ((k << 2) + 4) * cc_dim1] - cc[i__ + ((k << 2) + 2)
		     * cc_dim1];
	    tr1 = cc[i__ - 1 + ((k << 2) + 1) * cc_dim1] - cc[i__ - 1 + ((k <<
		     2) + 3) * cc_dim1];
	    tr2 = cc[i__ - 1 + ((k << 2) + 1) * cc_dim1] + cc[i__ - 1 + ((k <<
		     2) + 3) * cc_dim1];
	    ti4 = cc[i__ - 1 + ((k << 2) + 2) * cc_dim1] - cc[i__ - 1 + ((k <<
		     2) + 4) * cc_dim1];
	    tr3 = cc[i__ - 1 + ((k << 2) + 2) * cc_dim1] + cc[i__ - 1 + ((k <<
		     2) + 4) * cc_dim1];
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = tr2 + tr3;
	    cr3 = tr2 - tr3;
	    ch[i__ + (k + ch_dim2) * ch_dim1] = ti2 + ti3;
	    ci3 = ti2 - ti3;
	    cr2 = tr1 + tr4;
	    cr4 = tr1 - tr4;
	    ci2 = ti1 + ti4;
	    ci4 = ti1 - ti4;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * cr2 
		    - wa1[i__] * ci2;
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * ci2 + 
		    wa1[i__] * cr2;
	    ch[i__ - 1 + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * cr3 - 
		    wa2[i__] * ci3;
	    ch[i__ + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * ci3 + wa2[
		    i__] * cr3;
	    ch[i__ - 1 + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * cr4 
		    - wa3[i__] * ci4;
	    ch[i__ + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * ci4 + 
		    wa3[i__] * cr4;
/* L103: */
	}
/* L104: */
    }
    return 0;
L105:
    i__1 = *ido;
    for (i__ = 2; i__ <= i__1; i__ += 2) {
/* DIR$ IVDEP */
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    ti1 = cc[i__ + ((k << 2) + 1) * cc_dim1] - cc[i__ + ((k << 2) + 3)
		     * cc_dim1];
	    ti2 = cc[i__ + ((k << 2) + 1) * cc_dim1] + cc[i__ + ((k << 2) + 3)
		     * cc_dim1];
	    ti3 = cc[i__ + ((k << 2) + 2) * cc_dim1] + cc[i__ + ((k << 2) + 4)
		     * cc_dim1];
	    tr4 = cc[i__ + ((k << 2) + 4) * cc_dim1] - cc[i__ + ((k << 2) + 2)
		     * cc_dim1];
	    tr1 = cc[i__ - 1 + ((k << 2) + 1) * cc_dim1] - cc[i__ - 1 + ((k <<
		     2) + 3) * cc_dim1];
	    tr2 = cc[i__ - 1 + ((k << 2) + 1) * cc_dim1] + cc[i__ - 1 + ((k <<
		     2) + 3) * cc_dim1];
	    ti4 = cc[i__ - 1 + ((k << 2) + 2) * cc_dim1] - cc[i__ - 1 + ((k <<
		     2) + 4) * cc_dim1];
	    tr3 = cc[i__ - 1 + ((k << 2) + 2) * cc_dim1] + cc[i__ - 1 + ((k <<
		     2) + 4) * cc_dim1];
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = tr2 + tr3;
	    cr3 = tr2 - tr3;
	    ch[i__ + (k + ch_dim2) * ch_dim1] = ti2 + ti3;
	    ci3 = ti2 - ti3;
	    cr2 = tr1 + tr4;
	    cr4 = tr1 - tr4;
	    ci2 = ti1 + ti4;
	    ci4 = ti1 - ti4;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * cr2 
		    - wa1[i__] * ci2;
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * ci2 + 
		    wa1[i__] * cr2;
	    ch[i__ - 1 + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * cr3 - 
		    wa2[i__] * ci3;
	    ch[i__ + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * ci3 + wa2[
		    i__] * cr3;
	    ch[i__ - 1 + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * cr4 
		    - wa3[i__] * ci4;
	    ch[i__ + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * ci4 + 
		    wa3[i__] * cr4;
/* L106: */
	}
/* L107: */
    }
    return 0;
} /* durab4_ */

/* DECK DURAB5 */
/* Subroutine */ int durab5_(integer *ido, integer *l1, doublereal *cc, 
	doublereal *ch, doublereal *wa1, doublereal *wa2, doublereal *wa3, 
	doublereal *wa4)
{
    /* Initialized data */

    static doublereal tr11 = .309016994374947;
    static doublereal ti11 = .951056516295154;
    static doublereal tr12 = -.809016994374947;
    static doublereal ti12 = .587785252292473;

    /* System generated locals */
    integer cc_dim1, cc_offset, ch_dim1, ch_dim2, ch_offset, i__1, i__2;

    /* Builtin functions */
    double atan(doublereal), sin(doublereal), cos(doublereal);

    /* Local variables */
    static integer i__, k;
    static doublereal pi, ci2, ci3, ci4, ci5, di3, di4, di5, di2, cr2, cr3, 
	    cr5, cr4, ti2, ti3, ti4, ti5, dr3, dr4, dr5, dr2, tr2, tr3, tr4, 
	    tr5, done;


    /* Parameter adjustments */
    ch_dim1 = *ido;
    ch_dim2 = *l1;
    ch_offset = 1 + ch_dim1 * (1 + ch_dim2);
    ch -= ch_offset;
    cc_dim1 = *ido;
    cc_offset = 1 + cc_dim1 * 6;
    cc -= cc_offset;
    --wa1;
    --wa2;
    --wa3;
    --wa4;

    /* Function Body */

    done = 1.;
    pi = atan(done) * 4;
    tr11 = sin(pi / 10);
    ti11 = cos(pi / 10);
    tr12 = -(ti11 + done / 2);
    tr12 = -cos(pi / 5);
    ti12 = sin(pi / 5);

    if (*ido != 2) {
	goto L102;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
	ti5 = cc[(k * 5 + 2) * cc_dim1 + 2] - cc[(k * 5 + 5) * cc_dim1 + 2];
	ti2 = cc[(k * 5 + 2) * cc_dim1 + 2] + cc[(k * 5 + 5) * cc_dim1 + 2];
	ti4 = cc[(k * 5 + 3) * cc_dim1 + 2] - cc[(k * 5 + 4) * cc_dim1 + 2];
	ti3 = cc[(k * 5 + 3) * cc_dim1 + 2] + cc[(k * 5 + 4) * cc_dim1 + 2];
	tr5 = cc[(k * 5 + 2) * cc_dim1 + 1] - cc[(k * 5 + 5) * cc_dim1 + 1];
	tr2 = cc[(k * 5 + 2) * cc_dim1 + 1] + cc[(k * 5 + 5) * cc_dim1 + 1];
	tr4 = cc[(k * 5 + 3) * cc_dim1 + 1] - cc[(k * 5 + 4) * cc_dim1 + 1];
	tr3 = cc[(k * 5 + 3) * cc_dim1 + 1] + cc[(k * 5 + 4) * cc_dim1 + 1];
	ch[(k + ch_dim2) * ch_dim1 + 1] = cc[(k * 5 + 1) * cc_dim1 + 1] + tr2 
		+ tr3;
	ch[(k + ch_dim2) * ch_dim1 + 2] = cc[(k * 5 + 1) * cc_dim1 + 2] + ti2 
		+ ti3;
	cr2 = cc[(k * 5 + 1) * cc_dim1 + 1] + tr11 * tr2 + tr12 * tr3;
	ci2 = cc[(k * 5 + 1) * cc_dim1 + 2] + tr11 * ti2 + tr12 * ti3;
	cr3 = cc[(k * 5 + 1) * cc_dim1 + 1] + tr12 * tr2 + tr11 * tr3;
	ci3 = cc[(k * 5 + 1) * cc_dim1 + 2] + tr12 * ti2 + tr11 * ti3;
	cr5 = ti11 * tr5 + ti12 * tr4;
	ci5 = ti11 * ti5 + ti12 * ti4;
	cr4 = ti12 * tr5 - ti11 * tr4;
	ci4 = ti12 * ti5 - ti11 * ti4;
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 1] = cr2 - ci5;
	ch[(k + ch_dim2 * 5) * ch_dim1 + 1] = cr2 + ci5;
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 2] = ci2 + cr5;
	ch[(k + ch_dim2 * 3) * ch_dim1 + 2] = ci3 + cr4;
	ch[(k + ch_dim2 * 3) * ch_dim1 + 1] = cr3 - ci4;
	ch[(k + (ch_dim2 << 2)) * ch_dim1 + 1] = cr3 + ci4;
	ch[(k + (ch_dim2 << 2)) * ch_dim1 + 2] = ci3 - cr4;
	ch[(k + ch_dim2 * 5) * ch_dim1 + 2] = ci2 - cr5;
/* L101: */
    }
    return 0;
L102:
    if (*ido / 2 < *l1) {
	goto L105;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
/* DIR$ IVDEP */
	i__2 = *ido;
	for (i__ = 2; i__ <= i__2; i__ += 2) {
	    ti5 = cc[i__ + (k * 5 + 2) * cc_dim1] - cc[i__ + (k * 5 + 5) * 
		    cc_dim1];
	    ti2 = cc[i__ + (k * 5 + 2) * cc_dim1] + cc[i__ + (k * 5 + 5) * 
		    cc_dim1];
	    ti4 = cc[i__ + (k * 5 + 3) * cc_dim1] - cc[i__ + (k * 5 + 4) * 
		    cc_dim1];
	    ti3 = cc[i__ + (k * 5 + 3) * cc_dim1] + cc[i__ + (k * 5 + 4) * 
		    cc_dim1];
	    tr5 = cc[i__ - 1 + (k * 5 + 2) * cc_dim1] - cc[i__ - 1 + (k * 5 + 
		    5) * cc_dim1];
	    tr2 = cc[i__ - 1 + (k * 5 + 2) * cc_dim1] + cc[i__ - 1 + (k * 5 + 
		    5) * cc_dim1];
	    tr4 = cc[i__ - 1 + (k * 5 + 3) * cc_dim1] - cc[i__ - 1 + (k * 5 + 
		    4) * cc_dim1];
	    tr3 = cc[i__ - 1 + (k * 5 + 3) * cc_dim1] + cc[i__ - 1 + (k * 5 + 
		    4) * cc_dim1];
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = cc[i__ - 1 + (k * 5 + 1) *
		     cc_dim1] + tr2 + tr3;
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + (k * 5 + 1) * 
		    cc_dim1] + ti2 + ti3;
	    cr2 = cc[i__ - 1 + (k * 5 + 1) * cc_dim1] + tr11 * tr2 + tr12 * 
		    tr3;
	    ci2 = cc[i__ + (k * 5 + 1) * cc_dim1] + tr11 * ti2 + tr12 * ti3;
	    cr3 = cc[i__ - 1 + (k * 5 + 1) * cc_dim1] + tr12 * tr2 + tr11 * 
		    tr3;
	    ci3 = cc[i__ + (k * 5 + 1) * cc_dim1] + tr12 * ti2 + tr11 * ti3;
	    cr5 = ti11 * tr5 + ti12 * tr4;
	    ci5 = ti11 * ti5 + ti12 * ti4;
	    cr4 = ti12 * tr5 - ti11 * tr4;
	    ci4 = ti12 * ti5 - ti11 * ti4;
	    dr3 = cr3 - ci4;
	    dr4 = cr3 + ci4;
	    di3 = ci3 + cr4;
	    di4 = ci3 - cr4;
	    dr5 = cr2 + ci5;
	    dr2 = cr2 - ci5;
	    di5 = ci2 - cr5;
	    di2 = ci2 + cr5;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * dr2 
		    - wa1[i__] * di2;
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * di2 + 
		    wa1[i__] * dr2;
	    ch[i__ - 1 + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * dr3 - 
		    wa2[i__] * di3;
	    ch[i__ + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * di3 + wa2[
		    i__] * dr3;
	    ch[i__ - 1 + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * dr4 
		    - wa3[i__] * di4;
	    ch[i__ + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * di4 + 
		    wa3[i__] * dr4;
	    ch[i__ - 1 + (k + ch_dim2 * 5) * ch_dim1] = wa4[i__ - 1] * dr5 - 
		    wa4[i__] * di5;
	    ch[i__ + (k + ch_dim2 * 5) * ch_dim1] = wa4[i__ - 1] * di5 + wa4[
		    i__] * dr5;
/* L103: */
	}
/* L104: */
    }
    return 0;
L105:
    i__1 = *ido;
    for (i__ = 2; i__ <= i__1; i__ += 2) {
/* DIR$ IVDEP */
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    ti5 = cc[i__ + (k * 5 + 2) * cc_dim1] - cc[i__ + (k * 5 + 5) * 
		    cc_dim1];
	    ti2 = cc[i__ + (k * 5 + 2) * cc_dim1] + cc[i__ + (k * 5 + 5) * 
		    cc_dim1];
	    ti4 = cc[i__ + (k * 5 + 3) * cc_dim1] - cc[i__ + (k * 5 + 4) * 
		    cc_dim1];
	    ti3 = cc[i__ + (k * 5 + 3) * cc_dim1] + cc[i__ + (k * 5 + 4) * 
		    cc_dim1];
	    tr5 = cc[i__ - 1 + (k * 5 + 2) * cc_dim1] - cc[i__ - 1 + (k * 5 + 
		    5) * cc_dim1];
	    tr2 = cc[i__ - 1 + (k * 5 + 2) * cc_dim1] + cc[i__ - 1 + (k * 5 + 
		    5) * cc_dim1];
	    tr4 = cc[i__ - 1 + (k * 5 + 3) * cc_dim1] - cc[i__ - 1 + (k * 5 + 
		    4) * cc_dim1];
	    tr3 = cc[i__ - 1 + (k * 5 + 3) * cc_dim1] + cc[i__ - 1 + (k * 5 + 
		    4) * cc_dim1];
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = cc[i__ - 1 + (k * 5 + 1) *
		     cc_dim1] + tr2 + tr3;
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + (k * 5 + 1) * 
		    cc_dim1] + ti2 + ti3;
	    cr2 = cc[i__ - 1 + (k * 5 + 1) * cc_dim1] + tr11 * tr2 + tr12 * 
		    tr3;
	    ci2 = cc[i__ + (k * 5 + 1) * cc_dim1] + tr11 * ti2 + tr12 * ti3;
	    cr3 = cc[i__ - 1 + (k * 5 + 1) * cc_dim1] + tr12 * tr2 + tr11 * 
		    tr3;
	    ci3 = cc[i__ + (k * 5 + 1) * cc_dim1] + tr12 * ti2 + tr11 * ti3;
	    cr5 = ti11 * tr5 + ti12 * tr4;
	    ci5 = ti11 * ti5 + ti12 * ti4;
	    cr4 = ti12 * tr5 - ti11 * tr4;
	    ci4 = ti12 * ti5 - ti11 * ti4;
	    dr3 = cr3 - ci4;
	    dr4 = cr3 + ci4;
	    di3 = ci3 + cr4;
	    di4 = ci3 - cr4;
	    dr5 = cr2 + ci5;
	    dr2 = cr2 - ci5;
	    di5 = ci2 - cr5;
	    di2 = ci2 + cr5;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * dr2 
		    - wa1[i__] * di2;
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * di2 + 
		    wa1[i__] * dr2;
	    ch[i__ - 1 + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * dr3 - 
		    wa2[i__] * di3;
	    ch[i__ + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * di3 + wa2[
		    i__] * dr3;
	    ch[i__ - 1 + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * dr4 
		    - wa3[i__] * di4;
	    ch[i__ + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * di4 + 
		    wa3[i__] * dr4;
	    ch[i__ - 1 + (k + ch_dim2 * 5) * ch_dim1] = wa4[i__ - 1] * dr5 - 
		    wa4[i__] * di5;
	    ch[i__ + (k + ch_dim2 * 5) * ch_dim1] = wa4[i__ - 1] * di5 + wa4[
		    i__] * dr5;
/* L106: */
	}
/* L107: */
    }
    return 0;
} /* durab5_ */

/* DECK DURAB */
/* Subroutine */ int durab_(integer *nac, integer *ido, integer *ip, integer *
	l1, integer *idl1, doublereal *cc, doublereal *c1, doublereal *c2, 
	doublereal *ch, doublereal *ch2, doublereal *wa)
{
    /* System generated locals */
    integer ch_dim1, ch_dim2, ch_offset, cc_dim1, cc_dim2, cc_offset, c1_dim1,
	     c1_dim2, c1_offset, c2_dim1, c2_offset, ch2_dim1, ch2_offset, 
	    i__1, i__2, i__3;

    /* Local variables */
    static integer i__, j, k, l, jc, lc, ik, nt, idj, idl, inc, idp;
    static doublereal wai, war;
    static integer ipp2, idij, idlj, idot, ipph;

    /* Parameter adjustments */
    ch_dim1 = *ido;
    ch_dim2 = *l1;
    ch_offset = 1 + ch_dim1 * (1 + ch_dim2);
    ch -= ch_offset;
    c1_dim1 = *ido;
    c1_dim2 = *l1;
    c1_offset = 1 + c1_dim1 * (1 + c1_dim2);
    c1 -= c1_offset;
    cc_dim1 = *ido;
    cc_dim2 = *ip;
    cc_offset = 1 + cc_dim1 * (1 + cc_dim2);
    cc -= cc_offset;
    ch2_dim1 = *idl1;
    ch2_offset = 1 + ch2_dim1;
    ch2 -= ch2_offset;
    c2_dim1 = *idl1;
    c2_offset = 1 + c2_dim1;
    c2 -= c2_offset;
    --wa;

    /* Function Body */
    idot = *ido / 2;
    nt = *ip * *idl1;
    ipp2 = *ip + 2;
    ipph = (*ip + 1) / 2;
    idp = *ip * *ido;

    if (*ido < *l1) {
	goto L106;
    }
    i__1 = ipph;
    for (j = 2; j <= i__1; ++j) {
	jc = ipp2 - j;
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
/* DIR$ IVDEP */
	    i__3 = *ido;
	    for (i__ = 1; i__ <= i__3; ++i__) {
		ch[i__ + (k + j * ch_dim2) * ch_dim1] = cc[i__ + (j + k * 
			cc_dim2) * cc_dim1] + cc[i__ + (jc + k * cc_dim2) * 
			cc_dim1];
		ch[i__ + (k + jc * ch_dim2) * ch_dim1] = cc[i__ + (j + k * 
			cc_dim2) * cc_dim1] - cc[i__ + (jc + k * cc_dim2) * 
			cc_dim1];
/* L101: */
	    }
/* L102: */
	}
/* L103: */
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
/* DIR$ IVDEP */
	i__2 = *ido;
	for (i__ = 1; i__ <= i__2; ++i__) {
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + (k * cc_dim2 + 1) * 
		    cc_dim1];
/* L104: */
	}
/* L105: */
    }
    goto L112;
L106:
    i__1 = ipph;
    for (j = 2; j <= i__1; ++j) {
	jc = ipp2 - j;
	i__2 = *ido;
	for (i__ = 1; i__ <= i__2; ++i__) {
/* DIR$ IVDEP */
	    i__3 = *l1;
	    for (k = 1; k <= i__3; ++k) {
		ch[i__ + (k + j * ch_dim2) * ch_dim1] = cc[i__ + (j + k * 
			cc_dim2) * cc_dim1] + cc[i__ + (jc + k * cc_dim2) * 
			cc_dim1];
		ch[i__ + (k + jc * ch_dim2) * ch_dim1] = cc[i__ + (j + k * 
			cc_dim2) * cc_dim1] - cc[i__ + (jc + k * cc_dim2) * 
			cc_dim1];
/* L107: */
	    }
/* L108: */
	}
/* L109: */
    }
    i__1 = *ido;
    for (i__ = 1; i__ <= i__1; ++i__) {
/* DIR$ IVDEP */
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + (k * cc_dim2 + 1) * 
		    cc_dim1];
/* L110: */
	}
/* L111: */
    }
L112:
    idl = 2 - *ido;
    inc = 0;
    i__1 = ipph;
    for (l = 2; l <= i__1; ++l) {
	lc = ipp2 - l;
	idl += *ido;
/* DIR$ IVDEP */
	i__2 = *idl1;
	for (ik = 1; ik <= i__2; ++ik) {
	    c2[ik + l * c2_dim1] = ch2[ik + ch2_dim1] + wa[idl - 1] * ch2[ik 
		    + (ch2_dim1 << 1)];
	    c2[ik + lc * c2_dim1] = wa[idl] * ch2[ik + *ip * ch2_dim1];
/* L113: */
	}
	idlj = idl;
	inc += *ido;
	i__2 = ipph;
	for (j = 3; j <= i__2; ++j) {
	    jc = ipp2 - j;
	    idlj += inc;
	    if (idlj > idp) {
		idlj -= idp;
	    }
	    war = wa[idlj - 1];
	    wai = wa[idlj];
/* DIR$ IVDEP */
	    i__3 = *idl1;
	    for (ik = 1; ik <= i__3; ++ik) {
		c2[ik + l * c2_dim1] += war * ch2[ik + j * ch2_dim1];
		c2[ik + lc * c2_dim1] += wai * ch2[ik + jc * ch2_dim1];
/* L114: */
	    }
/* L115: */
	}
/* L116: */
    }
    i__1 = ipph;
    for (j = 2; j <= i__1; ++j) {
/* DIR$ IVDEP */
	i__2 = *idl1;
	for (ik = 1; ik <= i__2; ++ik) {
	    ch2[ik + ch2_dim1] += ch2[ik + j * ch2_dim1];
/* L117: */
	}
/* L118: */
    }
    i__1 = ipph;
    for (j = 2; j <= i__1; ++j) {
	jc = ipp2 - j;
/* DIR$ IVDEP */
	i__2 = *idl1;
	for (ik = 2; ik <= i__2; ik += 2) {
	    ch2[ik - 1 + j * ch2_dim1] = c2[ik - 1 + j * c2_dim1] - c2[ik + 
		    jc * c2_dim1];
	    ch2[ik - 1 + jc * ch2_dim1] = c2[ik - 1 + j * c2_dim1] + c2[ik + 
		    jc * c2_dim1];
	    ch2[ik + j * ch2_dim1] = c2[ik + j * c2_dim1] + c2[ik - 1 + jc * 
		    c2_dim1];
	    ch2[ik + jc * ch2_dim1] = c2[ik + j * c2_dim1] - c2[ik - 1 + jc * 
		    c2_dim1];
/* L119: */
	}
/* L120: */
    }
    *nac = 1;
    if (*ido == 2) {
	return 0;
    }
    *nac = 0;
    i__1 = *idl1;
    for (ik = 1; ik <= i__1; ++ik) {
	c2[ik + c2_dim1] = ch2[ik + ch2_dim1];
/* L121: */
    }
    i__1 = *ip;
    for (j = 2; j <= i__1; ++j) {
/* DIR$ IVDEP */
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    c1[(k + j * c1_dim2) * c1_dim1 + 1] = ch[(k + j * ch_dim2) * 
		    ch_dim1 + 1];
	    c1[(k + j * c1_dim2) * c1_dim1 + 2] = ch[(k + j * ch_dim2) * 
		    ch_dim1 + 2];
/* L122: */
	}
/* L123: */
    }
    if (idot > *l1) {
	goto L127;
    }
    idij = 0;
    i__1 = *ip;
    for (j = 2; j <= i__1; ++j) {
	idij += 2;
	i__2 = *ido;
	for (i__ = 4; i__ <= i__2; i__ += 2) {
	    idij += 2;
/* DIR$ IVDEP */
	    i__3 = *l1;
	    for (k = 1; k <= i__3; ++k) {
		c1[i__ - 1 + (k + j * c1_dim2) * c1_dim1] = wa[idij - 1] * ch[
			i__ - 1 + (k + j * ch_dim2) * ch_dim1] - wa[idij] * 
			ch[i__ + (k + j * ch_dim2) * ch_dim1];
		c1[i__ + (k + j * c1_dim2) * c1_dim1] = wa[idij - 1] * ch[i__ 
			+ (k + j * ch_dim2) * ch_dim1] + wa[idij] * ch[i__ - 
			1 + (k + j * ch_dim2) * ch_dim1];
/* L124: */
	    }
/* L125: */
	}
/* L126: */
    }
    return 0;
L127:
    idj = 2 - *ido;
    i__1 = *ip;
    for (j = 2; j <= i__1; ++j) {
	idj += *ido;
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    idij = idj;
/* DIR$ IVDEP */
	    i__3 = *ido;
	    for (i__ = 4; i__ <= i__3; i__ += 2) {
		idij += 2;
		c1[i__ - 1 + (k + j * c1_dim2) * c1_dim1] = wa[idij - 1] * ch[
			i__ - 1 + (k + j * ch_dim2) * ch_dim1] - wa[idij] * 
			ch[i__ + (k + j * ch_dim2) * ch_dim1];
		c1[i__ + (k + j * c1_dim2) * c1_dim1] = wa[idij - 1] * ch[i__ 
			+ (k + j * ch_dim2) * ch_dim1] + wa[idij] * ch[i__ - 
			1 + (k + j * ch_dim2) * ch_dim1];
/* L128: */
	    }
/* L129: */
	}
/* L130: */
    }
    return 0;
} /* durab_ */

/* DECK DCFFTF */
/*     ****************************************************************** */

/*     SUBROUTINE DCFFTF(N,C,WSAVE) */

/*     ****************************************************************** */

/*     SUBROUTINE DCFFTF COMPUTES THE FORWARD COMPLEX DISCRETE FOURIER */
/*     TRANSFORM (THE FOURIER ANALYSIS). EQUIVALENTLY , DCFFTF COMPUTES */
/*     THE FOURIER COEFFICIENTS OF A COMPLEX PERIODIC SEQUENCE. */
/*     THE TRANSFORM IS DEFINED BELOW AT OUTPUT PARAMETER C. */

/*     THE TRANSFORM IS NOT NORMALIZED. TO OBTAIN A NORMALIZED TRANSFORM */
/*     THE OUTPUT MUST BE DIVIDED BY N. OTHERWISE A CALL OF DCFFTF */
/*     FOLLOWED BY A CALL OF DCFFTB WILL MULTIPLY THE SEQUENCE BY N. */

/*     THE ARRAY WSAVE WHICH IS USED BY SUBROUTINE DCFFTF MUST BE */
/*     INITIALIZED BY CALLING SUBROUTINE DCFFTI(N,WSAVE). */

/*     INPUT PARAMETERS */


/*     N      THE LENGTH OF THE COMPLEX SEQUENCE C. THE METHOD IS */
/*            MORE EFFICIENT WHEN N IS THE PRODUCT OF SMALL PRIMES. N */

/*     C      A COMPLEX ARRAY OF LENGTH N WHICH CONTAINS THE SEQUENCE */

/*     WSAVE   A REAL WORK ARRAY WHICH MUST BE DIMENSIONED AT LEAST 4N+15 */
/*             IN THE PROGRAM THAT CALLS DCFFTF. THE WSAVE ARRAY MUST BE */
/*             INITIALIZED BY CALLING SUBROUTINE DCFFTI(N,WSAVE) AND A */
/*             DIFFERENT WSAVE ARRAY MUST BE USED FOR EACH DIFFERENT */
/*             VALUE OF N. THIS INITIALIZATION DOES NOT HAVE TO BE */
/*             REPEATED SO LONG AS N REMAINS UNCHANGED THUS SUBSEQUENT */
/*             TRANSFORMS CAN BE OBTAINED FASTER THAN THE FIRST. */
/*             THE SAME WSAVE ARRAY CAN BE USED BY DCFFTF AND DCFFTB. */

/*     OUTPUT PARAMETERS */

/*     C      FOR J=1,...,N */

/*                C(J)=THE SUM FROM K=1,...,N OF */

/*                      C(K)*EXP(-I*J*K*2*PI/N) */

/*                            WHERE I=SQRT(-1) */

/*     WSAVE   CONTAINS INITIALIZATION CALCULATIONS WHICH MUST NOT BE */
/*             DESTROYED BETWEEN CALLS OF SUBROUTINE DCFFTF OR DCFFTB */

/* Subroutine */ int dcfftf_(integer *n, doublereal *c__, doublereal *wsave)
{
    static integer iw1, iw2;
    extern /* Subroutine */ int duraf1_(integer *, doublereal *, doublereal *,
	     doublereal *, integer *);

    /* Parameter adjustments */
    --wsave;
    --c__;

    /* Function Body */
    if (*n == 1) {
	return 0;
    }
    iw1 = *n + *n + 1;
    iw2 = iw1 + *n + *n;
    duraf1_(n, &c__[1], &wsave[1], &wsave[iw1], (integer*)(&wsave[iw2]));
    return 0;
} /* dcfftf_ */

/* DECK DURAF1 */
/* Subroutine */ int duraf1_(integer *n, doublereal *c__, doublereal *ch, 
	doublereal *wa, integer *ifac)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__, k1, l1, l2, n2, na, nf, ip, iw, ix2, ix3, ix4, nac, 
	    ido, idl1, idot;
    extern /* Subroutine */ int duraf_(integer *, integer *, integer *, 
	    integer *, integer *, doublereal *, doublereal *, doublereal *, 
	    doublereal *, doublereal *, doublereal *), duraf2_(integer *, 
	    integer *, doublereal *, doublereal *, doublereal *), duraf3_(
	    integer *, integer *, doublereal *, doublereal *, doublereal *, 
	    doublereal *), duraf4_(integer *, integer *, doublereal *, 
	    doublereal *, doublereal *, doublereal *, doublereal *), duraf5_(
	    integer *, integer *, doublereal *, doublereal *, doublereal *, 
	    doublereal *, doublereal *, doublereal *);

    /* Parameter adjustments */
    --ifac;
    --wa;
    --ch;
    --c__;

    /* Function Body */
    nf = ifac[2];
    na = 0;
    l1 = 1;
    iw = 1;
    i__1 = nf;
    for (k1 = 1; k1 <= i__1; ++k1) {
	ip = ifac[k1 + 2];
	l2 = ip * l1;
	ido = *n / l2;
	idot = ido + ido;
	idl1 = idot * l1;
	if (ip != 4) {
	    goto L103;
	}
	ix2 = iw + idot;
	ix3 = ix2 + idot;
	if (na != 0) {
	    goto L101;
	}
	duraf4_(&idot, &l1, &c__[1], &ch[1], &wa[iw], &wa[ix2], &wa[ix3]);
	goto L102;
L101:
	duraf4_(&idot, &l1, &ch[1], &c__[1], &wa[iw], &wa[ix2], &wa[ix3]);
L102:
	na = 1 - na;
	goto L115;
L103:
	if (ip != 2) {
	    goto L106;
	}
	if (na != 0) {
	    goto L104;
	}
	duraf2_(&idot, &l1, &c__[1], &ch[1], &wa[iw]);
	goto L105;
L104:
	duraf2_(&idot, &l1, &ch[1], &c__[1], &wa[iw]);
L105:
	na = 1 - na;
	goto L115;
L106:
	if (ip != 3) {
	    goto L109;
	}
	ix2 = iw + idot;
	if (na != 0) {
	    goto L107;
	}
	duraf3_(&idot, &l1, &c__[1], &ch[1], &wa[iw], &wa[ix2]);
	goto L108;
L107:
	duraf3_(&idot, &l1, &ch[1], &c__[1], &wa[iw], &wa[ix2]);
L108:
	na = 1 - na;
	goto L115;
L109:
	if (ip != 5) {
	    goto L112;
	}
	ix2 = iw + idot;
	ix3 = ix2 + idot;
	ix4 = ix3 + idot;
	if (na != 0) {
	    goto L110;
	}
	duraf5_(&idot, &l1, &c__[1], &ch[1], &wa[iw], &wa[ix2], &wa[ix3], &wa[
		ix4]);
	goto L111;
L110:
	duraf5_(&idot, &l1, &ch[1], &c__[1], &wa[iw], &wa[ix2], &wa[ix3], &wa[
		ix4]);
L111:
	na = 1 - na;
	goto L115;
L112:
	if (na != 0) {
	    goto L113;
	}
	duraf_(&nac, &idot, &ip, &l1, &idl1, &c__[1], &c__[1], &c__[1], &ch[1]
		, &ch[1], &wa[iw]);
	goto L114;
L113:
	duraf_(&nac, &idot, &ip, &l1, &idl1, &ch[1], &ch[1], &ch[1], &c__[1], 
		&c__[1], &wa[iw]);
L114:
	if (nac != 0) {
	    na = 1 - na;
	}
L115:
	l1 = l2;
	iw += (ip - 1) * idot;
/* L116: */
    }
    if (na == 0) {
	return 0;
    }
    n2 = *n + *n;
    i__1 = n2;
    for (i__ = 1; i__ <= i__1; ++i__) {
	c__[i__] = ch[i__];
/* L117: */
    }
    return 0;
} /* duraf1_ */

/* DECK DURAF2 */
/* Subroutine */ int duraf2_(integer *ido, integer *l1, doublereal *cc, 
	doublereal *ch, doublereal *wa1)
{
    /* System generated locals */
    integer cc_dim1, cc_offset, ch_dim1, ch_dim2, ch_offset, i__1, i__2;

    /* Local variables */
    static integer i__, k;
    static doublereal ti2, tr2;

    /* Parameter adjustments */
    ch_dim1 = *ido;
    ch_dim2 = *l1;
    ch_offset = 1 + ch_dim1 * (1 + ch_dim2);
    ch -= ch_offset;
    cc_dim1 = *ido;
    cc_offset = 1 + cc_dim1 * 3;
    cc -= cc_offset;
    --wa1;

    /* Function Body */
    if (*ido > 2) {
	goto L102;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
	ch[(k + ch_dim2) * ch_dim1 + 1] = cc[((k << 1) + 1) * cc_dim1 + 1] + 
		cc[((k << 1) + 2) * cc_dim1 + 1];
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 1] = cc[((k << 1) + 1) * cc_dim1 
		+ 1] - cc[((k << 1) + 2) * cc_dim1 + 1];
	ch[(k + ch_dim2) * ch_dim1 + 2] = cc[((k << 1) + 1) * cc_dim1 + 2] + 
		cc[((k << 1) + 2) * cc_dim1 + 2];
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 2] = cc[((k << 1) + 1) * cc_dim1 
		+ 2] - cc[((k << 1) + 2) * cc_dim1 + 2];
/* L101: */
    }
    return 0;
L102:
    if (*ido / 2 < *l1) {
	goto L105;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
/* DIR$ IVDEP */
	i__2 = *ido;
	for (i__ = 2; i__ <= i__2; i__ += 2) {
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = cc[i__ - 1 + ((k << 1) + 
		    1) * cc_dim1] + cc[i__ - 1 + ((k << 1) + 2) * cc_dim1];
	    tr2 = cc[i__ - 1 + ((k << 1) + 1) * cc_dim1] - cc[i__ - 1 + ((k <<
		     1) + 2) * cc_dim1];
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + ((k << 1) + 1) * 
		    cc_dim1] + cc[i__ + ((k << 1) + 2) * cc_dim1];
	    ti2 = cc[i__ + ((k << 1) + 1) * cc_dim1] - cc[i__ + ((k << 1) + 2)
		     * cc_dim1];
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * ti2 - 
		    wa1[i__] * tr2;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * tr2 
		    + wa1[i__] * ti2;
/* L103: */
	}
/* L104: */
    }
    return 0;
L105:
    i__1 = *ido;
    for (i__ = 2; i__ <= i__1; i__ += 2) {
/* DIR$ IVDEP */
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = cc[i__ - 1 + ((k << 1) + 
		    1) * cc_dim1] + cc[i__ - 1 + ((k << 1) + 2) * cc_dim1];
	    tr2 = cc[i__ - 1 + ((k << 1) + 1) * cc_dim1] - cc[i__ - 1 + ((k <<
		     1) + 2) * cc_dim1];
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + ((k << 1) + 1) * 
		    cc_dim1] + cc[i__ + ((k << 1) + 2) * cc_dim1];
	    ti2 = cc[i__ + ((k << 1) + 1) * cc_dim1] - cc[i__ + ((k << 1) + 2)
		     * cc_dim1];
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * ti2 - 
		    wa1[i__] * tr2;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * tr2 
		    + wa1[i__] * ti2;
/* L106: */
	}
/* L107: */
    }
    return 0;
} /* duraf2_ */

/* DECK DURAF3 */
/* Subroutine */ int duraf3_(integer *ido, integer *l1, doublereal *cc, 
	doublereal *ch, doublereal *wa1, doublereal *wa2)
{
    /* System generated locals */
    integer cc_dim1, cc_offset, ch_dim1, ch_dim2, ch_offset, i__1, i__2;

    /* Builtin functions */
    double sqrt(doublereal);

    /* Local variables */
    static integer i__, k;
    static doublereal ci2, ci3, di2, di3, cr2, cr3, dr2, dr3, ti2, tr2, taui, 
	    taur;


/* ccc      DATA TAUR,TAUI /-.5D0,-.866025403784439D0/ */

    /* Parameter adjustments */
    ch_dim1 = *ido;
    ch_dim2 = *l1;
    ch_offset = 1 + ch_dim1 * (1 + ch_dim2);
    ch -= ch_offset;
    cc_dim1 = *ido;
    cc_offset = 1 + (cc_dim1 << 2);
    cc -= cc_offset;
    --wa1;
    --wa2;

    /* Function Body */
    taur = 1.;
    taur = -taur / 2;
    taui = 3.;
    taui /= 4;
    taui = -sqrt(taui);
    if (*ido != 2) {
	goto L102;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
	tr2 = cc[(k * 3 + 2) * cc_dim1 + 1] + cc[(k * 3 + 3) * cc_dim1 + 1];
	cr2 = cc[(k * 3 + 1) * cc_dim1 + 1] + taur * tr2;
	ch[(k + ch_dim2) * ch_dim1 + 1] = cc[(k * 3 + 1) * cc_dim1 + 1] + tr2;
	ti2 = cc[(k * 3 + 2) * cc_dim1 + 2] + cc[(k * 3 + 3) * cc_dim1 + 2];
	ci2 = cc[(k * 3 + 1) * cc_dim1 + 2] + taur * ti2;
	ch[(k + ch_dim2) * ch_dim1 + 2] = cc[(k * 3 + 1) * cc_dim1 + 2] + ti2;
	cr3 = taui * (cc[(k * 3 + 2) * cc_dim1 + 1] - cc[(k * 3 + 3) * 
		cc_dim1 + 1]);
	ci3 = taui * (cc[(k * 3 + 2) * cc_dim1 + 2] - cc[(k * 3 + 3) * 
		cc_dim1 + 2]);
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 1] = cr2 - ci3;
	ch[(k + ch_dim2 * 3) * ch_dim1 + 1] = cr2 + ci3;
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 2] = ci2 + cr3;
	ch[(k + ch_dim2 * 3) * ch_dim1 + 2] = ci2 - cr3;
/* L101: */
    }
    return 0;
L102:
    if (*ido / 2 < *l1) {
	goto L105;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
/* DIR$ IVDEP */
	i__2 = *ido;
	for (i__ = 2; i__ <= i__2; i__ += 2) {
	    tr2 = cc[i__ - 1 + (k * 3 + 2) * cc_dim1] + cc[i__ - 1 + (k * 3 + 
		    3) * cc_dim1];
	    cr2 = cc[i__ - 1 + (k * 3 + 1) * cc_dim1] + taur * tr2;
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = cc[i__ - 1 + (k * 3 + 1) *
		     cc_dim1] + tr2;
	    ti2 = cc[i__ + (k * 3 + 2) * cc_dim1] + cc[i__ + (k * 3 + 3) * 
		    cc_dim1];
	    ci2 = cc[i__ + (k * 3 + 1) * cc_dim1] + taur * ti2;
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + (k * 3 + 1) * 
		    cc_dim1] + ti2;
	    cr3 = taui * (cc[i__ - 1 + (k * 3 + 2) * cc_dim1] - cc[i__ - 1 + (
		    k * 3 + 3) * cc_dim1]);
	    ci3 = taui * (cc[i__ + (k * 3 + 2) * cc_dim1] - cc[i__ + (k * 3 + 
		    3) * cc_dim1]);
	    dr2 = cr2 - ci3;
	    dr3 = cr2 + ci3;
	    di2 = ci2 + cr3;
	    di3 = ci2 - cr3;
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * di2 - 
		    wa1[i__] * dr2;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * dr2 
		    + wa1[i__] * di2;
	    ch[i__ + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * di3 - wa2[
		    i__] * dr3;
	    ch[i__ - 1 + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * dr3 + 
		    wa2[i__] * di3;
/* L103: */
	}
/* L104: */
    }
    return 0;
L105:
    i__1 = *ido;
    for (i__ = 2; i__ <= i__1; i__ += 2) {
/* DIR$ IVDEP */
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    tr2 = cc[i__ - 1 + (k * 3 + 2) * cc_dim1] + cc[i__ - 1 + (k * 3 + 
		    3) * cc_dim1];
	    cr2 = cc[i__ - 1 + (k * 3 + 1) * cc_dim1] + taur * tr2;
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = cc[i__ - 1 + (k * 3 + 1) *
		     cc_dim1] + tr2;
	    ti2 = cc[i__ + (k * 3 + 2) * cc_dim1] + cc[i__ + (k * 3 + 3) * 
		    cc_dim1];
	    ci2 = cc[i__ + (k * 3 + 1) * cc_dim1] + taur * ti2;
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + (k * 3 + 1) * 
		    cc_dim1] + ti2;
	    cr3 = taui * (cc[i__ - 1 + (k * 3 + 2) * cc_dim1] - cc[i__ - 1 + (
		    k * 3 + 3) * cc_dim1]);
	    ci3 = taui * (cc[i__ + (k * 3 + 2) * cc_dim1] - cc[i__ + (k * 3 + 
		    3) * cc_dim1]);
	    dr2 = cr2 - ci3;
	    dr3 = cr2 + ci3;
	    di2 = ci2 + cr3;
	    di3 = ci2 - cr3;
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * di2 - 
		    wa1[i__] * dr2;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * dr2 
		    + wa1[i__] * di2;
	    ch[i__ + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * di3 - wa2[
		    i__] * dr3;
	    ch[i__ - 1 + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * dr3 + 
		    wa2[i__] * di3;
/* L106: */
	}
/* L107: */
    }
    return 0;
} /* duraf3_ */

/* DECK DURAF4 */
/* Subroutine */ int duraf4_(integer *ido, integer *l1, doublereal *cc, 
	doublereal *ch, doublereal *wa1, doublereal *wa2, doublereal *wa3)
{
    /* System generated locals */
    integer cc_dim1, cc_offset, ch_dim1, ch_dim2, ch_offset, i__1, i__2;

    /* Local variables */
    static integer i__, k;
    static doublereal ci2, ci3, ci4, cr2, cr3, cr4, ti1, ti2, ti3, ti4, tr1, 
	    tr2, tr3, tr4;

    /* Parameter adjustments */
    ch_dim1 = *ido;
    ch_dim2 = *l1;
    ch_offset = 1 + ch_dim1 * (1 + ch_dim2);
    ch -= ch_offset;
    cc_dim1 = *ido;
    cc_offset = 1 + cc_dim1 * 5;
    cc -= cc_offset;
    --wa1;
    --wa2;
    --wa3;

    /* Function Body */
    if (*ido != 2) {
	goto L102;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
	ti1 = cc[((k << 2) + 1) * cc_dim1 + 2] - cc[((k << 2) + 3) * cc_dim1 
		+ 2];
	ti2 = cc[((k << 2) + 1) * cc_dim1 + 2] + cc[((k << 2) + 3) * cc_dim1 
		+ 2];
	tr4 = cc[((k << 2) + 2) * cc_dim1 + 2] - cc[((k << 2) + 4) * cc_dim1 
		+ 2];
	ti3 = cc[((k << 2) + 2) * cc_dim1 + 2] + cc[((k << 2) + 4) * cc_dim1 
		+ 2];
	tr1 = cc[((k << 2) + 1) * cc_dim1 + 1] - cc[((k << 2) + 3) * cc_dim1 
		+ 1];
	tr2 = cc[((k << 2) + 1) * cc_dim1 + 1] + cc[((k << 2) + 3) * cc_dim1 
		+ 1];
	ti4 = cc[((k << 2) + 4) * cc_dim1 + 1] - cc[((k << 2) + 2) * cc_dim1 
		+ 1];
	tr3 = cc[((k << 2) + 2) * cc_dim1 + 1] + cc[((k << 2) + 4) * cc_dim1 
		+ 1];
	ch[(k + ch_dim2) * ch_dim1 + 1] = tr2 + tr3;
	ch[(k + ch_dim2 * 3) * ch_dim1 + 1] = tr2 - tr3;
	ch[(k + ch_dim2) * ch_dim1 + 2] = ti2 + ti3;
	ch[(k + ch_dim2 * 3) * ch_dim1 + 2] = ti2 - ti3;
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 1] = tr1 + tr4;
	ch[(k + (ch_dim2 << 2)) * ch_dim1 + 1] = tr1 - tr4;
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 2] = ti1 + ti4;
	ch[(k + (ch_dim2 << 2)) * ch_dim1 + 2] = ti1 - ti4;
/* L101: */
    }
    return 0;
L102:
    if (*ido / 2 < *l1) {
	goto L105;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
/* DIR$ IVDEP */
	i__2 = *ido;
	for (i__ = 2; i__ <= i__2; i__ += 2) {
	    ti1 = cc[i__ + ((k << 2) + 1) * cc_dim1] - cc[i__ + ((k << 2) + 3)
		     * cc_dim1];
	    ti2 = cc[i__ + ((k << 2) + 1) * cc_dim1] + cc[i__ + ((k << 2) + 3)
		     * cc_dim1];
	    ti3 = cc[i__ + ((k << 2) + 2) * cc_dim1] + cc[i__ + ((k << 2) + 4)
		     * cc_dim1];
	    tr4 = cc[i__ + ((k << 2) + 2) * cc_dim1] - cc[i__ + ((k << 2) + 4)
		     * cc_dim1];
	    tr1 = cc[i__ - 1 + ((k << 2) + 1) * cc_dim1] - cc[i__ - 1 + ((k <<
		     2) + 3) * cc_dim1];
	    tr2 = cc[i__ - 1 + ((k << 2) + 1) * cc_dim1] + cc[i__ - 1 + ((k <<
		     2) + 3) * cc_dim1];
	    ti4 = cc[i__ - 1 + ((k << 2) + 4) * cc_dim1] - cc[i__ - 1 + ((k <<
		     2) + 2) * cc_dim1];
	    tr3 = cc[i__ - 1 + ((k << 2) + 2) * cc_dim1] + cc[i__ - 1 + ((k <<
		     2) + 4) * cc_dim1];
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = tr2 + tr3;
	    cr3 = tr2 - tr3;
	    ch[i__ + (k + ch_dim2) * ch_dim1] = ti2 + ti3;
	    ci3 = ti2 - ti3;
	    cr2 = tr1 + tr4;
	    cr4 = tr1 - tr4;
	    ci2 = ti1 + ti4;
	    ci4 = ti1 - ti4;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * cr2 
		    + wa1[i__] * ci2;
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * ci2 - 
		    wa1[i__] * cr2;
	    ch[i__ - 1 + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * cr3 + 
		    wa2[i__] * ci3;
	    ch[i__ + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * ci3 - wa2[
		    i__] * cr3;
	    ch[i__ - 1 + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * cr4 
		    + wa3[i__] * ci4;
	    ch[i__ + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * ci4 - 
		    wa3[i__] * cr4;
/* L103: */
	}
/* L104: */
    }
    return 0;
L105:
    i__1 = *ido;
    for (i__ = 2; i__ <= i__1; i__ += 2) {
/* DIR$ IVDEP */
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    ti1 = cc[i__ + ((k << 2) + 1) * cc_dim1] - cc[i__ + ((k << 2) + 3)
		     * cc_dim1];
	    ti2 = cc[i__ + ((k << 2) + 1) * cc_dim1] + cc[i__ + ((k << 2) + 3)
		     * cc_dim1];
	    ti3 = cc[i__ + ((k << 2) + 2) * cc_dim1] + cc[i__ + ((k << 2) + 4)
		     * cc_dim1];
	    tr4 = cc[i__ + ((k << 2) + 2) * cc_dim1] - cc[i__ + ((k << 2) + 4)
		     * cc_dim1];
	    tr1 = cc[i__ - 1 + ((k << 2) + 1) * cc_dim1] - cc[i__ - 1 + ((k <<
		     2) + 3) * cc_dim1];
	    tr2 = cc[i__ - 1 + ((k << 2) + 1) * cc_dim1] + cc[i__ - 1 + ((k <<
		     2) + 3) * cc_dim1];
	    ti4 = cc[i__ - 1 + ((k << 2) + 4) * cc_dim1] - cc[i__ - 1 + ((k <<
		     2) + 2) * cc_dim1];
	    tr3 = cc[i__ - 1 + ((k << 2) + 2) * cc_dim1] + cc[i__ - 1 + ((k <<
		     2) + 4) * cc_dim1];
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = tr2 + tr3;
	    cr3 = tr2 - tr3;
	    ch[i__ + (k + ch_dim2) * ch_dim1] = ti2 + ti3;
	    ci3 = ti2 - ti3;
	    cr2 = tr1 + tr4;
	    cr4 = tr1 - tr4;
	    ci2 = ti1 + ti4;
	    ci4 = ti1 - ti4;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * cr2 
		    + wa1[i__] * ci2;
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * ci2 - 
		    wa1[i__] * cr2;
	    ch[i__ - 1 + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * cr3 + 
		    wa2[i__] * ci3;
	    ch[i__ + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * ci3 - wa2[
		    i__] * cr3;
	    ch[i__ - 1 + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * cr4 
		    + wa3[i__] * ci4;
	    ch[i__ + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * ci4 - 
		    wa3[i__] * cr4;
/* L106: */
	}
/* L107: */
    }
    return 0;
} /* duraf4_ */

/* DECK DURAF5 */
/* Subroutine */ int duraf5_(integer *ido, integer *l1, doublereal *cc, 
	doublereal *ch, doublereal *wa1, doublereal *wa2, doublereal *wa3, 
	doublereal *wa4)
{
    /* Initialized data */

    static doublereal tr11 = .309016994374947;
    static doublereal ti11 = -.951056516295154;
    static doublereal tr12 = -.809016994374947;
    static doublereal ti12 = -.587785252292473;

    /* System generated locals */
    integer cc_dim1, cc_offset, ch_dim1, ch_dim2, ch_offset, i__1, i__2;

    /* Builtin functions */
    double atan(doublereal), sin(doublereal), cos(doublereal);

    /* Local variables */
    static integer i__, k;
    static doublereal pi, ci2, ci3, ci4, ci5, di3, di4, di5, di2, cr2, cr3, 
	    cr5, cr4, ti2, ti3, ti4, ti5, dr3, dr4, dr5, dr2, tr2, tr3, tr4, 
	    tr5, done;


    /* Parameter adjustments */
    ch_dim1 = *ido;
    ch_dim2 = *l1;
    ch_offset = 1 + ch_dim1 * (1 + ch_dim2);
    ch -= ch_offset;
    cc_dim1 = *ido;
    cc_offset = 1 + cc_dim1 * 6;
    cc -= cc_offset;
    --wa1;
    --wa2;
    --wa3;
    --wa4;

    /* Function Body */

    done = 1.;
    pi = atan(done) * 4;
    tr11 = sin(pi / 10);
    ti11 = -cos(pi / 10);
/* c      tr12=-(ti11+done/2) */
    tr12 = -cos(pi / 5);
    ti12 = -sin(pi / 5);

    if (*ido != 2) {
	goto L102;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
	ti5 = cc[(k * 5 + 2) * cc_dim1 + 2] - cc[(k * 5 + 5) * cc_dim1 + 2];
	ti2 = cc[(k * 5 + 2) * cc_dim1 + 2] + cc[(k * 5 + 5) * cc_dim1 + 2];
	ti4 = cc[(k * 5 + 3) * cc_dim1 + 2] - cc[(k * 5 + 4) * cc_dim1 + 2];
	ti3 = cc[(k * 5 + 3) * cc_dim1 + 2] + cc[(k * 5 + 4) * cc_dim1 + 2];
	tr5 = cc[(k * 5 + 2) * cc_dim1 + 1] - cc[(k * 5 + 5) * cc_dim1 + 1];
	tr2 = cc[(k * 5 + 2) * cc_dim1 + 1] + cc[(k * 5 + 5) * cc_dim1 + 1];
	tr4 = cc[(k * 5 + 3) * cc_dim1 + 1] - cc[(k * 5 + 4) * cc_dim1 + 1];
	tr3 = cc[(k * 5 + 3) * cc_dim1 + 1] + cc[(k * 5 + 4) * cc_dim1 + 1];
	ch[(k + ch_dim2) * ch_dim1 + 1] = cc[(k * 5 + 1) * cc_dim1 + 1] + tr2 
		+ tr3;
	ch[(k + ch_dim2) * ch_dim1 + 2] = cc[(k * 5 + 1) * cc_dim1 + 2] + ti2 
		+ ti3;
	cr2 = cc[(k * 5 + 1) * cc_dim1 + 1] + tr11 * tr2 + tr12 * tr3;
	ci2 = cc[(k * 5 + 1) * cc_dim1 + 2] + tr11 * ti2 + tr12 * ti3;
	cr3 = cc[(k * 5 + 1) * cc_dim1 + 1] + tr12 * tr2 + tr11 * tr3;
	ci3 = cc[(k * 5 + 1) * cc_dim1 + 2] + tr12 * ti2 + tr11 * ti3;
	cr5 = ti11 * tr5 + ti12 * tr4;
	ci5 = ti11 * ti5 + ti12 * ti4;
	cr4 = ti12 * tr5 - ti11 * tr4;
	ci4 = ti12 * ti5 - ti11 * ti4;
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 1] = cr2 - ci5;
	ch[(k + ch_dim2 * 5) * ch_dim1 + 1] = cr2 + ci5;
	ch[(k + (ch_dim2 << 1)) * ch_dim1 + 2] = ci2 + cr5;
	ch[(k + ch_dim2 * 3) * ch_dim1 + 2] = ci3 + cr4;
	ch[(k + ch_dim2 * 3) * ch_dim1 + 1] = cr3 - ci4;
	ch[(k + (ch_dim2 << 2)) * ch_dim1 + 1] = cr3 + ci4;
	ch[(k + (ch_dim2 << 2)) * ch_dim1 + 2] = ci3 - cr4;
	ch[(k + ch_dim2 * 5) * ch_dim1 + 2] = ci2 - cr5;
/* L101: */
    }
    return 0;
L102:
    if (*ido / 2 < *l1) {
	goto L105;
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
/* DIR$ IVDEP */
	i__2 = *ido;
	for (i__ = 2; i__ <= i__2; i__ += 2) {
	    ti5 = cc[i__ + (k * 5 + 2) * cc_dim1] - cc[i__ + (k * 5 + 5) * 
		    cc_dim1];
	    ti2 = cc[i__ + (k * 5 + 2) * cc_dim1] + cc[i__ + (k * 5 + 5) * 
		    cc_dim1];
	    ti4 = cc[i__ + (k * 5 + 3) * cc_dim1] - cc[i__ + (k * 5 + 4) * 
		    cc_dim1];
	    ti3 = cc[i__ + (k * 5 + 3) * cc_dim1] + cc[i__ + (k * 5 + 4) * 
		    cc_dim1];
	    tr5 = cc[i__ - 1 + (k * 5 + 2) * cc_dim1] - cc[i__ - 1 + (k * 5 + 
		    5) * cc_dim1];
	    tr2 = cc[i__ - 1 + (k * 5 + 2) * cc_dim1] + cc[i__ - 1 + (k * 5 + 
		    5) * cc_dim1];
	    tr4 = cc[i__ - 1 + (k * 5 + 3) * cc_dim1] - cc[i__ - 1 + (k * 5 + 
		    4) * cc_dim1];
	    tr3 = cc[i__ - 1 + (k * 5 + 3) * cc_dim1] + cc[i__ - 1 + (k * 5 + 
		    4) * cc_dim1];
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = cc[i__ - 1 + (k * 5 + 1) *
		     cc_dim1] + tr2 + tr3;
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + (k * 5 + 1) * 
		    cc_dim1] + ti2 + ti3;
	    cr2 = cc[i__ - 1 + (k * 5 + 1) * cc_dim1] + tr11 * tr2 + tr12 * 
		    tr3;
	    ci2 = cc[i__ + (k * 5 + 1) * cc_dim1] + tr11 * ti2 + tr12 * ti3;
	    cr3 = cc[i__ - 1 + (k * 5 + 1) * cc_dim1] + tr12 * tr2 + tr11 * 
		    tr3;
	    ci3 = cc[i__ + (k * 5 + 1) * cc_dim1] + tr12 * ti2 + tr11 * ti3;
	    cr5 = ti11 * tr5 + ti12 * tr4;
	    ci5 = ti11 * ti5 + ti12 * ti4;
	    cr4 = ti12 * tr5 - ti11 * tr4;
	    ci4 = ti12 * ti5 - ti11 * ti4;
	    dr3 = cr3 - ci4;
	    dr4 = cr3 + ci4;
	    di3 = ci3 + cr4;
	    di4 = ci3 - cr4;
	    dr5 = cr2 + ci5;
	    dr2 = cr2 - ci5;
	    di5 = ci2 - cr5;
	    di2 = ci2 + cr5;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * dr2 
		    + wa1[i__] * di2;
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * di2 - 
		    wa1[i__] * dr2;
	    ch[i__ - 1 + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * dr3 + 
		    wa2[i__] * di3;
	    ch[i__ + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * di3 - wa2[
		    i__] * dr3;
	    ch[i__ - 1 + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * dr4 
		    + wa3[i__] * di4;
	    ch[i__ + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * di4 - 
		    wa3[i__] * dr4;
	    ch[i__ - 1 + (k + ch_dim2 * 5) * ch_dim1] = wa4[i__ - 1] * dr5 + 
		    wa4[i__] * di5;
	    ch[i__ + (k + ch_dim2 * 5) * ch_dim1] = wa4[i__ - 1] * di5 - wa4[
		    i__] * dr5;
/* L103: */
	}
/* L104: */
    }
    return 0;
L105:
    i__1 = *ido;
    for (i__ = 2; i__ <= i__1; i__ += 2) {
/* DIR$ IVDEP */
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    ti5 = cc[i__ + (k * 5 + 2) * cc_dim1] - cc[i__ + (k * 5 + 5) * 
		    cc_dim1];
	    ti2 = cc[i__ + (k * 5 + 2) * cc_dim1] + cc[i__ + (k * 5 + 5) * 
		    cc_dim1];
	    ti4 = cc[i__ + (k * 5 + 3) * cc_dim1] - cc[i__ + (k * 5 + 4) * 
		    cc_dim1];
	    ti3 = cc[i__ + (k * 5 + 3) * cc_dim1] + cc[i__ + (k * 5 + 4) * 
		    cc_dim1];
	    tr5 = cc[i__ - 1 + (k * 5 + 2) * cc_dim1] - cc[i__ - 1 + (k * 5 + 
		    5) * cc_dim1];
	    tr2 = cc[i__ - 1 + (k * 5 + 2) * cc_dim1] + cc[i__ - 1 + (k * 5 + 
		    5) * cc_dim1];
	    tr4 = cc[i__ - 1 + (k * 5 + 3) * cc_dim1] - cc[i__ - 1 + (k * 5 + 
		    4) * cc_dim1];
	    tr3 = cc[i__ - 1 + (k * 5 + 3) * cc_dim1] + cc[i__ - 1 + (k * 5 + 
		    4) * cc_dim1];
	    ch[i__ - 1 + (k + ch_dim2) * ch_dim1] = cc[i__ - 1 + (k * 5 + 1) *
		     cc_dim1] + tr2 + tr3;
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + (k * 5 + 1) * 
		    cc_dim1] + ti2 + ti3;
	    cr2 = cc[i__ - 1 + (k * 5 + 1) * cc_dim1] + tr11 * tr2 + tr12 * 
		    tr3;
	    ci2 = cc[i__ + (k * 5 + 1) * cc_dim1] + tr11 * ti2 + tr12 * ti3;
	    cr3 = cc[i__ - 1 + (k * 5 + 1) * cc_dim1] + tr12 * tr2 + tr11 * 
		    tr3;
	    ci3 = cc[i__ + (k * 5 + 1) * cc_dim1] + tr12 * ti2 + tr11 * ti3;
	    cr5 = ti11 * tr5 + ti12 * tr4;
	    ci5 = ti11 * ti5 + ti12 * ti4;
	    cr4 = ti12 * tr5 - ti11 * tr4;
	    ci4 = ti12 * ti5 - ti11 * ti4;
	    dr3 = cr3 - ci4;
	    dr4 = cr3 + ci4;
	    di3 = ci3 + cr4;
	    di4 = ci3 - cr4;
	    dr5 = cr2 + ci5;
	    dr2 = cr2 - ci5;
	    di5 = ci2 - cr5;
	    di2 = ci2 + cr5;
	    ch[i__ - 1 + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * dr2 
		    + wa1[i__] * di2;
	    ch[i__ + (k + (ch_dim2 << 1)) * ch_dim1] = wa1[i__ - 1] * di2 - 
		    wa1[i__] * dr2;
	    ch[i__ - 1 + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * dr3 + 
		    wa2[i__] * di3;
	    ch[i__ + (k + ch_dim2 * 3) * ch_dim1] = wa2[i__ - 1] * di3 - wa2[
		    i__] * dr3;
	    ch[i__ - 1 + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * dr4 
		    + wa3[i__] * di4;
	    ch[i__ + (k + (ch_dim2 << 2)) * ch_dim1] = wa3[i__ - 1] * di4 - 
		    wa3[i__] * dr4;
	    ch[i__ - 1 + (k + ch_dim2 * 5) * ch_dim1] = wa4[i__ - 1] * dr5 + 
		    wa4[i__] * di5;
	    ch[i__ + (k + ch_dim2 * 5) * ch_dim1] = wa4[i__ - 1] * di5 - wa4[
		    i__] * dr5;
/* L106: */
	}
/* L107: */
    }
    return 0;
} /* duraf5_ */

/* DECK DURAF */
/* Subroutine */ int duraf_(integer *nac, integer *ido, integer *ip, integer *
	l1, integer *idl1, doublereal *cc, doublereal *c1, doublereal *c2, 
	doublereal *ch, doublereal *ch2, doublereal *wa)
{
    /* System generated locals */
    integer ch_dim1, ch_dim2, ch_offset, cc_dim1, cc_dim2, cc_offset, c1_dim1,
	     c1_dim2, c1_offset, c2_dim1, c2_offset, ch2_dim1, ch2_offset, 
	    i__1, i__2, i__3;

    /* Local variables */
    static integer i__, j, k, l, jc, lc, ik, nt, idj, idl, inc, idp;
    static doublereal wai, war;
    static integer ipp2, idij, idlj, idot, ipph;

    /* Parameter adjustments */
    ch_dim1 = *ido;
    ch_dim2 = *l1;
    ch_offset = 1 + ch_dim1 * (1 + ch_dim2);
    ch -= ch_offset;
    c1_dim1 = *ido;
    c1_dim2 = *l1;
    c1_offset = 1 + c1_dim1 * (1 + c1_dim2);
    c1 -= c1_offset;
    cc_dim1 = *ido;
    cc_dim2 = *ip;
    cc_offset = 1 + cc_dim1 * (1 + cc_dim2);
    cc -= cc_offset;
    ch2_dim1 = *idl1;
    ch2_offset = 1 + ch2_dim1;
    ch2 -= ch2_offset;
    c2_dim1 = *idl1;
    c2_offset = 1 + c2_dim1;
    c2 -= c2_offset;
    --wa;

    /* Function Body */
    idot = *ido / 2;
    nt = *ip * *idl1;
    ipp2 = *ip + 2;
    ipph = (*ip + 1) / 2;
    idp = *ip * *ido;

    if (*ido < *l1) {
	goto L106;
    }
    i__1 = ipph;
    for (j = 2; j <= i__1; ++j) {
	jc = ipp2 - j;
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
/* DIR$ IVDEP */
	    i__3 = *ido;
	    for (i__ = 1; i__ <= i__3; ++i__) {
		ch[i__ + (k + j * ch_dim2) * ch_dim1] = cc[i__ + (j + k * 
			cc_dim2) * cc_dim1] + cc[i__ + (jc + k * cc_dim2) * 
			cc_dim1];
		ch[i__ + (k + jc * ch_dim2) * ch_dim1] = cc[i__ + (j + k * 
			cc_dim2) * cc_dim1] - cc[i__ + (jc + k * cc_dim2) * 
			cc_dim1];
/* L101: */
	    }
/* L102: */
	}
/* L103: */
    }
    i__1 = *l1;
    for (k = 1; k <= i__1; ++k) {
/* DIR$ IVDEP */
	i__2 = *ido;
	for (i__ = 1; i__ <= i__2; ++i__) {
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + (k * cc_dim2 + 1) * 
		    cc_dim1];
/* L104: */
	}
/* L105: */
    }
    goto L112;
L106:
    i__1 = ipph;
    for (j = 2; j <= i__1; ++j) {
	jc = ipp2 - j;
	i__2 = *ido;
	for (i__ = 1; i__ <= i__2; ++i__) {
/* DIR$ IVDEP */
	    i__3 = *l1;
	    for (k = 1; k <= i__3; ++k) {
		ch[i__ + (k + j * ch_dim2) * ch_dim1] = cc[i__ + (j + k * 
			cc_dim2) * cc_dim1] + cc[i__ + (jc + k * cc_dim2) * 
			cc_dim1];
		ch[i__ + (k + jc * ch_dim2) * ch_dim1] = cc[i__ + (j + k * 
			cc_dim2) * cc_dim1] - cc[i__ + (jc + k * cc_dim2) * 
			cc_dim1];
/* L107: */
	    }
/* L108: */
	}
/* L109: */
    }
    i__1 = *ido;
    for (i__ = 1; i__ <= i__1; ++i__) {
/* DIR$ IVDEP */
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    ch[i__ + (k + ch_dim2) * ch_dim1] = cc[i__ + (k * cc_dim2 + 1) * 
		    cc_dim1];
/* L110: */
	}
/* L111: */
    }
L112:
    idl = 2 - *ido;
    inc = 0;
    i__1 = ipph;
    for (l = 2; l <= i__1; ++l) {
	lc = ipp2 - l;
	idl += *ido;
/* DIR$ IVDEP */
	i__2 = *idl1;
	for (ik = 1; ik <= i__2; ++ik) {
	    c2[ik + l * c2_dim1] = ch2[ik + ch2_dim1] + wa[idl - 1] * ch2[ik 
		    + (ch2_dim1 << 1)];
	    c2[ik + lc * c2_dim1] = -wa[idl] * ch2[ik + *ip * ch2_dim1];
/* L113: */
	}
	idlj = idl;
	inc += *ido;
	i__2 = ipph;
	for (j = 3; j <= i__2; ++j) {
	    jc = ipp2 - j;
	    idlj += inc;
	    if (idlj > idp) {
		idlj -= idp;
	    }
	    war = wa[idlj - 1];
	    wai = wa[idlj];
/* DIR$ IVDEP */
	    i__3 = *idl1;
	    for (ik = 1; ik <= i__3; ++ik) {
		c2[ik + l * c2_dim1] += war * ch2[ik + j * ch2_dim1];
		c2[ik + lc * c2_dim1] -= wai * ch2[ik + jc * ch2_dim1];
/* L114: */
	    }
/* L115: */
	}
/* L116: */
    }
    i__1 = ipph;
    for (j = 2; j <= i__1; ++j) {
/* DIR$ IVDEP */
	i__2 = *idl1;
	for (ik = 1; ik <= i__2; ++ik) {
	    ch2[ik + ch2_dim1] += ch2[ik + j * ch2_dim1];
/* L117: */
	}
/* L118: */
    }
    i__1 = ipph;
    for (j = 2; j <= i__1; ++j) {
	jc = ipp2 - j;
/* DIR$ IVDEP */
	i__2 = *idl1;
	for (ik = 2; ik <= i__2; ik += 2) {
	    ch2[ik - 1 + j * ch2_dim1] = c2[ik - 1 + j * c2_dim1] - c2[ik + 
		    jc * c2_dim1];
	    ch2[ik - 1 + jc * ch2_dim1] = c2[ik - 1 + j * c2_dim1] + c2[ik + 
		    jc * c2_dim1];
	    ch2[ik + j * ch2_dim1] = c2[ik + j * c2_dim1] + c2[ik - 1 + jc * 
		    c2_dim1];
	    ch2[ik + jc * ch2_dim1] = c2[ik + j * c2_dim1] - c2[ik - 1 + jc * 
		    c2_dim1];
/* L119: */
	}
/* L120: */
    }
    *nac = 1;
    if (*ido == 2) {
	return 0;
    }
    *nac = 0;
/* DIR$ IVDEP */
    i__1 = *idl1;
    for (ik = 1; ik <= i__1; ++ik) {
	c2[ik + c2_dim1] = ch2[ik + ch2_dim1];
/* L121: */
    }
    i__1 = *ip;
    for (j = 2; j <= i__1; ++j) {
/* DIR$ IVDEP */
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    c1[(k + j * c1_dim2) * c1_dim1 + 1] = ch[(k + j * ch_dim2) * 
		    ch_dim1 + 1];
	    c1[(k + j * c1_dim2) * c1_dim1 + 2] = ch[(k + j * ch_dim2) * 
		    ch_dim1 + 2];
/* L122: */
	}
/* L123: */
    }
    if (idot > *l1) {
	goto L127;
    }
    idij = 0;
    i__1 = *ip;
    for (j = 2; j <= i__1; ++j) {
	idij += 2;
	i__2 = *ido;
	for (i__ = 4; i__ <= i__2; i__ += 2) {
	    idij += 2;
/* DIR$ IVDEP */
	    i__3 = *l1;
	    for (k = 1; k <= i__3; ++k) {
		c1[i__ - 1 + (k + j * c1_dim2) * c1_dim1] = wa[idij - 1] * ch[
			i__ - 1 + (k + j * ch_dim2) * ch_dim1] + wa[idij] * 
			ch[i__ + (k + j * ch_dim2) * ch_dim1];
		c1[i__ + (k + j * c1_dim2) * c1_dim1] = wa[idij - 1] * ch[i__ 
			+ (k + j * ch_dim2) * ch_dim1] - wa[idij] * ch[i__ - 
			1 + (k + j * ch_dim2) * ch_dim1];
/* L124: */
	    }
/* L125: */
	}
/* L126: */
    }
    return 0;
L127:
    idj = 2 - *ido;
    i__1 = *ip;
    for (j = 2; j <= i__1; ++j) {
	idj += *ido;
	i__2 = *l1;
	for (k = 1; k <= i__2; ++k) {
	    idij = idj;
/* DIR$ IVDEP */
	    i__3 = *ido;
	    for (i__ = 4; i__ <= i__3; i__ += 2) {
		idij += 2;
		c1[i__ - 1 + (k + j * c1_dim2) * c1_dim1] = wa[idij - 1] * ch[
			i__ - 1 + (k + j * ch_dim2) * ch_dim1] + wa[idij] * 
			ch[i__ + (k + j * ch_dim2) * ch_dim1];
		c1[i__ + (k + j * c1_dim2) * c1_dim1] = wa[idij - 1] * ch[i__ 
			+ (k + j * ch_dim2) * ch_dim1] - wa[idij] * ch[i__ - 
			1 + (k + j * ch_dim2) * ch_dim1];
/* L128: */
	    }
/* L129: */
	}
/* L130: */
    }
    return 0;
} /* duraf_ */

/* Subroutine */ int durdec_0_(int n__, doublecomplex *f, doublecomplex *c__, 
	doublecomplex *coscoe, doublecomplex *sincoe, doublecomplex *w, 
	doublecomplex *wsave, integer *n77)
{
    /* Initialized data */

    static doublecomplex ima = {0.,1.};
    static doublereal dhalf = .5;

    /* System generated locals */
    integer i__1, i__2, i__3;
    doublereal d__1;
    doublecomplex z__1, z__2, z__3;

    /* Local variables */
    static integer i__, n;
    static doublereal d1;
    static integer i1;
    static doublecomplex ak, bk;
    static integer in1;
    static doublecomplex alk, im05, betk;
    static integer nhalf;
    extern /* Subroutine */ int dcfftb_(), dcfftf_(), dcffti_();

    /* Parameter adjustments */
    if (f) {
	--f;
	}
    if (coscoe) {
	--coscoe;
	}
    if (sincoe) {
	--sincoe;
	}
    if (w) {
	--w;
	}
    --wsave;

    /* Function Body */
    switch(n__) {
	case 1: goto L_durini;
	case 2: goto L_dursyn;
	}


/*        COPY THE ARRAY INTO W */

    i__1 = n;
    for (i__ = 1; i__ <= i__1; ++i__) {
	i__2 = i__;
	i__3 = i__;
	w[i__2].r = f[i__3].r, w[i__2].i = f[i__3].i;
/* L1200: */
    }

/*        FOURIER TRANSFORM W */

    dcfftf_(&n, (doublereal*)(&w[1]), (doublereal*)(&wsave[1]));
/*        CALL PRIN('INSIDE FURDEC W IS*',W,N*2) */

/*        SEPARATE INTO SINES AND COSINES */

    d__1 = (doublereal) n;
    z__1.r = w[1].r / d__1, z__1.i = w[1].i / d__1;
    c__->r = z__1.r, c__->i = z__1.i;
    i__1 = nhalf;
    for (i__ = 1; i__ <= i__1; ++i__) {
	i1 = i__ + 1;
	in1 = n - i__ + 1;
	i__2 = i1;
	alk.r = w[i__2].r, alk.i = w[i__2].i;
	i__2 = in1;
	betk.r = w[i__2].r, betk.i = w[i__2].i;
/*       CALL PRIN('BEFORE DO LOOP INSIDE FURDEC IM05 IS*',IM05,2) */
	i__2 = i__;
	z__2.r = alk.r + betk.r, z__2.i = alk.i + betk.i;
	z__1.r = d1 * z__2.r, z__1.i = d1 * z__2.i;
	coscoe[i__2].r = z__1.r, coscoe[i__2].i = z__1.i;
	i__2 = i__;
	z__2.r = alk.r - betk.r, z__2.i = alk.i - betk.i;
	z__1.r = im05.r * z__2.r - im05.i * z__2.i, z__1.i = im05.r * z__2.i 
		+ im05.i * z__2.r;
	sincoe[i__2].r = z__1.r, sincoe[i__2].i = z__1.i;
/* L1400: */
    }
/*       CALL PRIN('INSIDE FURDEC SINCOE IS*',SINCOE,NHALF*2) */
    return 0;





L_durini:
    n = *n77;
    dcffti_(&n, (doublereal*)(&wsave[1]));
    nhalf = n / 2;
    z__3.r = ima.r * .5f, z__3.i = ima.i * .5f;
    z__2.r = z__3.r * 2.f, z__2.i = z__3.i * 2.f;
    d__1 = (doublereal) n;
    z__1.r = z__2.r / d__1, z__1.i = z__2.i / d__1;
    im05.r = z__1.r, im05.i = z__1.i;
    d1 = 1.;
    d1 /= n;
    return 0;





L_dursyn:

/*        MERGE SINES AND COSINES INTO EXPONENTIIALS */

    f[1].r = c__->r, f[1].i = c__->i;
    i__1 = nhalf;
    for (i__ = 1; i__ <= i__1; ++i__) {
	i1 = i__ + 1;
	in1 = n - i__ + 1;
	i__2 = i__;
	z__1.r = dhalf * coscoe[i__2].r, z__1.i = dhalf * coscoe[i__2].i;
	ak.r = z__1.r, ak.i = z__1.i;
	i__2 = i__;
	z__1.r = dhalf * sincoe[i__2].r, z__1.i = dhalf * sincoe[i__2].i;
	bk.r = z__1.r, bk.i = z__1.i;
	i__2 = i1;
	z__2.r = ima.r * bk.r - ima.i * bk.i, z__2.i = ima.r * bk.i + ima.i * 
		bk.r;
	z__1.r = ak.r - z__2.r, z__1.i = ak.i - z__2.i;
	f[i__2].r = z__1.r, f[i__2].i = z__1.i;
	i__2 = in1;
	z__2.r = ima.r * bk.r - ima.i * bk.i, z__2.i = ima.r * bk.i + ima.i * 
		bk.r;
	z__1.r = ak.r + z__2.r, z__1.i = ak.i + z__2.i;
	f[i__2].r = z__1.r, f[i__2].i = z__1.i;
/* L2200: */
    }

/*        PERFORM THE FOURIER TRANSFORMATION */

    dcfftb_(&n, (doublereal*)(&f[1]), (doublereal*)(&wsave[1]));
    return 0;
} /* durdec_ */

/* Subroutine */ int durdec_(doublecomplex *f, doublecomplex *c__, 
	doublecomplex *coscoe, doublecomplex *sincoe, doublecomplex *w, 
	doublecomplex *wsave)
{
    return durdec_0_(0, f, c__, coscoe, sincoe, w, wsave, (integer *)0);
    }

/* Subroutine */ int durini_(doublecomplex *wsave, integer *n77)
{
    return durdec_0_(1, (doublecomplex *)0, (doublecomplex *)0, (
	    doublecomplex *)0, (doublecomplex *)0, (doublecomplex *)0, wsave, 
	    n77);
    }

/* Subroutine */ int dursyn_(doublecomplex *c__, doublecomplex *coscoe, 
	doublecomplex *sincoe, doublecomplex *f, doublecomplex *wsave)
{
    return durdec_0_(2, f, c__, coscoe, sincoe, (doublecomplex *)0, wsave, (
	    integer *)0);
    }

