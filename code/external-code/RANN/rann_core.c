/* this code was generated with the help of f2c */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef int integer;
typedef double doublereal;
typedef struct mycomplex {double r; double i;} doublecomplex;

/* Table of constant values */

static integer c__1 = 1;
static integer c__12 = 12;
static integer c__0 = 0;
static integer c__3 = 3;
static integer c__2 = 2;

// the code contains two user-callable functions:
// -- rann_all
// -- get_rann_memory

// here is their description:


/*
  Runs RANN on a user-provided collection of points

  INPUT
  -----
  int n:
     number of points
  int m:
     dimensionality 
  double* pts:
     the points (given as a flat array of n*m doubles,
                 first point occupying the first m double words, etc.)
  int numit:
     the number of iterations of the basic algorithm (should be at least 1)
  int isuper:
     0   = no supercharging
     >0  = perform supercharging (after the basic iterations)
  int istat:
     0   = no statistics
     >0  = perform statistics on a subcollection of 1000 points
  int k:
     number of requested nearest neighbors per point
  int lenw:
     the size of the work array

  OUTPUT
  ------
  int* near_convicts:
     the list of indices of approximate nearest neighbors per point
     the indices are 1-based (each index is an integer between 1 and n)
     the memory (at least sizeof(int)*n*k bytes) should be allocated by user
     the first k integers correspond to the first point, etc.

  double* dists_convicts:
     the distances to approximate nearest neighbors
     obviously correspond to appr. nearest neighbors from near_convicts
     the memory (at least sizeof(double)*n*k bytes) should be allocated by user
     the first k doubles correspond to the first point, etc.

  double* w:
     the work array (should be at least lenw double words long)
     the memory should be allocated by user
     to figure out how much you need, call
        get_rann_memory(n,m,k,numit,&lenw);
     if istat != 0, the following statistics will be stored in w:
        w[19]: the average distance to true nearest neighbors
	w[20]: the average distance to approximate nearest neighbors
	w[21]: the proportion of true nearest neighbors among the appr. ones
	w[22]: the time by iterations and supercharging
	w[23]: the time by statistics
 */
void rann_all(int n, int m, double* pts,
	      int numit, int isuper, int istat,
	      int* near_convicts, double* dists_convicts,
	      int k, double* w, int lenw);


/*
  computes the number of double words required by RANN (see rann_all above)

  INPUT
  -----
  int n:
     number of points
  int m:
     dimensionality 
  int k:
     number of requested nearest neighbors per point
  int numit:
     the number of iterations of the basic algorithm (should be at least 1)

  OUTPUT
  ------
  int* lenw:
     the number of double words required by RANN (see rann_all above)
 */
void get_rann_memory(int n, int m, int k, int numit, int* lenw);





/* PROTOTYPES */





// m^n
integer pow_ii(integer *m, integer *n);

//
int cpu_time__(doublereal* t);

/* Subroutine */ int tree_test__(integer *n, integer *m, doublereal *a, 
				 integer *numit, integer *isuper,
				 integer *istat,
				 integer *near_convicts__,
				 doublereal *dists_convicts__, integer *k,
				 doublereal *w, integer *lenw);

/* Subroutine */ int get_stats_lookup__(doublereal *rat_ave__, integer *ntest,
					doublereal *dnum_belongs_ave__,
					doublereal *smalls,
					doublereal *rat0s,
					integer *n, integer *m, integer *k,
					doublereal *a,
					integer *inds_many__,
					doublereal *dists_many__,
					doublereal *cpu);
/* Subroutine */ int get_stats_many_get_size__(integer *n, integer *k, 
					       integer *lwrk);

/* Subroutine */ int get_stats_many__(doublereal *x, doublereal *a,
				      integer *m, integer *n,
				      integer *ntest, integer *inds,
				      doublereal *dists, 
				      integer *k, doublereal *rat,
				      doublereal *prop,
				      doublereal *dist_true__,
				      doublereal *dist_susp__,
				      doublereal *wrk, integer *lwrk);
/* Subroutine */ int get_stats_onepnt__(doublereal *x, doublereal *a,
					integer *m, integer *n,
					integer *inds, doublereal *dists,
					integer *k, 
					doublereal *rat,
					doublereal *prop_belong__,
					integer *num_belong__, 
					integer *nsmall, doublereal *sum_true__,
					doublereal *sum_appr__, 
					doublereal *rat0,
					doublereal *sum_true2__,
					doublereal *sum_appr2__, 
					doublereal *dds, integer *ia,
					doublereal *dds2, integer *iaa,
					integer *ib);
/* Subroutine */ int onepoint_all_get_size__(integer *n, integer *k,
					     integer *numit, integer *levmax,
					     integer *lenw2);
/* Subroutine */ int onepoint_all__(doublereal *x, doublereal *w, doublereal *a,
				    integer *isuper,
				    integer *near_convicts__,
				    doublereal *dists_convicts__,
				    integer *inds, doublereal *dists,
				    doublereal *w2, integer *lenw2);
/* Subroutine */ int onepoint_super__(doublereal *x, integer *inds, 
				      doublereal *dists,
				      integer *n, integer *m,
				      doublereal *a, integer *k, 
				      integer *near_convicts__,
				      doublereal *dists_convicts__,
				      integer *inds2, doublereal *dists2,
				      integer *jjs);
/* Subroutine */ int all_sets_suspects__(doublereal *x, doublereal *v, 
					 integer *indsv, doublereal *a,
					 integer *numit, integer *k,
					 integer *inds, doublereal *dists,
					 integer *inds2, doublereal *dists2,
					 integer *jjs, integer *suspects,
					 doublereal *dds);
/* Subroutine */ int one_set_suspects__(doublereal *x, doublereal *v, 
					doublereal *a, integer *inds,
					doublereal *dists, integer *jjs, 
					integer *suspects, doublereal *dds);
/* Subroutine */ int one_set_suspects0__(doublereal *x, integer *n, integer *m,
					 doublereal *a, integer *k,
					 integer *levels, integer *levmax, 
					 integer *boxes, doublereal *centers,
					 doublereal *w_transf__,
					 integer *ipts, doublereal *ds,
					 integer *inds, doublereal *dists,
					 integer *jjs, integer *suspects,
					 doublereal *dds);
/* Subroutine */ int inwhich_box__(doublereal *x, integer *m, doublereal *ds, 
				   doublereal *centers, integer *levmax,
				   doublereal *w, integer *ibox, 
				   integer *boxes, doublereal *y, doublereal *y2);
/* Subroutine */ int index_aid__(integer *ipts, integer *inds, integer *k);
/* Subroutine */ int all_iter__(integer *ier, integer *n, integer *m, 
				doublereal *a, integer *k, integer *numit,
				integer *isuper,
				integer *near_convicts__,
				doublereal *dists_convicts__,
				doublereal *w, integer *lenw,
				integer *lused, integer *keep);
/* Subroutine */ int all_iter0__(integer *ier, integer *n, integer *m, 
				 doublereal *a, integer *k, integer *numit,
				 integer *nsteps, integer *near_convicts__,
				 integer *near_suspects__,
				 doublereal *dists_near__, 
				 doublereal *dists_convicts__,
				 doublereal *w, integer *lenw2, integer *lused,
				 integer *ipts, integer *ia, integer *ib,
				 doublereal *rs, 
				 doublereal *rs2, integer *ib2, doublereal *v,
				 integer *indsv, integer *keep_max__);
/* Subroutine */ int one_iter__(integer *ier, integer *n, integer *m, 
				doublereal *a, integer *k, integer *nsteps,
				integer *near_suspects__, 
				doublereal *b, integer *ipts, doublereal *w,
				integer *lenw3, integer *lused,
				doublereal *dists_near__, doublereal *v,
				integer *keepv, 
				doublereal *ds, integer *keep_max__);
/* Subroutine */ int retr_arrs__(integer *n, integer *m, integer *k,
				 integer *ilevels, integer *levmax,
				 integer *iboxes, integer *nbout,
				 integer *icenters, integer *iw_transf__,
				 integer *keepw, integer *iipts, 
				 integer *ids, doublereal *w);
/* Subroutine */ int store_arrs__(integer *n, integer *m, integer *k,
				  integer *levels, integer *levmax,
				  integer *boxes, integer *nbout,
				  doublereal *centers,
				  doublereal *w_transf__, integer *keepw,
				  integer *ipts, doublereal *ds,
				  doublereal *w, integer *keep,
				  integer *keep_max__);
/* Subroutine */ int one_iter0__(integer *n, integer *m, doublereal *a, 
				 integer *k, integer *levmax, integer *inboxes,
				 integer *near_suspects__,
				 integer *boxes, integer *iconts,
				 integer *levels, 
				 integer *ipts, doublereal *work,
				 integer *suspects, integer *inbox, 
				 doublereal *rs, integer *ia,
				 doublereal *dists_near__, integer *near_nums__,
				 doublereal *centers, integer *nbout);
/* Subroutine */ int store_one__(integer *ipoint, integer *jj,
				 doublereal *d__, integer *near_suspects__,
				 doublereal *dists_near__,
				 integer *near_nums__, integer *k);
/* Subroutine */ int one_box_lists__(integer *ibox, integer *levels,
				     integer *levmax, integer *iconts);
/* Subroutine */ int to_binary__(integer *ii, integer *levmax, integer *iarr);
/* Subroutine */ int find_box__(integer *indbox, integer *levels,
				integer *levmax, integer *ib);
/* Subroutine */ int struct_bld__(integer *n, integer *m, doublereal *a, 
				  integer *boxes, integer *levels,
				  integer *levmax, integer *nbout, 
				  integer *ipts, doublereal *work,
				  doublereal *centers);
/* Subroutine */ int one_subdiv__(doublereal *a, integer *ipts, integer *m, 
				  integer *n, integer *ibox, integer *boxes,
				  integer *nb, integer *nbout,
				  integer *ib1, integer *ib2,
				  integer *icoord, doublereal *thresh,
				  doublereal *xs, doublereal *ys, doublereal *ww);
/* Subroutine */ int one_sepa__(doublereal *a, integer *ipts, integer *m, 
				integer *n, integer *icoord, integer *n1,
				integer *n2, integer *ia, 
				integer *jpts, doublereal *xs,
				doublereal *thresh, doublereal *ys, 
				doublereal *ww);
/* Subroutine */ int array_subdiv__(doublereal *xs, integer *n, integer *nthresh,
				    doublereal *x3, integer *i1,
				    integer *ia, integer *w);
/* Subroutine */ int array_subdiv_onestep__(integer *ia, doublereal *xs, 
					    doublereal *xmin, doublereal *xmax,
					    doublereal *x3, integer *n, 
					    integer *n1, integer *iaa,
					    integer *ibb);
/* Subroutine */ int dist_compute__(doublereal *a1, doublereal *a2,
				    integer *m, doublereal *d__);



/* Subroutine */ int peter_copy__(doublereal *a, doublereal *b, integer *n);
/* Subroutine */ int peter_intcopy__(integer *ia, integer *ib, integer *n);
/* Subroutine */ int peter_heapsort_rea_down__(doublereal *ra, integer *ia, 
					       integer *n);
/* Subroutine */ int peter_replace_one_down__(doublereal *ra, integer *ia, 
					      integer *n,
					      doublereal *x, integer *ix);
/* Subroutine */ int peter_heap_build_down__(doublereal *ra, integer *ia, 
					     integer *n);
/* Subroutine */ int peter_heapit_rea_down__(doublereal *ra, integer *ia, 
					     integer *n, integer *ii);
/* Subroutine */ int peter_heapsort_rea_up__(doublereal *ra, integer *ia, 
					     integer *n, integer *k,
					     integer *kk);
/* Subroutine */ int peter_heapit_rea_up__(doublereal *ra, integer *ia, 
					   integer *n, integer *ii);


/* Subroutine */ int second_search__(doublereal *a, integer *m, integer *n, 
				     integer *k, integer *near_convicts__,
				     doublereal *dists_convicts__, 
				     integer *iarr, doublereal *rarr,
				     integer *iarr2, integer *ia, 
				     doublereal *rarr2);
/* Subroutine */ int get_stats__(integer *n, integer *m, doublereal *a, 
				 integer *numit, integer *near_convicts__,
				 doublereal *dists_convicts__,
				 integer *k, doublereal *w,
				 integer *lused, integer *ntest, integer *iw);
/* Subroutine */ int get_stats0__(integer *n, integer *m, doublereal *a, 
				  integer *numit, integer *near_convicts__,
				  doublereal *dists_convicts__,
				  integer *k, doublereal *w, integer *lused,
				  integer *ntest, integer *iw, integer *ia,
				  doublereal *dists, doublereal *dists2,
				  integer *iaa, integer *ib);
/* Subroutine */ int get_memory_size__(integer *n, integer *m, integer *k, 
				       integer *numit, integer *nwords);


/* Subroutine */ int peter_heapsort_inte__(integer *ra, integer *ia, integer *n);
/* Subroutine */ int peter_heapit_inte__(integer *ra, integer *ia, integer *n,
					 integer *ii);
/* Subroutine */ int peter_heapsort_rea__(doublereal *ra, integer *ia, 
					  integer *n);
/* Subroutine */ int peter_heapit_rea__(doublereal *ra, integer *ia,
					integer *n, integer *ii);
/* Subroutine */ int peter_heapsort_rea_part__(doublereal *ra, integer *ia, 
					       integer *n, integer *k);
/* Subroutine */ int peter_heapit_rea_decr__(doublereal *ra, integer *ia, 
					     integer *n, integer *ii);



/* THE RANN CODE PROPER */


void rann_all(int n, int m, double* pts,
	      int numit, int isuper, int istat,
	      int* near_convicts, double* dists_convicts,
	      int k, double* w, int lenw) {
  tree_test__(&n,&m,pts,&numit,&isuper,&istat,
	      near_convicts,dists_convicts,&k,w,&lenw);
  return;
}

void get_rann_memory(int n, int m, int k, int numit, int* lenw) {
  get_memory_size__(&n,&m,&k,&numit,lenw);
  return;
}



/*       Vladimir Rokhlin, Andrei Osipov (Yale University) */


/* Subroutine */ int tree_test__(integer *n, integer *m, doublereal *a, 
	integer *numit, integer *isuper, integer *istat, integer *
	near_convicts__, doublereal *dists_convicts__, integer *k, doublereal 
	*w, integer *lenw)
{
    /* System generated locals */
    integer a_dim1, a_offset, near_convicts_dim1, near_convicts_offset, 
	    dists_convicts_dim1, dists_convicts_offset, i__1;

    /* Local variables */
    extern /* Subroutine */ int all_iter__(integer *, integer *, integer *, 
	    doublereal *, integer *, integer *, integer *, integer *, 
	    doublereal *, doublereal *, integer *, integer *, integer *), 
	    cpu_time__(doublereal *), corrand4_restart__(void);
    static integer i__;
    static doublereal t1, t2, t3, w2[10000000];
    extern /* Subroutine */ int get_stats__(integer *, integer *, doublereal *
	    , integer *, integer *, doublereal *, integer *, doublereal *, 
	    integer *, integer *, integer *);
    static integer jjj, ier, keep;
    extern /* Subroutine */ int prin2_(char *, doublereal *, integer *);
    static integer lused;
    extern /* Subroutine */ int prinf_(char *, integer *, integer *);
    static integer ntest, iwrite;


/*       For each of the n input points in R^m, select k */
/*       "approximately nearest" points in array a */


/*        call print_on_off(1) */

/*       ANDREI IMPORTANT: OTHERWISE HARD TO COMPARE!!! */
/*       in the real version, one can delete this line */

    /* Parameter adjustments */
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    dists_convicts_dim1 = *k;
    dists_convicts_offset = 1 + dists_convicts_dim1;
    dists_convicts__ -= dists_convicts_offset;
    near_convicts_dim1 = *k;
    near_convicts_offset = 1 + near_convicts_dim1;
    near_convicts__ -= near_convicts_offset;
    --w;

    /* Function Body */
    corrand4_restart__();
    prinf_("n = *", n, &c__1);
    prinf_("m = *", m, &c__1);
    prin2_("a = *", &a[a_offset], &c__12);
    prinf_("first 10 points = *", &i__, &c__0);
    for (i__ = 1; i__ <= 10; ++i__) {
	prin2_("*", &a[i__ * a_dim1 + 1], m);
/* L3104: */
    }

/*       ANDREI: replace with cpu_time */
/*        t1=clotatim() */
    cpu_time__(&t1);
/*        call prin2("t1 = *", t1, 1) */

    all_iter__(&ier, n, m, &a[a_offset], k, numit, isuper, &near_convicts__[
	    near_convicts_offset], &dists_convicts__[dists_convicts_offset], &
	    w[1], lenw, &lused, &keep);

/*       ANDREI: replace with cpu_time */
/*        t2=clotatim() */
    cpu_time__(&t2);
    prin2_("after all_iter, w=*", &w[1], &c__3);
    i__1 = lused / 1000;
    prinf_("and lused/1000=*", &i__1, &c__1);
    i__1 = keep / 1000;
    prinf_("and keep/1000=*", &i__1, &c__1);
/* ccc        stop */

/*       . . . print the report */

    if (*istat == 0) {
	goto L3111;
    }
    iwrite = 13;
    get_stats__(n, m, &a[a_offset], numit, &near_convicts__[
	    near_convicts_offset], &dists_convicts__[dists_convicts_offset], 
	    k, w2, &lused, &ntest, &iwrite);
L3111:
    cpu_time__(&t3);
    w[20] = w2[0];
    w[21] = w2[1];
    w[22] = w2[2];
    w[23] = t2 - t1;
    w[24] = t3 - t2;
/*        w(4) = t2-t1 */
    for (jjj = 30; jjj <= 50; ++jjj) {
	w[jjj] = 0.;
/* L222: */
    }
/* L3400: */

/* L5200: */


/*       ANDREI: DISABLE WRITE */
/*         write(6,5200) t2-t1 */
/*         write(iwrite,5200) t2-t1 */
/*        call prinf("near_convicts = *", near_convicts, n*k) */
/*        call prin2("dists_convicts = *", dists_convicts, n*k) */
    prin2_("avg true dist = *", w2, &c__1);
    prin2_("avg susp dist = *", &w2[1], &c__1);
    prin2_("avg proportion = *", &w2[2], &c__1);
    return 0;
} /* tree_test__ */



/* ANDREI: query */
/*       THIS SUBROUTINE IS LIMITED TO n <= 10^5 */
/*       use get_stats_many instead */

/* Subroutine */ int get_stats_lookup__(doublereal *rat_ave__, integer *ntest,
	 doublereal *dnum_belongs_ave__, doublereal *smalls, doublereal *
	rat0s, integer *n, integer *m, integer *k, doublereal *a, integer *
	inds_many__, doublereal *dists_many__, doublereal *cpu)
{
    /* System generated locals */
    integer a_dim1, a_offset, dists_many_dim1, dists_many_offset, 
	    inds_many_dim1, inds_many_offset, i__1;
    doublereal d__1;

    /* Local variables */
    static doublereal sum_appr__, sum_true__, prop_belongs_ave__, sum_appr2__;
    extern /* Subroutine */ int get_stats_onepnt__(doublereal *, doublereal *,
	     integer *, integer *, integer *, doublereal *, integer *, 
	    doublereal *, doublereal *, integer *, integer *, doublereal *, 
	    doublereal *, doublereal *, doublereal *, doublereal *, 
	    doublereal *, integer *, doublereal *, integer *, integer *);
    static doublereal sum_true2__;
    static integer ia[100000], ib[10000], ic, num_belong__, iaa[10000];
    static doublereal dds[100000];
    static integer jkj;
    static doublereal rat, dds2[10000], prop_belong__, rat0, done, 
	    sum_appr_all__, sum_true_all__;
    extern /* Subroutine */ int prin2_(char *, doublereal *, integer *);
    static doublereal sum_appr_all2__, sum_true_all2__;
    extern /* Subroutine */ int prinf_(char *, integer *, integer *);
    static integer nsmall, iwrite, nwrong;


    /* Parameter adjustments */
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    dists_many_dim1 = *k;
    dists_many_offset = 1 + dists_many_dim1;
    dists_many__ -= dists_many_offset;
    inds_many_dim1 = *k;
    inds_many_offset = 1 + inds_many_dim1;
    inds_many__ -= inds_many_offset;

    /* Function Body */
    ic = 0;

    nwrong = 0;
    sum_true_all__ = 0.;
    sum_appr_all__ = 0.;
/*       ANDREI */
    sum_true_all2__ = 0.;
    sum_appr_all2__ = 0.;
    *smalls = 0.;
    *rat0s = 0.;
    i__1 = *ntest;
    for (jkj = 1; jkj <= i__1; ++jkj) {

	++ic;
	if (ic == 100) {
	    prinf_("in get_stats_lookup, jkj=*", &jkj, &c__1);
	    ic = 0;
	}

	get_stats_onepnt__(&a[jkj * a_dim1 + 1], &a[a_offset], m, n, &
		inds_many__[jkj * inds_many_dim1 + 1], &dists_many__[jkj * 
		dists_many_dim1 + 1], k, &rat, &prop_belong__, &num_belong__, 
		&nsmall, &sum_true__, &sum_appr__, &rat0, &sum_true2__, &
		sum_appr2__, dds, ia, dds2, iaa, ib);

	sum_true_all__ += sum_true__;
	sum_appr_all__ += sum_appr__;
	sum_true_all2__ += sum_true2__;
	sum_appr_all2__ += sum_appr2__;
	*rat0s += rat0;
/* ccc        call prinf('and nsmall=*',nsmall,1) */
	if (nsmall > 1) {
	    ++nwrong;
	}
	*smalls = *smalls + nsmall - 1;
/* ccc        call prin2('and prop_belong=*',prop_belong,1) */
/* ccc        call prinf('and num_belong=*',num_belong,1) */
/* ccc        call prin2('and rat=*',rat,1) */
/* ccc        rats(jkj)=rat */
/* ccc        num_belongs(jkj)=num_belong */
/* ccc        prop_belongs(jkj)=prop_belong-1 */
	*rat_ave__ += rat;
	prop_belongs_ave__ += prop_belong__;
	*dnum_belongs_ave__ += num_belong__;
/* L1800: */
    }
    *rat_ave__ /= *ntest;
    prin2_("and rat_ave=*", rat_ave__, &c__1);
    d__1 = *rat_ave__ - 1;
    prin2_("and rat_ave-1=*", &d__1, &c__1);
    *dnum_belongs_ave__ /= *ntest;
    prin2_("and dnum_belongs_ave=*", dnum_belongs_ave__, &c__1);
    prin2_("smalls=*", smalls, &c__1);
    *rat0s /= *ntest;

    iwrite = 13;
/* L3400: */

/* L5200: */

/* L6200: */
/*       ANDREI: DISABLE WRITE */
/*         write(6,6200) */
/*         write(iwrite,6200) */
/*         write(6,3400) */
/*         write(iwrite,3400) */
/*         write(6,3400) */
/*         write(iwrite,3400) */
/* L6250: */

/*        write(6,6250) smalls/n/ntest */
/*        write(iwrite,6250) smalls/n/ntest */
/*         write(6,3400) */
/*         write(iwrite,3400) */

/* L6300: */

/*         write(6,6300) sum_appr_all/sum_true_all */
/*         write(iwrite,6300) sum_appr_all/sum_true_all */
/* L6311: */
/*         write(6,6311) sum_appr_all/ntest */
/*         write(iwrite,6311) sum_appr_all/ntest */

/* L6400: */

/*         write(6,6400) sum_appr_all/sum_true_all-1 */
/*         write(iwrite,6400) sum_appr_all/sum_true_all-1 */

/*         write(6,3400) */
/*         write(iwrite,3400) */
/* L6500: */

/*         write(6,6500) rat0s */
/*         write(iwrite,6500) rat0s */

/* L6550: */

/*         write(6,6550) rat0s-1 */
/*         write(iwrite,6550) rat0s-1 */
/*         write(6,3400) */
/*         write(iwrite,3400) */
/* L6600: */

/*         write(6,6600) nwrong */
/*         write(iwrite,6600) nwrong */

/* L6800: */

    done = 1.;
/*         write(6,6800) nwrong*done/ntest */
/*         write(iwrite,6800) nwrong*done/ntest */

/*         write(6,3400) */
/*         write(iwrite,3400) */


/* L7000: */

/*         write(6,7000) dnum_belongs_ave */
/*         write(iwrite,7000) dnum_belongs_ave */

/*         write(6,3400) */
/*         write(iwrite,3400) */

/*         write(6,5200) cpu */
/*         write(iwrite,5200) cpu */

    prin2_("SQ rat_ave = AVG(ratio) =*", rat_ave__, &c__1);
    d__1 = sum_appr_all2__ / sum_true_all2__;
    prin2_("SQ ratio(AVG) =*", &d__1, &c__1);
    d__1 = sum_true_all2__ / (*ntest * *k);
    prin2_("avg(true_k) = *", &d__1, &c__1);
    d__1 = sum_appr_all2__ / (*ntest * *k);
    prin2_("avg(appr_k) = *", &d__1, &c__1);
    return 0;
} /* get_stats_lookup__ */


/* ANDREI: query */

/* Subroutine */ int get_stats_many_get_size__(integer *n, integer *k, 
	integer *lwrk)
{
    static integer iia, iib, lia, lib, iiaa, liaa, idds, ldds, idds2, ldds2, 
	    ltotwrk;

    idds = 1;
    ldds = *n + 10;
    idds2 = idds + ldds;
    ldds2 = (*k << 1) + 10;
    iib = idds2 + ldds2;
    lib = (*k << 1) + 10;
    iiaa = iib + lib;
    liaa = (*k << 1) + 10;
    iia = iiaa + liaa;
    lia = *n + 10;
    ltotwrk = iia + lia;
    *lwrk = ltotwrk + 2;
    return 0;
} /* get_stats_many_get_size__ */


/* ANDREI: query */

/* Subroutine */ int get_stats_many__(doublereal *x, doublereal *a, integer *
	m, integer *n, integer *ntest, integer *inds, doublereal *dists, 
	integer *k, doublereal *rat, doublereal *prop, doublereal *
	dist_true__, doublereal *dist_susp__, doublereal *wrk, integer *lwrk)
{
    /* System generated locals */
    integer inds_dim1, inds_offset, x_dim1, x_offset, a_dim1, a_offset, 
	    dists_dim1, dists_offset, i__1;

    /* Local variables */
    static integer i__;
    extern /* Subroutine */ int get_stats_onepnt__();
    static doublereal xsum_appr__, xsum_true__, xsum_appr2__, xsum_true2__;
    static integer num_belong__, iia, iib, lia, lib, ijk, iiaa, liaa, idds, 
	    ldds;
    static doublereal xrat;
    static integer idds2, ldds2;
    extern /* Subroutine */ int prin2_(char *, doublereal *, integer *);
    static doublereal xprop_belong__, xrat0;
    extern /* Subroutine */ int prinf_(char *, integer *, integer *);
    static integer nsmall, ltotwrk;

    /* Parameter adjustments */
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    x_dim1 = *m;
    x_offset = 1 + x_dim1;
    x -= x_offset;
    dists_dim1 = *k;
    dists_offset = 1 + dists_dim1;
    dists -= dists_offset;
    inds_dim1 = *k;
    inds_offset = 1 + inds_dim1;
    inds -= inds_offset;
    --wrk;

    /* Function Body */
    idds = 1;
    ldds = *n + 10;
    idds2 = idds + ldds;
    ldds2 = (*k << 1) + 10;
    iib = idds2 + ldds2;
    lib = (*k << 1) + 10;
    iiaa = iib + lib;
    liaa = (*k << 1) + 10;
    iia = iiaa + liaa;
    lia = *n + 10;
    ltotwrk = iia + lia;
    prinf_("idds = *", &idds, &c__1);
    prinf_("idds2 = *", &idds2, &c__1);
    prinf_("iib = *", &iib, &c__1);
    prinf_("iiaa = *", &iiaa, &c__1);
    prinf_("iia = *", &iia, &c__1);
    prinf_("lwrk = *", lwrk, &c__1);
    prinf_("ltotwrk = *", &ltotwrk, &c__1);
    *dist_true__ = 0.;
    *dist_susp__ = 0.;
    *prop = 0.;
    *rat = 0.;
    if (ltotwrk > *lwrk) {
	prinf_("in get_stats_many, too small lwrk = *", lwrk, &c__1);
	prinf_("need at least ltotwrk = *", &ltotwrk, &c__1);
	prin2_("cannot complete operation, prop = *", prop, &c__1);
		;
	return 0;
    }
    ijk = 0;
    i__1 = *ntest;

    for (i__ = 1; i__ <= i__1; ++i__) {
	get_stats_onepnt__(&x[i__ * x_dim1 + 1], &a[a_offset], m, n,
			   &inds[i__ * inds_dim1 + 1],
			   &dists[i__ * dists_dim1 + 1], k, &xrat, 
			   &xprop_belong__, &num_belong__, &nsmall, &xsum_true__,
			   &xsum_appr__, &xrat0, &xsum_true2__,
			   &xsum_appr2__, &wrk[idds],
			   (integer*)(&wrk[iia]),
			   &wrk[idds2],
			   (integer*)(&wrk[iiaa]), (integer*)(&wrk[iib]));
/*     4                           dds,ia,dds2,iaa,ib) */
	*dist_true__ += xsum_true2__;
	*dist_susp__ += xsum_appr2__;
	*prop += xprop_belong__;
	++ijk;
	if (ijk == 100) {
	    ijk = 0;
	    prinf_("in get_stats_many, i = *", &i__, &c__1);
	}
/* L200: */
    }
    *dist_true__ /= *ntest;
    *dist_susp__ /= *ntest;
    *prop /= *ntest;
    *rat = *dist_susp__ / *dist_true__;
    return 0;
} /* get_stats_many__ */



/*       sum_true2 = average square distance to true nn */
/*       sum_appr2 = average square distance to suspects */
/*       rat       = ratio between the two */
/*       prop_belong = proportion of true nn among suspects */


/* Subroutine */ int get_stats_onepnt__(doublereal *x, doublereal *a, integer 
	*m, integer *n, integer *inds, doublereal *dists, integer *k, 
	doublereal *rat, doublereal *prop_belong__, integer *num_belong__, 
	integer *nsmall, doublereal *sum_true__, doublereal *sum_appr__, 
	doublereal *rat0, doublereal *sum_true2__, doublereal *sum_appr2__, 
	doublereal *dds, integer *ia, doublereal *dds2, integer *iaa, integer 
	*ib)
{
    /* System generated locals */
    integer a_dim1, a_offset, i__1;

    /* Builtin functions */
    double sqrt(doublereal);

    /* Local variables */
    extern /* Subroutine */ int peter_heapsort_rea_part__(doublereal *, 
	    integer *, integer *, integer *);
    static doublereal d__;
    static integer i__, j;
    static doublereal d1, d2, done;
    extern /* Subroutine */ int peter_heapsort_inte__(integer *, integer *, 
	    integer *), dist_compute__(doublereal *, doublereal *, integer *, 
	    doublereal *);
    static integer nleft;


/*        analyze the results and print a summary for the single */
/*        point x */


/*        . . . construct the nearest k neighbors via brute force */

/* ccc        call prin2('in _onepnt, dists=*',dists,k) */
    /* Parameter adjustments */
    --x;
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    --inds;
    --dists;
    --dds;
    --ia;
    --dds2;
    --iaa;
    --ib;

    /* Function Body */
    *nsmall = 0;
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	dist_compute__(&x[1], &a[i__ * a_dim1 + 1], m, &d__);

	dds[i__] = d__;
	if (d__ < dists[2]) {
	    ++(*nsmall);
	}
/* ccc        call prin2('dists(1)=*',dists(1),k) */
/* ccc        call prin2('and d=*',d,1) */
/* L1600: */
    }
/* ccc        stop */


/*       sort the distances from the point x to all */
/*       points in a, and take the first k elements */

    peter_heapsort_rea_part__(&dds[1], &ia[1], n, k);

    d1 = 0.;
    d2 = 0.;
    *sum_true__ = 0.;
    *sum_appr__ = 0.;
    i__1 = *k;
    for (j = 1; j <= i__1; ++j) {

	dds2[j] = dds[ia[j]];

	d1 += dds2[j];
	d2 += dists[j];

/* ANDREI DIST */
	*sum_true__ += sqrt(dds2[j]);
	*sum_true2__ = *sum_true__ + dds2[j];
/* ANDREI DIST */
	*sum_appr__ += sqrt(dists[j]);
	*sum_appr2__ = *sum_appr__ + dists[j];
/* L1800: */
    }

    *rat0 = dists[2] / dds2[2];
/*       ANDREI */
    *sum_true2__ = d1 / *k;
    *sum_appr2__ = d2 / *k;
/* ANDREI: query */
/*        call prinf("true nn idxs = *", ia, k) */
/*        call prin2("and distances = *", dds2, k) */
/* ccc        call prin2('and dists=*',dists,6) */
/* ccc        call prin2('and dds2=*',dds2,6) */
/* ccc        call prin2('and rat0=*',rat0,1) */

/* ccc        call prin2('and dds2=*',dds2,k) */
/* ccc        call prinf('and ia=*',ia,k) */
    *rat = d2 / d1;
/* ccc        call prin2('and ratio between sums of squares of distances*', */
/* ccc     1      rat,1) */
/* ccc        call prin2('and that same ratio -1*',rat-1,1) */

/*       count the number of discrepancies between the "brute force" */
/*       and approximate nearest k neighbors for this point */

    i__1 = *k;
    for (j = 1; j <= i__1; ++j) {

	dds[j] = dds2[j];
	dds[j + *k] = dists[j];
	ia[*k + j] = inds[j];
/* L2000: */
    }

/*       . . . sort them things */

    i__1 = *k << 1;
    peter_heapsort_inte__(&ia[1], &iaa[1], &i__1);

    i__1 = *k << 1;
    for (j = 1; j <= i__1; ++j) {

	ib[j] = ia[iaa[j]];
/* L2200: */
    }

/*       squeeze out the doubles */

    nleft = 1;
    i__1 = *k << 1;
    for (j = 2; j <= i__1; ++j) {
	if (ib[j - 1] != ib[j]) {
	    ++nleft;
	}
/* L2400: */
    }

    done = 1.;
    *num_belong__ = (*k << 1) - nleft;
    *prop_belong__ = *num_belong__ * done / *k;
/* ccc        call prinf('and nleft=*',nleft,1) */
/* ccc        call prin2('and prop_belong=*',prop_belong,1) */
/* ccc        call prinf('and num_belong=*',num_belong,1) */


    return 0;
} /* get_stats_onepnt__ */


/*       COPIED FROM onepoint_all */

/* Subroutine */ int onepoint_all_get_size__(integer *n, integer *k, integer *
	numit, integer *levmax, integer *lenw2)
{
    static integer isuspects, lsuspects, idds, ldds, ijjs, ljjs, iinds2, 
	    linds2, idists2, ldists2;

    iinds2 = 1;
    linds2 = *numit * *k + 10;

    if (linds2 < *k * (*k + 1) + 10) {
	linds2 = *k * (*k + 1) + 10;
    }

    idists2 = iinds2 + linds2;
    ldists2 = linds2;

    ijjs = idists2 + ldists2;
    ljjs = (*levmax + 1) * *k + 10;
    ljjs = *n + 10;
    ljjs <<= 1;

    isuspects = ijjs + ljjs;
    lsuspects = (*levmax + 1) * *k + 10;
    lsuspects = *n + 10;
    lsuspects <<= 1;

    idds = isuspects + lsuspects;
    ldds = (*levmax + 1) * *k + 10;
    ldds = *n + 10;
    ldds <<= 1;
    *lenw2 = idds + ldds + 100;
    return 0;
} /* onepoint_all_get_size__ */






/* Subroutine */ int onepoint_all__(doublereal *x, doublereal *w, doublereal *
	a, integer *isuper, integer *near_convicts__, doublereal *
	dists_convicts__, integer *inds, doublereal *dists, doublereal *w2, 
	integer *lenw2)
{
    /* Builtin functions */

    /* Local variables */
    static integer k, m, n, isuspects, lsuspects, iv;
    extern /* Subroutine */
      int all_sets_suspects__(doublereal *x, doublereal *v, 
			      integer *indsv, doublereal *a,
			      integer *numit, integer *k,
			      integer *inds, doublereal *dists,
			      integer *inds2, doublereal *dists2,
			      integer *jjs, integer *suspects,
			      doublereal *dds);
    static integer idds, ldds, ijjs, ljjs;
    extern /* Subroutine */ int prinf_(char *, integer *, integer *);
    static integer numit, iinds2, linds2, iindsv, levmax, idists2, ldists2;
    extern /* Subroutine */
      int onepoint_super__(doublereal *x, integer *inds, 
			   doublereal *dists,
			   integer *n, integer *m,
			   doublereal *a, integer *k, 
			   integer *near_convicts__,
			   doublereal *dists_convicts__,
			   integer *inds2, doublereal *dists2,
			   integer *jjs);


/*        given a structure built by a preceding call to the */
/*        subroutine all_iter (see) and a user-supplied point */
/*        x in R^m, it finds the k points (approximately) */
/*        nearest to x. */


/*                        Input parameters: */

/*  x - the user-specified point for which the nearest neighbors */
/*        are to be found */
/*  w - the array of data (hopefully) produced by a preceding call */
/*        to the subroutine all_iter (see) */
/*  near_convicts - integer array dimensioned (k,n) produced via a */
/*        preceding call to the subroutine all_iter */
/*     Explanation: the element near_convicts(j,i) contains the */
/*        sequence number in array a of the j-th neighbor of */
/*        the i-th point in a; */
/*  dists_convicts - real array dimensioned (k,n) produced via a */
/*        preceding call to the subroutine all_iter: it contains */
/*        squares of distances corresponding to the points specified */
/*        in array near_convicts */
/*     Explanation: the element dists_convicts(j,i) contains the */
/*        square of the distance between the point a(j) and */
/*        the element whose number is in near_convicts */

/*                        Output parameters: */

/*  inds - integer array containing the sequence numbers in array */
/*        a of the (allegedly) nearest points in a to the user-supplied */
/*        point xx */
/*  dists - dists(j) is the square of the distance of the point */
/*        a(inds(j)) to the user-supplied point x */

/*                        Work array: */

/*  w2 - need not be very long ?????????????????????????????????????????? */

/*       conduct the numit iterations */

    /* Parameter adjustments */
    --w2;
    --dists;
    --inds;
    --dists_convicts__;
    --near_convicts__;
    --a;
    --w;
    --x;

    /* Function Body */
    numit = (integer) w[1];
    iv = (integer) w[2];
    iindsv = (integer) w[3];

    k = (integer) w[4];
    m = (integer) w[5];
    levmax = (integer) w[6];
    n = (integer) w[7];

    iinds2 = 1;
    linds2 = numit * k + 10;

    if (linds2 < k * (k + 1) + 10) {
	linds2 = k * (k + 1) + 10;
    }

    idists2 = iinds2 + linds2;
    ldists2 = linds2;

    ijjs = idists2 + ldists2;
    ljjs = (levmax + 1) * k + 10;
    ljjs = n + 10;
    ljjs <<= 1;

    isuspects = ijjs + ljjs;
    lsuspects = (levmax + 1) * k + 10;
    lsuspects = n + 10;
    lsuspects <<= 1;

    idds = isuspects + lsuspects;
    ldds = (levmax + 1) * k + 10;
    ldds = n + 10;
    ldds <<= 1;
/*        call prinf("idds+ldds = *", idds+ldds, 1) */
    if (idds + ldds > *lenw2) {
	prinf_("onepoint: BAD!, lenw2 = *", lenw2, &c__1);
	exit(1);
    }

    
    all_sets_suspects__(&x[1], &w[iv],
			(integer*)&w[iindsv], &a[1],
			&numit, &k, &inds[1],
			&dists[1], (integer*)&w2[iinds2],
			&w2[idists2], (integer*)&w2[ijjs],
			(integer*)&w2[isuspects],
			&w2[idds]);
/* ANDREI: query */
    if (*isuper == 0) {
	goto L999;
    }

/*       conduct the supercharging for a single point */

/*        call prinf("before op_super, inds = *", inds, 6) */
      onepoint_super__(&x[1], &inds[1],
		       &dists[1],
		       &n, &m,
		       &a[1], &k, &near_convicts__[1],
		       &dists_convicts__[1],
		       (integer*)(&w2[iinds2]),
		       &w2[idists2], (integer*)&w2[ijjs]);
/*        call prinf("after op_super, inds = *", inds, 6) */

L999:
    return 0;
} /* onepoint_all__ */






/* Subroutine */ int onepoint_super__(doublereal *x, integer *inds, 
	doublereal *dists, integer *n, integer *m, doublereal *a, integer *k, 
	integer *near_convicts__, doublereal *dists_convicts__, integer *
	inds2, doublereal *dists2, integer *jjs)
{
    /* System generated locals */
    integer a_dim1, a_offset, near_convicts_dim1, near_convicts_offset, 
	    dists_convicts_dim1, dists_convicts_offset, i__1, i__2;

    /* Local variables */
    static integer i__, j, k22, ii, ik;
    extern /* Subroutine */ int peter_heapsort_rea__(doublereal *, integer *, 
	    integer *);
    static integer iii, jjj;
    extern /* Subroutine */ int dist_compute__(doublereal *, doublereal *, 
	    integer *, doublereal *);


/*       scan the lists of neighbors of all neighbors of x, */
/*       constructing one big happy neighbor list */

    /* Parameter adjustments */
    --x;
    --inds;
    --dists;
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    dists_convicts_dim1 = *k;
    dists_convicts_offset = 1 + dists_convicts_dim1;
    dists_convicts__ -= dists_convicts_offset;
    near_convicts_dim1 = *k;
    near_convicts_offset = 1 + near_convicts_dim1;
    near_convicts__ -= near_convicts_offset;
    --inds2;
    --dists2;
    --jjs;

    /* Function Body */
    i__1 = *k;
    for (i__ = 1; i__ <= i__1; ++i__) {

	inds2[i__] = inds[i__];
/* L1200: */
    }

    ii = *k;
    i__1 = *k;
    for (i__ = 1; i__ <= i__1; ++i__) {
	ik = inds[i__];
	i__2 = *k;
	for (j = 1; j <= i__2; ++j) {

	    ++ii;
	    inds2[ii] = near_convicts__[j + ik * near_convicts_dim1];
/* L1600: */
	}
/* L2000: */
    }
/*        call prinf("in one_super, ii = *", ii, 1) */

/*       evaluate the distances for all suspects */

    i__1 = ii;
    for (i__ = 1; i__ <= i__1; ++i__) {

	dist_compute__(&x[1], &a[inds2[i__] * a_dim1 + 1], m, &dists2[i__]);

/* L2200: */
    }

    k22 = ii;
/*        call prin2("before phru, dists2 = *", dists2, k22) */
/*        call prinf("and inds2 = *", inds2, k22) */
/*        call peter_heapsort_rea_up(dists2,inds2,k22,k,kk) */
/*        call prin2("after phru, dists2 = *", dists2, k22) */
/*        call prinf("and inds2 = *", inds2, k22) */
/*        call prinf("and kk = *", kk, 1) */
/* NOREP: do full sort */
    peter_heapsort_rea__(&dists2[1], &jjs[1], &k22);
/* NOREP: non-repeating */
    jjj = 1;
    inds[jjj] = inds2[jjs[jjj]];
    dists[jjj] = dists2[jjs[jjj]];
    i__1 = ii;
    for (j = 2; j <= i__1; ++j) {
	i__2 = jjj;
	for (iii = 1; iii <= i__2; ++iii) {
	    if (inds[iii] == inds2[jjs[j]]) {
		goto L2300;
	    }
/* L2350: */
	}
	++jjj;
	inds[jjj] = inds2[jjs[j]];
	dists[jjj] = dists2[jjs[j]];
	if (jjj == *k) {
	    goto L2375;
	}
L2300:
	;
    }
L2375:

/*       extract from arrays iarr, rarr the non-repeating */
/*       elements */

/*        jjj=1 */
/*        inds(1)=inds2(k22) */
/*        dists(1)=dists2(k22) */
/* c */
/*        do 2400 j=k22-1,1,-1 */
/* c */
/*        if(inds2(j) .eq. inds2(j+1)) goto 2400 */
/* c */
/*        jjj=jjj+1 */
/* c        call prinf("jjj = *", jjj, 1) */
/*        inds(jjj)=inds2(j) */
/*        dists(jjj)=dists2(j) */
/* c */
/*        if(jjj .eq. k) goto 2500 */
/* 2400 continue */
/* L2500: */

    return 0;
} /* onepoint_super__ */






/* Subroutine */ int all_sets_suspects__(doublereal *x, doublereal *v, 
	integer *indsv, doublereal *a, integer *numit, integer *k, integer *
	inds, doublereal *dists, integer *inds2, doublereal *dists2, integer *
	jjs, integer *suspects, doublereal *dds)
{
    /* System generated locals */
    integer i__1, i__2;

    /* Local variables */
    static integer i__, j;
    extern /* Subroutine */ int one_set_suspects__(doublereal *, doublereal *,
	     doublereal *, integer *, doublereal *, integer *, integer *, 
	    doublereal *);
    static integer j0, i2, i3, ii, jj;
    extern /* Subroutine */ int peter_heapsort_rea__(doublereal *, integer *, 
	    integer *);
    static integer nmk;


/*       conduct the numit iterations one after another */

    /* Parameter adjustments */
    --dds;
    --suspects;
    --jjs;
    --dists2;
    --inds2;
    --dists;
    --inds;
    --a;
    --indsv;
    --v;
    --x;

    /* Function Body */
    ii = indsv[1];
    one_set_suspects__(&x[1], &v[ii], &a[1], &inds2[1], &dists2[1], &jjs[1],
		       &suspects[1], &dds[1]);

    i__1 = *numit;
    for (i__ = 2; i__ <= i__1; ++i__) {

/*       conduct the iteration */

	ii = indsv[i__];
	one_set_suspects__(&x[1], &v[ii], &a[1], &inds[1], &dists[1], &jjs[1],
		 &suspects[1], &dds[1]);

/*       merge the arrays inds, dists with the arrays inds2,dists2 */

	j0 = (i__ - 1) * *k;
	i__2 = *k;
	for (j = 1; j <= i__2; ++j) {

	    inds2[j0 + j] = inds[j];
	    dists2[j0 + j] = dists[j];
/* L1400: */
	}
/* ANDREI: query */
/*        call prinf("inds2 = *", inds2, j0+k) */
/*        stop */

/* L1600: */
    }

/*       compress them things */


/*       . . . sort */

    nmk = *numit * *k;

/*        call peter_heapsort_rea_up(dists2,inds2,nmk,k+2,kk) */

/* NOREP: full sort instead */
    peter_heapsort_rea__(&dists2[1], &jjs[1], &nmk);

/*       extract from arrays iarr, rarr the non-repeating */
/*       elements */

/* NOREP */
    i2 = 1;
    i3 = 1;
    inds[1] = inds2[jjs[1]];
    dists[1] = dists2[jjs[1]];
    i__1 = nmk;
    for (j = 2; j <= i__1; ++j) {
	i__2 = i2;
	for (jj = 1; jj <= i__2; ++jj) {
	    if (inds[jj] == inds2[jjs[j]]) {
		goto L2200;
	    }
/* L2210: */
	}
	++i2;
	inds[i2] = inds2[jjs[j]];
	dists[i2] = dists2[jjs[j]];
	if (i2 == *k) {
	    goto L2400;
	}
L2200:
	;
    }
L2400:

/*        jjj=1 */
/*        inds(1)=inds2(nmk) */
/*        dists(1)=dists2(nmk) */
/* c */
/*        do 2200 j=nmk-1,1,-1 */
/* c */
/*        if(inds2(j) .eq. inds2(j+1)) goto 2200 */
/* c */
/*        jjj=jjj+1 */
/*        inds(jjj)=inds2(j) */
/*        dists(jjj)=dists2(j) */
/* c */
/*        if(jjj .eq. k) goto 2400 */
/* 2200 continue */
/* 2400 continue */

/* ccc        call prinf('and final inds=*',inds,k) */
/* ccc        call prin2('and final dists=*',dists,k) */

    return 0;
} /* all_sets_suspects__ */






/* Subroutine */ int one_set_suspects__(doublereal *x, doublereal *v, 
	doublereal *a, integer *inds, doublereal *dists, integer *jjs, 
	integer *suspects, doublereal *dds)
{
    static integer icenters, k, m, n;
    extern /* Subroutine */
      int index_aid__(integer *ipts, integer *inds, integer *k);
    static integer iw_transf__;
    extern /* Subroutine */ int retr_arrs__(integer *, integer *, integer *, 
					    integer *, integer *, integer *,
					    integer *, integer *, integer *, 
					    integer *, integer *, integer *,
					    doublereal *);
    extern /* Subroutine */
      int one_set_suspects0__(doublereal *x, integer *n, integer *m,
			      doublereal *a, integer *k,
			      integer *levels, integer *levmax, 
			      integer *boxes, doublereal *centers,
			      doublereal *w_transf__,
			      integer *ipts, doublereal *ds,
			      integer *inds, doublereal *dists,
			      integer *jjs, integer *suspects,
			      doublereal *dds);
    static integer ids, keepw, nbout, iipts, iboxes, levmax, ilevels;


/*       retrieve discrete information from array v */

    /* Parameter adjustments */
    --dds;
    --suspects;
    --jjs;
    --dists;
    --inds;
    --a;
    --v;
    --x;

    /* Function Body */
    retr_arrs__(&n, &m, &k, &ilevels, &levmax, &iboxes, &nbout, &icenters, &
	    iw_transf__, &keepw, &iipts, &ids, &v[1]);

/*       find the suspects for this values of x, v */

      int one_set_suspects0__(doublereal *x, integer *n, integer *m,
			      doublereal *a, integer *k,
			      integer *levels, integer *levmax, 
			      integer *boxes, doublereal *centers,
			      doublereal *w_transf__,
			      integer *ipts, doublereal *ds,
			      integer *inds, doublereal *dists,
			      integer *jjs, integer *suspects,
			      doublereal *dds);
    
    one_set_suspects0__(&x[1], &n, &m,
			&a[1], &k,
			(integer*)(&v[ilevels]), &levmax,
			(integer*)(&v[iboxes]), &v[icenters],
			&v[iw_transf__],
			(integer*)(&v[iipts]), &v[ids],
			&inds[1], &dists[1],
			&jjs[1], &suspects[1], &dds[1]);

    index_aid__((integer*)(&v[iipts]), &inds[1], &k);

    return 0;
} /* one_set_suspects__ */






/* Subroutine */ int one_set_suspects0__(doublereal *x, integer *n, integer *
	m, doublereal *a, integer *k, integer *levels, integer *levmax, 
	integer *boxes, doublereal *centers, doublereal *w_transf__, integer *
	ipts, doublereal *ds, integer *inds, doublereal *dists, integer *jjs, 
	integer *suspects, doublereal *dds)
{
    /* System generated locals */
    integer a_dim1, a_offset, i__1, i__2;

    /* Local variables */
    static doublereal d__;
    static integer i__, j, j1, jj, kk, nj1, jjj, nbs, nnj;
    extern /* Subroutine */
      int inwhich_box__(doublereal *x, integer *m, doublereal *ds, 
			doublereal *centers, integer *levmax,
			doublereal *w, integer *ibox, 
			integer *boxes, doublereal *y, doublereal *y2);
    static integer ibox, jbox;
    extern /* Subroutine */ int dist_compute__(doublereal *, doublereal *, 
	    integer *, doublereal *), one_box_lists__(integer *, integer *, 
	    integer *, integer *), peter_heapsort_rea_up__(doublereal *, 
	    integer *, integer *, integer *, integer *);
    static integer iconts[60];


/*       find the box where the user-supplied point lives */

    /* Parameter adjustments */
    --x;
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    --levels;
    boxes -= 11;
    --centers;
    --ipts;
    --inds;
    --dists;
    --jjs;
    --suspects;
    --dds;

    /* Function Body */
    inwhich_box__(&x[1], m,
		  ds, &centers[1], levmax,
		  w_transf__, &ibox,
		  &boxes[11],
		  (doublereal*)(&suspects[1]), &dds[1]);

/*       find the list of neighbors boxes, and scan the said list, */
/*       finding the nearest neighbors in it */


/*       . . .  extract the list of this box's neighboring boxes */

    one_box_lists__(&ibox, &levels[1], levmax, iconts);

    nbs = *levmax + 1;

/*       . . . construct the list of all points in all nbs */
/*             neighboring boxes */

    nnj = 0;
    i__1 = nbs;
    for (j = 1; j <= i__1; ++j) {

	jbox = iconts[j - 1];
	j1 = boxes[jbox * 10 + 6];
	nj1 = boxes[jbox * 10 + 7];
	i__2 = nj1;
	for (jj = 1; jj <= i__2; ++jj) {

	    ++nnj;
	    suspects[nnj] = j1 + jj - 1;
/* L2200: */
	}
/* L2400: */
    }

/*       scan the array suspects of points in neighboring boxes, */
/*       finding the nearest k points */

    i__1 = nnj;
    for (j = 1; j <= i__1; ++j) {

	jjj = suspects[j];

	jj = ipts[jjj];

	dist_compute__(&x[1], &a[jj * a_dim1 + 1], m, &d__);

	jjs[j] = jjj;
	dds[j] = d__;

/* L2600: */
    }

/*       collect the nearest k suspects */

    i__1 = *k + 2;
    peter_heapsort_rea_up__(&dds[1], &jjs[1], &nnj, &i__1, &kk);

    i__1 = *k;
    for (i__ = 1; i__ <= i__1; ++i__) {
	inds[i__] = jjs[nnj - i__ + 1];
	dists[i__] = dds[nnj - i__ + 1];
/* L2800: */
    }

    return 0;
} /* one_set_suspects0__ */






/* Subroutine */ int inwhich_box__(doublereal *x, integer *m, doublereal *ds, 
	doublereal *centers, integer *levmax, doublereal *w, integer *ibox, 
	integer *boxes, doublereal *y, doublereal *y2)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__;
    extern /* Subroutine */ int random_transf__(doublereal *, doublereal *, 
	    doublereal *);


/*       apply to the vector x the (once) random transformation */

    /* Parameter adjustments */
    --x;
    --ds;
    --centers;
    boxes -= 11;
    --y;
    --y2;

    /* Function Body */
    i__1 = *m;
    for (i__ = 1; i__ <= i__1; ++i__) {

	y2[i__] = x[i__] - ds[i__];
/* L1200: */
    }

    random_transf__(&y2[1], &y[1], w);

/*       find the box where the point x lives */

    *ibox = 1;

    for (i__ = 1; i__ <= 60; ++i__) {

	if (y[i__] < centers[*ibox]) {
	    *ibox = boxes[*ibox * 10 + 4];
	    goto L1400;
	}

	*ibox = boxes[*ibox * 10 + 5];
L1400:

	if (i__ == *levmax) {
	    return 0;
	}
/* L1600: */
    }

    return 0;
} /* inwhich_box__ */






/* Subroutine */ int index_aid__(integer *ipts, integer *inds, integer *k)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__, j;


    /* Parameter adjustments */
    --inds;
    --ipts;

    /* Function Body */
    i__1 = *k;
    for (i__ = 1; i__ <= i__1; ++i__) {

	j = ipts[inds[i__]];
	inds[i__] = j;
/* L1200: */
    }

    return 0;
} /* index_aid__ */






/* Subroutine */ int all_iter__(integer *ier, integer *n, integer *m, 
	doublereal *a, integer *k, integer *numit, integer *isuper, integer *
	near_convicts__, doublereal *dists_convicts__, doublereal *w, integer 
	*lenw, integer *lused, integer *keep)
{
    /* System generated locals */
    integer a_dim1, a_offset, near_convicts_dim1, near_convicts_offset, 
	    dists_convicts_dim1, dists_convicts_offset, i__1;

    /* Builtin functions */
    double log(doublereal);
    integer pow_ii(integer *, integer *);

    /* Local variables */
    static integer keep_max__, lenstore;
    extern /* Subroutine */
      int all_iter0__(integer *ier, integer *n, integer *m, 
		      doublereal *a, integer *k, integer *numit,
		      integer *nsteps, integer *near_convicts__,
		      integer *near_suspects__,
		      doublereal *dists_near__, 
		      doublereal *dists_convicts__,
		      doublereal *w, integer *lenw2, integer *lused,
		      integer *ipts, integer *ia, integer *ib,
		      doublereal *rs, 
		      doublereal *rs2, integer *ib2, doublereal *v,
		      integer *indsv, integer *keep_max__);
    static doublereal d__;
    static integer keepw_max__, iv, iw, lv, nboxes_max__, iia, iib, lia, lib, 
	    jer, irs, lrs, iib2, lib2, idists_near__, ldists_near__, irs2, 
	    lrs2;
    static doublereal done;
    static integer lenw2, iiarr, liarr;
    extern /* Subroutine */ int prinf_(char *, integer *, integer *);
    static integer irarr, lrarr, iipts, lipts;
    extern /* Subroutine */
      int second_search__(doublereal *a, integer *m, integer *n, 
			  integer *k, integer *near_convicts__,
			  doublereal *dists_convicts__, 
			  integer *iarr, doublereal *rarr,
			  integer *iarr2, integer *ia, 
			  doublereal *rarr2);
    static integer iiarr2, liarr2, lused2, irarr2, lrarr2, levmax, iindsv, 
	    lindsv, nsteps, inear_suspects__, lnear_suspects__;


/*        Given a collection of n points in R^m, this subroutine */
/*        finds for each of the said n points k (approximately) */
/*        nearest neighbors. It uses a randomized search, and */
/*        returns two arrays: the element near_convicts(j,i) contains */
/*        the sequence number in array a of the j-the neighbor of */
/*        the i-th point in a; element dists_convicts(j,i) contains */
/*        the square of the distance between the point a(i) and */
/*        the element whose number in in near_convicts(j,i). */

/* ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc */

/*     IMPORTANT! ATTENZIONE! ACHTUNG! UNLESS YOU UNDERSTAND THE */
/*     OPERATION OF THIS SUBROUTINE WELL, DO NOT DEVIATE FROM THE */
/*     RECOMMENDED VALUES OF THE PARAMETERS k, numit. OTHERWISE, */
/*     SEVERE DEGRADATION OF PERFORMANCE IS PROBABLE. EVERY STEP */
/*     ASIDE WILL BE CONSIDERED AND ACTED UPON AS AN ATTEMPTED ESCAPE! */

/* ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc */

/*                      Input parameters: */

/*  a - the points whose neighbors are to be found */
/*  m - the dimensionality of the space where the n ponts live */
/*  n - the number of said points */
/*  k - the algorithm will keep subdividing the group as long */
/*        as its size is greater than nb_max. */
/*     RECOMMENDED VALUE: 30 */
/*  numit - the number of tests the algorithm will perform. */
/*     RECOMMENDED VALUE: 10-20 */
/*  lenw - the length of the work array w in double precision words */

/*                       Output parameters: */

/*  near_convicts - array dimensioned (k,n). */
/*     Explanation: the element near_convicts(j,i) contains the */
/*        sequence number in array a of the j-th neighbor of */
/*        the i-th point in a; */
/*  dists_convicts - squares of distances corresponding to the */
/*        points specified in array near_convicts */
/*     Explanation: the element dists_convicts(j,i) contains the */
/*        square of the distance between the point a(j) and */
/*        the element whose number is in near_convicts */

/*                       Work array: */

/*  w - must be large */

/*        . . . determine the amount of memory to be stored */

    /* Parameter adjustments */
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    dists_convicts_dim1 = *k;
    dists_convicts_offset = 1 + dists_convicts_dim1;
    dists_convicts__ -= dists_convicts_offset;
    near_convicts_dim1 = *k;
    near_convicts_offset = 1 + near_convicts_dim1;
    near_convicts__ -= near_convicts_offset;
    --w;

    /* Function Body */
    done = 1.;
    d__ = log(*n * done / *k) / log(done * 2);
    levmax = (integer) d__;
    prinf_("levmax=*", &levmax, &c__1);
    if (levmax > *m) {
	levmax = *m;
    }
    nsteps = 6;
    nboxes_max__ = pow_ii(&c__2, &levmax) << 1;
    keepw_max__ = *m * 3 * nsteps + *m * 10;
    prinf_("keepw_max=*", &keepw_max__, &c__1);

    lenstore = nboxes_max__ * 10 + levmax + nboxes_max__ + keepw_max__ + 
	    nboxes_max__ * (levmax + 1) + *n + *m + 1000;
    keep_max__ = lenstore;

/* ANDREI: query */
    lenstore *= *numit;
    prinf_("lenstore = *", &lenstore, &c__1);
/*        stop */

    iindsv = 100;
    lindsv = *numit + 100;

    iv = iindsv + lindsv;
    lv = lenstore + 1;

    *keep = iv + lv;

/*        . . . allocate memory */

    iipts = lenstore + 1101;

/*       ANDREI: MEMORY FIX */
/*       iipts might get less than iv+lv */
/*       (if numit > 900) */
/*       in this case w(iipts) overrides w(iv) !!!! */
/*       solution: make it later */


    iipts = *keep + 1000;
    lipts = *n + 2;

    iib = iipts + lipts;
    lib = (*k << 1) + 2;

    irs = iib + lib;
    lrs = (*k << 1) + 2;

    iib2 = irs + lrs;
    lib2 = (*k << 1) + 2;

    irs2 = iib2 + lib2;
    lrs2 = (*k << 1) + 2;

    iia = irs2 + lrs2;
    lia = (*k << 1) + 2;

    inear_suspects__ = iia + lia;
    lnear_suspects__ = *n * *k + 100;

    idists_near__ = inear_suspects__ + lnear_suspects__;
    ldists_near__ = *n * *k + 100;

    iw = idists_near__ + ldists_near__;
    lenw2 = *lenw - iw - 1;

    i__1 = lenw2 / 1000;
    prinf_("and lenw2/1000=*", &i__1, &c__1);
    i__1 = *lenw / 1000;
    prinf_("while lenw/1000=*", &i__1, &c__1);
/* AAA */
/*        stop */

    if (lenw2 < 2000) {
	*ier = 32;
	prinf_("bombing from all_iter with lenw2=*", &lenw2, &c__1);
	exit(1);
    }
    
    all_iter0__(&jer, n, m,
		&a[a_offset], k, numit,
		&nsteps, &near_convicts__[near_convicts_offset],
		(integer*)(&w[inear_suspects__]),
		&w[idists_near__],
		&dists_convicts__[dists_convicts_offset],
		&w[iw], &lenw2, &lused2, 
		(integer*)(&w[iipts]),
		(integer*)(&w[iia]), (integer*)(&w[iib]),
		&w[irs], &w[irs2], (integer*)(&w[iib2]), &w[iv], 
		(integer*)(&w[iindsv]), &keep_max__);

    w[1] = *numit + .1f;
    w[2] = iv + .1f;
    w[3] = iindsv + .1f;
    w[4] = *k + .1f;
    w[5] = *m + .1f;
    w[6] = levmax + .1f;
    w[7] = *n + .1f;
    *lused = lused2 + iw;

    if (jer != 0) {
	prinf_("bombing; jer from all_iter0 is*", &jer, &c__1);
	exit(1);
    }

/*        . . . now, supercharge */

    iiarr = lenstore + 1101;

/*       ANDREI: MEMORY FIX */
/*       SEE iipts ABOVE */

    iiarr = *keep + 1000;
    liarr = *n + 2;
    if (*k * (*k + 1) > *n) {
	liarr = *k * (*k + 1) + 2;
    }

    irarr = iiarr + liarr;
    lrarr = *n + 2;
    if (*k * (*k + 1) > *n) {
	lrarr = *k * (*k + 1) + 2;
    }

    iiarr2 = irarr + lrarr;
    liarr2 = *n + 2;
    if (*k * (*k + 1) > *n) {
	liarr2 = *k * (*k + 1) + 2;
    }

    iia = iiarr2 + liarr2;
    lia = *n + 2;
    if (*k * (*k + 1) > *n) {
	lia = *k * (*k + 1) + 2;
    }

    irarr2 = iia + lia;
    lrarr2 = *n + 2;
    if (*k * (*k + 1) > *n) {
	lrarr2 = *k * (*k + 1) + 2;
    }
    if (*isuper == 0) {
	goto L1222;
    }

/*       ANDREI: COMMENT THIS SUPERCHAGING */
    
    second_search__(&a[a_offset], m, n, k,
		    &near_convicts__[near_convicts_offset],
		    &dists_convicts__[dists_convicts_offset],
		    (integer*)(&w[iiarr]), &w[irarr],
		    (integer*)(&w[iiarr2]), (integer*)(&w[iia]),
		    &w[irarr2]);

L1222:
    return 0;
} /* all_iter__ */






/* Subroutine */ int all_iter0__(integer *ier, integer *n, integer *m, 
	doublereal *a, integer *k, integer *numit, integer *nsteps, integer *
	near_convicts__, integer *near_suspects__, doublereal *dists_near__, 
	doublereal *dists_convicts__, doublereal *w, integer *lenw2, integer *
	lused, integer *ipts, integer *ia, integer *ib, doublereal *rs, 
	doublereal *rs2, integer *ib2, doublereal *v, integer *indsv, integer 
	*keep_max__)
{
    /* System generated locals */
    integer near_convicts_dim1, near_convicts_offset, a_dim1, a_offset, 
	    near_suspects_dim1, near_suspects_offset, dists_near_dim1, 
	    dists_near_offset, dists_convicts_dim1, dists_convicts_offset, 
	    i__1, i__2, i__3, i__4;

    /* Builtin functions */

    /* Local variables */
    extern /* Subroutine */ int one_iter__(integer *, integer *, integer *, 
	    doublereal *, integer *, integer *, integer *, doublereal *, 
	    integer *, doublereal *, integer *, integer *, doublereal *, 
	    doublereal *, integer *, doublereal *, integer *);
    static integer i__, j, i2, i3, ii, jj, iv, iw, ibb, lbb;
    extern /* Subroutine */ int peter_heapsort_rea__(doublereal *, integer *, 
	    integer *);
    static integer ijk, jer, lenw3, keepv;
    extern /* Subroutine */ int prinf_(char *, integer *, integer *);
    static integer lused3;


    /* Parameter adjustments */
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    dists_convicts_dim1 = *k;
    dists_convicts_offset = 1 + dists_convicts_dim1;
    dists_convicts__ -= dists_convicts_offset;
    dists_near_dim1 = *k;
    dists_near_offset = 1 + dists_near_dim1;
    dists_near__ -= dists_near_offset;
    near_suspects_dim1 = *k;
    near_suspects_offset = 1 + near_suspects_dim1;
    near_suspects__ -= near_suspects_offset;
    near_convicts_dim1 = *k;
    near_convicts_offset = 1 + near_convicts_dim1;
    near_convicts__ -= near_convicts_offset;
    --w;
    --ipts;
    --ia;
    --ib;
    --rs;
    --rs2;
    --ib2;
    --v;
    --indsv;

    /* Function Body */
    indsv[1] = 1;
    i__1 = *numit;
    for (ijk = 1; ijk <= i__1; ++ijk) {

/*       . . . perform the iteration */

	prinf_("ijk=*", &ijk, &c__1);
	ibb = 1;
	lbb = *m * *n + 100;

	*lused = ibb + lbb + 2000;

	if (*lused > *lenw2) {
	    *ier = 16;
	    i__2 = *lused - *lenw2;
	    prinf_("bombing from all_iter0 with lused-lenw2=*", &i__2, &c__1);
	    exit(1);
	}

	iw = ibb + lbb;
	lenw3 = *lenw2 - iw - 1;

	i__2 = lenw3 / 1000;
	prinf_("and lenw3/1000=*", &i__2, &c__1);
	i__2 = ibb / 1000;
	prinf_("while ibb/1000=*", &i__2, &c__1);
	i__2 = lbb / 1000;
	prinf_("and lbb/1000=*", &i__2, &c__1);
/* ccc        stop */
	iv = indsv[ijk];
	one_iter__(&jer, n, m, &a[a_offset], k, nsteps, &near_suspects__[
		near_suspects_offset], &w[ibb], &ipts[1], &w[iw], &lenw3, &
		lused3, &dists_near__[dists_near_offset], &v[iv], &keepv, &rs[
		1], keep_max__);

	indsv[ijk + 1] = indsv[ijk] + keepv + 2;
	i__2 = ijk + 1;
	prinf_("and indsv=*", &indsv[1], &i__2);
/* ccc        stop */

	i__2 = *lused / 1000;
	prinf_("BEFORE lused = *", &i__2, &c__1);
	*lused = iw + lused3;
	i__2 = *lused / 1000;
	prinf_("AFTER lused = *", &i__2, &c__1);

	if (ijk != 1) {
	    goto L1600;
	}

	i__2 = *n;
	for (i__ = 1; i__ <= i__2; ++i__) {

	    ii = ipts[i__];
	    i__3 = *k;
	    for (j = 1; j <= i__3; ++j) {

		near_convicts__[j + ii * near_convicts_dim1] = ipts[
			near_suspects__[j + i__ * near_suspects_dim1]];
		dists_convicts__[j + ii * dists_convicts_dim1] = dists_near__[
			j + i__ * dists_near_dim1];
/* L1200: */
	    }
/* L1400: */
	}
/* ANDREI: PRINT IPTS */
/*        call prinf("IPTS = *", ipts, n) */

	goto L3000;

L1600:

/*       this is not the first iteration; one column after another, */
/*       unscramble the array near_suspects, and merge it with */
/*       the array near_convicts */

	i__2 = *n;
	for (i__ = 1; i__ <= i__2; ++i__) {

	    ii = ipts[i__];
	    i__3 = *k;
	    for (j = 1; j <= i__3; ++j) {

		ib[j] = ipts[near_suspects__[j + i__ * near_suspects_dim1]];
		ib[*k + j] = near_convicts__[j + ii * near_convicts_dim1];
		rs[j] = dists_near__[j + i__ * dists_near_dim1];
		rs[j + *k] = dists_convicts__[j + ii * dists_convicts_dim1];
/* L1800: */
	    }

/*        sort the array rs */

	    i__3 = *k << 1;
	    peter_heapsort_rea__(&rs[1], &ia[1], &i__3);

	    i__3 = *k << 1;
	    for (j = 1; j <= i__3; ++j) {

		rs2[j] = rs[ia[j]];
		ib2[j] = ib[ia[j]];
/* L2000: */
	    }

/*       . . . compress the arrays ib2,rs2, removing duplicates */

/*       NOREP */
	    i2 = 1;
	    i3 = 1;
	    ib[1] = ib2[1];
	    rs[1] = rs2[1];
	    i__3 = *k << 1;
	    for (j = 2; j <= i__3; ++j) {
		i__4 = i2;
		for (jj = 1; jj <= i__4; ++jj) {
		    if (ib[jj] == ib2[j]) {
			goto L2200;
		    }
/* L2210: */
		}
		++i2;
		ib[i2] = ib2[j];
		rs[i2] = rs2[j];
		if (i2 == *k) {
		    goto L2400;
		}
L2200:
		;
	    }
L2400:
/* c        i2=1 */
/* c        i3=1 */
/* c        ib(1)=ib2(1) */
/* c        rs(1)=rs2(1) */
/* cc */
/* c        do 2200 j=1,k*2 */
/* cc */
/* c        i2=i2+1 */
/* c        if(i2 .gt. k*2) goto 2400 */
/* c        if(ib2(i2) .eq. ib2(i2-1) ) goto 2200 */
/* cc */
/* c        i3=i3+1 */
/* c        ib(i3)=ib2(i2) */
/* c        rs(i3)=rs2(i2) */
/* c 2200 continue */
/* cc */
/* c 2400 continue */

	    i__3 = *k;
	    for (j = 1; j <= i__3; ++j) {

		near_convicts__[j + ii * near_convicts_dim1] = ib[j];
		dists_convicts__[j + ii * dists_convicts_dim1] = rs[j];
/* L2500: */
	    }

/* L2600: */
	}
L3000:
	;
    }
    i__1 = *numit + 1;
    prinf_("and indsv=*", &indsv[1], &i__1);
    return 0;
} /* all_iter0__ */






/* Subroutine */ int one_iter__(integer *ier, integer *n, integer *m, 
	doublereal *a, integer *k, integer *nsteps, integer *near_suspects__, 
	doublereal *b, integer *ipts, doublereal *w, integer *lenw3, integer *
	lused, doublereal *dists_near__, doublereal *v, integer *keepv, 
	doublereal *ds, integer *keep_max__)
{
    /* System generated locals */
    integer a_dim1, a_offset, near_suspects_dim1, near_suspects_offset, 
	    b_dim1, b_offset, dists_near_dim1, dists_near_offset, i__1, i__2;

    /* Builtin functions */
    double log(doublereal);
    integer pow_ii(integer *, integer *);

    /* Local variables */
    static integer icenters, lcenters, iinboxes, linboxes;
    extern /* Subroutine */
      int one_iter0__(integer *n, integer *m, doublereal *a, 
		      integer *k, integer *levmax, integer *inboxes,
		      integer *near_suspects__,
		      integer *boxes, integer *iconts,
		      integer *levels, 
		      integer *ipts, doublereal *work,
		      integer *suspects, integer *inbox, 
		      doublereal *rs, integer *ia,
		      doublereal *dists_near__, integer *near_nums__,
		      doublereal *centers, integer *nbout);
    static doublereal d__;
    static integer i__, j, keep_appr__, isuspects, lsuspects, inear_nums__, 
	    lnear_nums__;
    extern /* Subroutine */
      int store_arrs__(integer *n, integer *m, integer *k,
		       integer *levels, integer *levmax,
		       integer *boxes, integer *nbout,
		       doublereal *centers,
		       doublereal *w_transf__, integer *keepw,
		       integer *ipts, doublereal *ds,
		       doublereal *w, integer *keep,
		       integer *keep_max__);
    static integer iia, lia;
    extern /* Subroutine */ int random_transf_init__(integer *, integer *, 
	    doublereal *, integer *);
    static integer irs, lrs, iww, keep;
    static doublereal done;
    static integer ndmax;
    extern /* Subroutine */ int prinf_(char *, integer *, integer *);
    static integer nbout;
    extern /* Subroutine */ int random_transf__(doublereal *, doublereal *, 
	    doublereal *);
    static integer iinbox, iboxes, levels[100], linbox, levmax, lboxes, 
	    iiwork, liwork, iiconts, liconts;


/*       perform one iteration */

    /* Parameter adjustments */
    b_dim1 = *m;
    b_offset = 1 + b_dim1;
    b -= b_offset;
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    dists_near_dim1 = *k;
    dists_near_offset = 1 + dists_near_dim1;
    dists_near__ -= dists_near_offset;
    near_suspects_dim1 = *k;
    near_suspects_offset = 1 + near_suspects_dim1;
    near_suspects__ -= near_suspects_offset;
    --ipts;
    --w;
    --v;
    --ds;

    /* Function Body */
    *ier = 0;

    done = 1.;
    d__ = log(*n * done / *k) / log(done * 2);
    levmax = (integer) d__;
    prinf_("levmax=*", &levmax, &c__1);
    if (levmax > *m) {
	levmax = *m;
    }

    ndmax = levmax + 1;

/*       . . . find the center of the collection of points in R^m */

/* ccc        do 1900 ijk=1,2 */
    i__1 = *m;
    for (i__ = 1; i__ <= i__1; ++i__) {

	d__ = 0.;
	i__2 = *n;
	for (j = 1; j <= i__2; ++j) {

	    d__ += a[i__ + j * a_dim1];
/* L1200: */
	}

	d__ /= *n;
	ds[i__] = d__;
	i__2 = *n;
	for (j = 1; j <= i__2; ++j) {

	    b[i__ + j * b_dim1] = a[i__ + j * a_dim1] - d__;
/* L1400: */
	}
/* L1800: */
    }

/* L1900: */

/*        . . . apply a random orthogonal transformation to */
/*              each column of the matrix a */

/*        call random_transf(b(1,i),w(iww),w) */

/*       ANDREI: MEMORY FIX */
/*       THIS LINE ABOVE IS NOT NEEDED AND DANGEROUS! */
/*       BECAUSE FOR THE FIRST TIME iww = 0 */
/*       and we write something into w(iww) */

    random_transf_init__(nsteps, m, &w[1], &keep);
    prinf_("keep=*", &keep, &c__1);
    keep_appr__ = *m * 3 * *nsteps + *m * 10;
    prinf_("keep_appr=*", &keep_appr__, &c__1);

    iww = keep + 100;
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	random_transf__(&b[i__ * b_dim1 + 1], &w[iww], &w[1]);

	i__2 = *m;
	for (j = 1; j <= i__2; ++j) {

	    b[j + i__ * b_dim1] = w[iww + j - 1];
/* ANDREI: UNDO THE RANDOM TRANSFORMATION */
/*        b(j,i) = a(j,i) */
/*        w(iww+j-1) = a(j,i) */
/* ANDREI */
/* L2200: */
	}
/* L2400: */
    }

/*       allocate memory */

    iboxes = keep + 100;
    lboxes = pow_ii(&c__2, &levmax) * 10 + 100;

    iinboxes = iboxes + lboxes;
    linboxes = *n + 10;

    iiconts = iinboxes + linboxes;
    liconts = 1000;

    iiwork = iiconts + liconts;
    liwork = *n * 6 + 200;

    isuspects = iiwork + liwork;
    lsuspects = *n + 10;

    irs = isuspects + lsuspects;
    lrs = *n + 10;

    iinbox = irs + lrs;
    linbox = *k * 10 + 10;

    iia = iinbox + linbox;
    lia = *n + 10;

    inear_nums__ = iia + lia;
    lnear_nums__ = *n + 10;

    icenters = inear_nums__ + lnear_nums__;
    lcenters = (pow_ii(&c__2, &levmax) << 2) + 100;

    *lused = pow_ii(&c__2, &levmax) * (ndmax + 10) + *n * 7 + *k * 10 + 2000 
	    + (pow_ii(&c__2, &levmax) << 2) + 100;
    i__1 = *lused / 1000;
    prinf_("and lused/1000=*", &i__1, &c__1);
    if (*lused > *lenw3) {
	*ier = 8;
	i__1 = *lused - *lenw3;
	prinf_("bombing from one_iter with lused-lenw3=*", &i__1, &c__1);
	exit(1);
    }
    
    one_iter0__(n, m, &b[b_offset],
		k, &levmax, (integer*)(&w[iinboxes]),
		&near_suspects__[near_suspects_offset],
		(integer*)(&w[iboxes]), (integer*)(&w[iiconts]), 
		levels,
		&ipts[1], &w[iiwork],
		(integer*)(&w[isuspects]),
		(integer*)(&w[iinbox]),
		&w[irs], (integer*)(&w[iia]),
		&dists_near__[dists_near_offset],
		(integer*)(&w[inear_nums__]),
		&w[icenters], &nbout);

/*       store the produced data for future use */

/*       ANDREI: query */
    prinf_("keep_max = *", keep_max__, &c__1);
/*        call prini(0, 0) */
    
    store_arrs__(n, m, k,
		 levels, &levmax,
		 (integer*)(&w[iboxes]), &nbout,
		 &w[icenters], &w[1],
		 &keep, &ipts[1], &ds[1], &v[1], keepv, keep_max__);
/*        call prini(6, 13) */

    prinf_("keepv=*", keepv, &c__1);
/*        stop */
    return 0;
} /* one_iter__ */






/* Subroutine */ int retr_arrs__(integer *n, integer *m, integer *k, integer *
	ilevels, integer *levmax, integer *iboxes, integer *nbout, integer *
	icenters, integer *iw_transf__, integer *keepw, integer *iipts, 
	integer *ids, doublereal *w)
{

/*       retrieve the scalar data and the addresses */

    /* Parameter adjustments */
    --w;

    /* Function Body */
    *n = (integer) w[1];
    *m = (integer) w[2];
    *k = (integer) w[3];
    *levmax = (integer) w[4];
    *nbout = (integer) w[5];

    *iboxes = (integer) w[11];
    *ilevels = (integer) w[12];
    *icenters = (integer) w[13];
    *iw_transf__ = (integer) w[14];
    *iipts = (integer) w[16];
    *ids = (integer) w[17];
    return 0;
} /* retr_arrs__ */






/* Subroutine */ int store_arrs__(integer *n, integer *m, integer *k, integer 
	*levels, integer *levmax, integer *boxes, integer *nbout, doublereal *
	centers, doublereal *w_transf__, integer *keepw, integer *ipts, 
	doublereal *ds, doublereal *w, integer *keep, integer *keep_max__)
{
    /* Builtin functions */
    integer pow_ii(integer *, integer *);

    /* Local variables */
    static integer icenters, lcenters, iw, lw, nbout_appr__;
    extern /* Subroutine */
      int peter_copy__(doublereal *a, doublereal *b, integer *n);
    extern /* Subroutine */
      int peter_intcopy__(integer *ia, integer *ib, integer *n);
    static integer ids, lds, itrack_coord__;
    extern /* Subroutine */ int prinf_(char *, integer *, integer *);
    static integer iipts, lipts, iboxes, lboxes, ilevels, llevels;


/*       store in array w all of the data needed by the */
/*       subroutine one_set_suspects */

/*        . . . allocate memory */

    /* Parameter adjustments */
    --w;
    --ds;
    --ipts;
    --centers;
    boxes -= 11;
    --levels;

    /* Function Body */
    prinf_("nbout=*", nbout, &c__1);
    nbout_appr__ = pow_ii(&c__2, levmax) << 1;
    prinf_("nbout_appr=*", &nbout_appr__, &c__1);
    prinf_("keepw=*", keepw, &c__1);

    iboxes = 100;
    lboxes = *nbout * 10 + 10;

    ilevels = iboxes + lboxes;
    llevels = *levmax + 2;

    icenters = ilevels + llevels;
    lcenters = *nbout + 2;

    iw = icenters + lcenters;
    lw = *keepw + 6;

    iipts = iw + lw;
    lipts = *n + 2;

    ids = iipts + lipts;
    lds = *m + 2;

    *keep = ids + lds;
    if (*keep > *keep_max__) {
	prinf_("store_arrs: BAD, keep = *", keep, &c__1);
	prinf_("and keep_max = *", keep_max__, &c__1);
	exit(1);
    }

/*       . . . copy the arrays */

    peter_intcopy__(&boxes[11], (integer*)(&w[iboxes]), &lboxes);
    peter_intcopy__(&levels[1], (integer*)(&w[ilevels]), &llevels);
    peter_copy__(&centers[1], &w[icenters], &lcenters);
    peter_copy__(w_transf__, &w[iw], &lw);
    peter_intcopy__(&ipts[1], (integer*)(&w[iipts]), &lipts);
    peter_copy__(&ds[1], &w[ids], &lds);

/*       store the scalar data */

    w[1] = *n + .1f;
    w[2] = *m + .1f;
    w[3] = *k + .1f;
    w[4] = *levmax + .1f;
    w[5] = *nbout + .1f;

    w[11] = iboxes + .1f;
    w[12] = ilevels + .1f;
    w[13] = icenters + .1f;
    w[14] = iw + .1f;
    w[15] = itrack_coord__ + .1f;
    w[16] = iipts + .1f;
    w[17] = ids + .1f;

    return 0;
} /* store_arrs__ */






/* Subroutine */ int one_iter0__(integer *n, integer *m, doublereal *a, 
	integer *k, integer *levmax, integer *inboxes, integer *
	near_suspects__, integer *boxes, integer *iconts, integer *levels, 
	integer *ipts, doublereal *work, integer *suspects, integer *inbox, 
	doublereal *rs, integer *ia, doublereal *dists_near__, integer *
	near_nums__, doublereal *centers, integer *nbout)
{
    /* System generated locals */
    integer a_dim1, a_offset, near_suspects_dim1, near_suspects_offset, 
	    dists_near_dim1, dists_near_offset, i__1, i__2, i__3;

    /* Local variables */
    static doublereal d__;
    static integer i__, j, i1, j1, n1;
    extern /* Subroutine */ int store_one__(integer *, integer *, doublereal *
	    , integer *, doublereal *, integer *, integer *);
    static integer jj, np, nj1;
    extern /* Subroutine */ int struct_bld__(integer *, integer *, doublereal 
	    *, integer *, integer *, integer *, integer *, integer *, 
	    doublereal *, doublereal *);
    static integer iii, jjj, nbs, nnj, lev, ipt, ibox, jbox;
    extern /* Subroutine */ int dist_compute__(doublereal *, doublereal *, 
	    integer *, doublereal *), one_box_lists__(integer *, integer *, 
	    integer *, integer *);
    static integer ipoint;


/*       build the structure */

    /* Parameter adjustments */
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    dists_near_dim1 = *k;
    dists_near_offset = 1 + dists_near_dim1;
    dists_near__ -= dists_near_offset;
    near_suspects_dim1 = *k;
    near_suspects_offset = 1 + near_suspects_dim1;
    near_suspects__ -= near_suspects_offset;
    --inboxes;
    boxes -= 11;
    --iconts;
    --levels;
    --ipts;
    --work;
    --suspects;
    --inbox;
    --rs;
    --ia;
    --near_nums__;
    --centers;

    /* Function Body */
    struct_bld__(n, m, &a[a_offset], &boxes[11], &levels[1], levmax, nbout, &
	    ipts[1], &work[1], &centers[1]);

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	near_nums__[i__] = 0;
/* L1400: */
    }

/*       one box after another, find the list of neighbors, and */
/*       scan the said list, finding the nearest neighbors in it */

    i__1 = *nbout;
    for (ibox = 1; ibox <= i__1; ++ibox) {

	lev = boxes[ibox * 10 + 2];
	if (lev != *levmax) {
	    goto L3000;
	}

	i1 = boxes[ibox * 10 + 6];
	n1 = boxes[ibox * 10 + 7];

	i__2 = n1;
	for (i__ = 1; i__ <= i__2; ++i__) {

	    inbox[i__] = i1 + i__ - 1;
/* L2000: */
	}

/*       . . .  extract the list of this box's neighbors */

	one_box_lists__(&ibox, &levels[1], levmax, &iconts[1]);

	nbs = *levmax + 1;

/*       construct the list of all points in all nbs */
/*       neighboring boxes */

	nnj = 0;
	i__2 = nbs;
	for (j = 1; j <= i__2; ++j) {

	    jbox = iconts[j];
	    j1 = boxes[jbox * 10 + 6];
	    nj1 = boxes[jbox * 10 + 7];

	    i__3 = nj1;
	    for (jj = 1; jj <= i__3; ++jj) {

		++nnj;
		suspects[nnj] = j1 + jj - 1;
/* L2200: */
	    }
/* L2400: */
	}

	iii = 0;

/*       process points in the box ibox one after another */

	i__2 = n1;
	for (i__ = 1; i__ <= i__2; ++i__) {

	    ipoint = inbox[i__];
	    ipt = ipts[ipoint];

/*       for the point number ipt, scan the array suspects of */
/*       points in neighboring boxes, finding the nearest k points */

	    i__3 = nnj;
	    for (j = 1; j <= i__3; ++j) {

		jjj = suspects[j];


		if (jjj >= ipoint) {
		    goto L2600;
		}


		jj = ipts[jjj];

		dist_compute__(&a[ipt * a_dim1 + 1], &a[jj * a_dim1 + 1], m, &
			d__);

		np = near_nums__[ipoint];
		if (np == *k && d__ >= dists_near__[ipoint * dists_near_dim1 
			+ 1]) {
		    goto L2500;
		}
		store_one__(&ipoint, &jjj, &d__, &near_suspects__[
			near_suspects_offset], &dists_near__[
			dists_near_offset], &near_nums__[1], k);

L2500:

		np = near_nums__[jjj];
		if (np == *k && d__ >= dists_near__[jjj * dists_near_dim1 + 1]
			) {
		    goto L2600;
		}
		store_one__(&jjj, &ipoint, &d__, &near_suspects__[
			near_suspects_offset], &dists_near__[
			dists_near_offset], &near_nums__[1], k);

L2600:
		;
	    }

/* ANDREI: PRINT POINT AND ITS SUSPECTS */
/*       call prinf("ipt = *", ipt, 1) */
/*       call prinf("suspects = *", suspects, nnj) */
/* L2800: */
	}

L3000:
	;
    }

    return 0;
} /* one_iter0__ */






/* Subroutine */ int store_one__(integer *ipoint, integer *jj, doublereal *
	d__, integer *near_suspects__, doublereal *dists_near__, integer *
	near_nums__, integer *k)
{
    /* System generated locals */
    integer near_suspects_dim1, near_suspects_offset, dists_near_dim1, 
	    dists_near_offset;

    /* Local variables */
    static integer np;
    extern /* Subroutine */ int peter_heap_build_down__(doublereal *, integer 
	    *, integer *);
    static integer ifheap;
    extern /* Subroutine */ int peter_replace_one_down__(doublereal *, 
	    integer *, integer *, doublereal *, integer *);


/*       if this is the first neighbor for the point */
/*       ipoint - store it and exit */

    /* Parameter adjustments */
    --near_nums__;
    dists_near_dim1 = *k;
    dists_near_offset = 1 + dists_near_dim1;
    dists_near__ -= dists_near_offset;
    near_suspects_dim1 = *k;
    near_suspects_offset = 1 + near_suspects_dim1;
    near_suspects__ -= near_suspects_offset;

    /* Function Body */
    np = near_nums__[*ipoint];

/*       if the number of neighbors stored for the point */
/*       ipoint at this time is less than k, store it and */
/*       exit */

    ifheap = 0;
    if (np == *k - 1) {
	ifheap = 1;
    }

    if (np >= *k) {
	goto L2000;
    }

    ++np;
    near_suspects__[np + *ipoint * near_suspects_dim1] = *jj;
    dists_near__[np + *ipoint * dists_near_dim1] = *d__;
    near_nums__[*ipoint] = np;

/*       if this is the element number k, convert the array */
/*       dists_near(1,ipoint) into a heap */

    if (ifheap == 0) {
	return 0;
    }

    peter_heap_build_down__(&dists_near__[*ipoint * dists_near_dim1 + 1], &
	    near_suspects__[*ipoint * near_suspects_dim1 + 1], &np);

    return 0;

L2000:

/*       there are k neighbors stored; store one more and */
/*       reheapify */

/* ccc        if(d .ge. dists_near(1,ipoint) ) return */

    peter_replace_one_down__(&dists_near__[*ipoint * dists_near_dim1 + 1], &
	    near_suspects__[*ipoint * near_suspects_dim1 + 1], k, d__, jj);

    return 0;
} /* store_one__ */






/* Subroutine */ int one_box_lists__(integer *ibox, integer *levels, integer *
	levmax, integer *iconts)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    extern /* Subroutine */ int find_box__(integer *, integer *, integer *, 
	    integer *);
    static integer i__;
    extern /* Subroutine */ int to_binary__(integer *, integer *, integer *);
    static integer ia[100], ib;


/*       find all  boxes on the level levmax that have */
/*       contact of type 1 with the box ibox */

    /* Parameter adjustments */
    --iconts;
    --levels;

    /* Function Body */
    iconts[1] = *ibox;
    to_binary__(ibox, levmax, ia);

    i__1 = *levmax;
    for (i__ = 1; i__ <= i__1; ++i__) {

	ia[i__ - 1] = -ia[i__ - 1];
	find_box__(ia, &levels[1], levmax, &ib);

	iconts[i__ + 1] = ib;
	ia[i__ - 1] = -ia[i__ - 1];
/* L2000: */
    }

    return 0;
} /* one_box_lists__ */






/* Subroutine */ int to_binary__(integer *ii, integer *levmax, integer *iarr)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__, j, jj, iii;


    /* Parameter adjustments */
    --iarr;

    /* Function Body */
    iii = *ii;
    i__1 = *levmax;
    for (i__ = 1; i__ <= i__1; ++i__) {

	j = iii / 2;
	jj = iii - (j << 1);
	iarr[*levmax - i__ + 1] = jj;
	iii = j;
/* L1200: */
    }

    i__1 = *levmax;
    for (i__ = 1; i__ <= i__1; ++i__) {

	if (iarr[i__] == 0) {
	    iarr[i__] = -1;
	}
/* L1400: */
    }

    return 0;
} /* to_binary__ */






/* Subroutine */ int find_box__(integer *indbox, integer *levels, integer *
	levmax, integer *ib)
{
    /* Builtin functions */
    integer pow_ii(integer *, integer *);

    /* Local variables */
    static integer i__, nn, nlast, lastlev;


    /* Parameter adjustments */
    --levels;
    --indbox;

    /* Function Body */
    lastlev = levels[*levmax + 1];
    nlast = pow_ii(&c__2, levmax);

/*       find the location in array boxes of the box */
/*       specified by its array indbox */

    *ib = 0;
    nn = 1;
    for (i__ = *levmax; i__ >= 1; --i__) {

	*ib += (indbox[i__] + 1) * nn;
	nn <<= 1;
/* L1200: */
    }

    *ib = *ib / 2 + lastlev;
    return 0;
} /* find_box__ */






/* Subroutine */ int struct_bld__(integer *n, integer *m, doublereal *a, 
	integer *boxes, integer *levels, integer *levmax, integer *nbout, 
	integer *ipts, doublereal *work, doublereal *centers)
{
    /* System generated locals */
    integer a_dim1, a_offset, i__1, i__2;

    /* Local variables */
    static integer i__, nb, nb2;
    extern /* Subroutine */
      int one_subdiv__(doublereal *a, integer *ipts, integer *m, 
		       integer *n, integer *ibox, integer *boxes,
		       integer *nb, integer *nbout,
		       integer *ib1, integer *ib2,
		       integer *icoord, doublereal *thresh,
		       doublereal *xs, doublereal *ys, doublereal *ww);
    static integer ijk, lev, ixs, iys, lxs, lys, iww, lww, iib1, iib2, lib1, 
	    lib2, idad, ibox, ndmax, icoord;
    static doublereal thresh;


/*       initialize the array ipts */

    /* Parameter adjustments */
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    boxes -= 11;
    --levels;
    --ipts;
    --work;
    --centers;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	ipts[i__] = i__;
/* L1400: */
    }

    i__1 = ndmax;
    for (i__ = 1; i__ <= i__1; ++i__) {

	levels[i__] = 0;
/* L1600: */
    }

/*       initialize the subdivision process */

    boxes[11] = 1;
    boxes[12] = 0;
    boxes[13] = -7;
    boxes[14] = -1;
    boxes[15] = -1;
    boxes[16] = 1;
    boxes[17] = *n;
    boxes[18] = -7;

    boxes[19] = 0;
    boxes[20] = 0;

    nb = 1;

/*       separate the array a into two groups with respect to */
/*       the coordinate icoord */

    ibox = 1;
    *nbout = 1;
    i__1 = *levmax;
    for (ijk = 1; ijk <= i__1; ++ijk) {
/* ccc        call prinf('ijk=*',ijk,1) */

	nb2 = *nbout;
	i__2 = nb2;
	for (i__ = 1; i__ <= i__2; ++i__) {

	    if (boxes[i__ * 10 + 10] == 7) {
		goto L1800;
	    }

	    ibox = i__;
	    iib1 = 1;
	    lib1 = *n + 10;

	    iib2 = iib1 + lib1;
	    lib2 = *n + 10;

	    ixs = iib2 + lib2;
	    lxs = *n + 10;

	    iys = ixs + lxs;
	    lys = *n + 10;

	    iww = iys + lys;
	    lww = (*n << 1) + 20;
	    
	    one_subdiv__(&a[a_offset], &ipts[1], m,
			 n, &ibox, &boxes[11],
			 &nb, nbout,
			 (integer*)(&work[iib1]), (integer*)(&work[iib2]),
			 &icoord, &thresh,
			 &work[ixs], &work[iys], &work[iww]);

	    centers[ibox] = thresh;
	    idad = boxes[ibox * 10 + 3];

	    nb = *nbout;
L1800:
	    ;
	}

/* L2000: */
    }

/*       construct the array lev */

    lev = -1;
    i__1 = *nbout;
    for (i__ = 1; i__ <= i__1; ++i__) {

	if (boxes[i__ * 10 + 2] <= lev) {
	    goto L2200;
	}

	lev = boxes[i__ * 10 + 2];
	levels[lev + 1] = i__;
L2200:
	;
    }

    *levmax = lev;

    return 0;
} /* struct_bld__ */






/* Subroutine */ int one_subdiv__(doublereal *a, integer *ipts, integer *m, 
	integer *n, integer *ibox, integer *boxes, integer *nb, integer *
	nbout, integer *ib1, integer *ib2, integer *icoord, doublereal *
	thresh, doublereal *xs, doublereal *ys, doublereal *ww)
{
    /* System generated locals */
    integer a_dim1, a_offset;

    /* Local variables */
    extern /* Subroutine */ int one_sepa__(doublereal *, integer *, integer *,
	     integer *, integer *, integer *, integer *, integer *, integer *,
	     doublereal *, doublereal *, doublereal *, doublereal *);
    static integer i1, n1, n2, ison1, ison2, n_ibox__;


/*       This subroutine subdivides one box in the structure, */
/*       obtaining the two sonnie boxes. The information about */
/*       this felicitous event is stored in the arrays boxes, */
/*       ipts */


/*       . . . extract from array boxes the information about */
/*             the box number ibox */

    /* Parameter adjustments */
    --ipts;
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    boxes -= 11;
    --ib1;
    --ib2;
    --xs;
    --ys;

    /* Function Body */
    i1 = boxes[*ibox * 10 + 6];
    n_ibox__ = boxes[*ibox * 10 + 7];

/*       determine the coordinate to be subdivided */

    *icoord = boxes[*ibox * 10 + 2] + 1;

/*       perform the subdivision */

    one_sepa__(&a[a_offset], &ipts[i1], m, &n_ibox__, icoord, &n1, &n2, &ib1[
	    1], &ib2[1], &xs[1], thresh, &ys[1], ww);

/*       enter in array boxes, the information */
/*       about the two sonnies */

    *nbout = *nb + 1;
    ison1 = *nbout;
    boxes[*nbout * 10 + 1] = *nbout;
    boxes[*nbout * 10 + 2] = boxes[*ibox * 10 + 2] + 1;
    boxes[*nbout * 10 + 3] = *ibox;
    boxes[*nbout * 10 + 4] = -1;
    boxes[*nbout * 10 + 5] = -1;
    boxes[*nbout * 10 + 6] = boxes[*ibox * 10 + 6];
    boxes[*nbout * 10 + 7] = n1;
    boxes[*nbout * 10 + 8] = *icoord;
    boxes[*nbout * 10 + 9] = 0;
    boxes[*nbout * 10 + 10] = 0;

    boxes[*ibox * 10 + 4] = *nbout;

    ++(*nbout);
    ison2 = *nbout;
    boxes[*nbout * 10 + 1] = *nbout;
    boxes[*nbout * 10 + 2] = boxes[*ibox * 10 + 2] + 1;
    boxes[*nbout * 10 + 3] = *ibox;
    boxes[*nbout * 10 + 4] = -1;
    boxes[*nbout * 10 + 5] = -1;
    boxes[*nbout * 10 + 6] = boxes[*ibox * 10 + 6] + n1;
    boxes[*nbout * 10 + 7] = n2;
    boxes[*nbout * 10 + 8] = *icoord;
    boxes[*nbout * 10 + 9] = 0;
    boxes[*nbout * 10 + 10] = 0;

    boxes[*ibox * 10 + 5] = *nbout;
    boxes[*ibox * 10 + 10] = 7;

    return 0;
} /* one_subdiv__ */






/* Subroutine */ int one_sepa__(doublereal *a, integer *ipts, integer *m, 
	integer *n, integer *icoord, integer *n1, integer *n2, integer *ia, 
	integer *jpts, doublereal *xs, doublereal *thresh, doublereal *ys, 
	doublereal *ww)
{
    /* System generated locals */
    integer a_dim1, a_offset, i__1;
    doublereal d__1;

    /* Local variables */
    static doublereal xmax_lft__, xmin_rht__;
    static integer i__, j, i1;
    static doublereal x3, thresh_new__;
    extern /* Subroutine */
      int array_subdiv__(doublereal *xs, integer *n, integer *nthresh,
			 doublereal *x3, integer *i1,
			 integer *ia, integer *w);

/*       sort the coordinates icoord of all points in this box */

    /* Parameter adjustments */
    --ipts;
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    --ia;
    --jpts;
    --xs;
    --ys;
    --ww;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	j = ipts[i__];
	xs[i__] = a[*icoord + j * a_dim1];
/* L1400: */
    }

/* ccc        call peter_heapsort_rea_part(xs,ia,n,n/2+1) */

    i__1 = *n / 2;

    array_subdiv__(&xs[1], n, &i__1,
		   &x3, &i1, &ia[1], (integer*)(&ww[1]));

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	jpts[i__] = ipts[ia[i__]];
	ys[i__] = xs[ia[i__]];
/* L1600: */
    }

    *n1 = *n / 2;
    *n2 = *n - *n1;

    *thresh = (xs[ia[*n / 2]] + xs[ia[*n / 2 + 1]]) / 2;
/*        call prin2("THRESHOLD = *", thresh, 1) */
/*        call prin2("COORDINATES = *", ys, n) */
/* ANDREI: MAKE THRESHOLD BE EQUAL TO THE MEDIAN */
    xmax_lft__ = -1e50;
    xmin_rht__ = 1e50;
    i__1 = *n / 2;
    for (i__ = 1; i__ <= i__1; ++i__) {
	if (xs[ia[i__]] >= xmax_lft__) {
	    xmax_lft__ = xs[ia[i__]];
	}
/* L1602: */
    }
    i__1 = *n;
    for (i__ = *n / 2 + 1; i__ <= i__1; ++i__) {
	if (xs[ia[i__]] <= xmin_rht__) {
	    xmin_rht__ = xs[ia[i__]];
	}
/* L1603: */
    }
    thresh_new__ = (xmax_lft__ + xmin_rht__) / 2;
/*        call prin2("THRESHOLD_NEW = *", thresh_new, 1) */
    if ((d__1 = thresh_new__ - *thresh, abs(d__1)) > 1e-10) {
/*           call prinf("They were different*", i, 0) */
    }
    *thresh = thresh_new__;
/* ANDREI: FINISH THRESHOLD */

    peter_intcopy__(&jpts[1], &ipts[1], n);

    return 0;
} /* one_sepa__ */






/* Subroutine */ int array_subdiv__(doublereal *xs, integer *n, integer *
	nthresh, doublereal *x3, integer *i1, integer *ia, integer *w)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__, i2;
    static doublereal x1, x2;
    static integer nn, nn1, iiaa, iibb, liaa, libb, nthr;
    static doublereal xmin, xmax;
    extern /* Subroutine */ int array_subdiv_onestep__(integer *, doublereal *
	    , doublereal *, doublereal *, doublereal *, integer *, integer *, 
	    integer *, integer *);
    static integer ifout;


/*       initialize the array ia */

    /* Parameter adjustments */
    --w;
    --ia;
    --xs;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	ia[i__] = i__;
/* L1100: */
    }

/*       find the minimum and maximum elements in array xs */

    nthr = *nthresh + 1;
    xmin = 1e50;
    xmax = -1e50;

    iiaa = 1;
    liaa = *n + 2;

    iibb = iiaa + liaa;
    libb = *n + 2;

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	if (xs[i__] > xmax) {
	    xmax = xs[i__];
	}
	if (xs[i__] < xmin) {
	    xmin = xs[i__];
	}
/* L1200: */
    }

    x1 = xmin;
    x2 = xmax;
    *i1 = 1;
    i2 = *n;

    ifout = 0;

    for (i__ = 1; i__ <= 100; ++i__) {

	if (i2 - *i1 == 1 && ifout == 1) {
	    return 0;
	}
	if (i2 - *i1 == 1) {
	    ifout = 1;
	}

	*x3 = (x1 + x2) / 2;

/*       separate the subarray starting at i1 and ending at i2 */
/*       into elements that are smaller than x3, and those otherwise */

	nn = i2 - *i1 + 1;
	array_subdiv_onestep__(&ia[*i1], &xs[1], &x1, &x2, x3, &nn, &nn1, &w[
		iiaa], &w[iibb]);

	if (*i1 + nn1 < nthr) {

	    *i1 += nn1;
	    x1 = *x3;
	    goto L2000;
	}

	i2 = *i1 + nn1;
	x2 = *x3;

L2000:
	;
    }

    return 0;
} /* array_subdiv__ */






/* Subroutine */ int array_subdiv_onestep__(integer *ia, doublereal *xs, 
	doublereal *xmin, doublereal *xmax, doublereal *x3, integer *n, 
	integer *n1, integer *iaa, integer *ibb)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__;
    static doublereal x1, x2;
    static integer ias, ibs;


/*       conduct the bisection */

    /* Parameter adjustments */
    --ibb;
    --iaa;
    --xs;
    --ia;

    /* Function Body */
    x1 = *xmin;
    x2 = *xmax;
    ias = 0;
    ibs = 0;

    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	if (xs[ia[i__]] <= *x3) {
	    ++ias;
	    iaa[ias] = ia[i__];
	    goto L1400;
	}

	++ibs;
	ibb[ibs] = ia[i__];

L1400:
	;
    }

    *n1 = ias;
    i__1 = *n1;
    for (i__ = 1; i__ <= i__1; ++i__) {

	ia[i__] = iaa[i__];
/* L1600: */
    }

    i__1 = *n - *n1;
    for (i__ = 1; i__ <= i__1; ++i__) {

	ia[*n1 + i__] = ibb[i__];
/* L1800: */
    }

    return 0;
} /* array_subdiv_onestep__ */






/* Subroutine */ int dist_compute__(doublereal *a1, doublereal *a2, integer *
	m, doublereal *d__)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__;


    /* Parameter adjustments */
    --a2;
    --a1;

    /* Function Body */
    *d__ = 0.;
    i__1 = *m;
    for (i__ = 1; i__ <= i__1; ++i__) {

/* ANDREI: **2 */
/*        d=d+(a1(i)-a2(i))**2 */
	*d__ += (a1[i__] - a2[i__]) * (a1[i__] - a2[i__]);
/* L1200: */
    }

/* ccc        d=sqrt(d) */
    return 0;
} /* dist_compute__ */






/* Subroutine */ int peter_copy__(doublereal *a, doublereal *b, integer *n)
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
/* L1200: */
    }
    return 0;
} /* peter_copy__ */






/* Subroutine */ int peter_intcopy__(integer *ia, integer *ib, integer *n)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__;


    /* Parameter adjustments */
    --ib;
    --ia;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	ib[i__] = ia[i__];
/* L1200: */
    }
    return 0;
} /* peter_intcopy__ */




/*                   Description of array boxes */

/*       boxes(1,i) =i */
/*       boxes(2,i) - box's level of subdivision */
/*       boxes(3,i) - box's daddy */
/*       boxes(4,i) - box's first sonny */
/*       boxes(5,i) - box's second sonny */
/*       boxes(6,i) - location in array ipts of box's first point */
/*       boxes(7,i) - number of points in the box */
/*       boxes(8,i) - sequence number of coordinate subdivided */
/*                    to obtain this box from his daddy */

/*       boxes(10,i) - indicator of the state of completion; */
/*                     boxes(10,i)=0 means that the i-th box */
/*                     has not been completely processed; */
/*                     boxes(10,i)=7 means that the i-th box */
/*                     has been completely processed */





/* Subroutine */ int peter_heapsort_rea_down__(doublereal *ra, integer *ia, 
	integer *n)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__, m;
    static doublereal dd;
    static integer ii, jj, ii0;
    extern /* Subroutine */ int peter_heapit_rea_down__(doublereal *, integer 
	    *, integer *, integer *);


    /* Parameter adjustments */
    --ra;
    --ia;

    /* Function Body */
    for (ii = *n; ii >= 2; ii += -2) {

	ii0 = ii / 2;
	peter_heapit_rea_down__(&ra[1], &ia[1], n, &ii0);
/* L1600: */
    }

/*       . . . sort */

    i__1 = *n - 1;
    for (i__ = 1; i__ <= i__1; ++i__) {

	m = *n - i__ + 1;

	jj = ia[m];
	ia[m] = ia[1];
	ia[1] = jj;

	dd = ra[m];
	ra[m] = ra[1];
	ra[1] = dd;

	--m;
	peter_heapit_rea_down__(&ra[1], &ia[1], &m, &c__1);
/* L2000: */
    }

    return 0;
} /* peter_heapsort_rea_down__ */






/* Subroutine */ int peter_replace_one_down__(doublereal *ra, integer *ia, 
	integer *n, doublereal *x, integer *ix)
{
    extern /* Subroutine */ int peter_heapit_rea_down__(doublereal *, integer 
	    *, integer *, integer *);


/*       if the new element is greater than ra(ia(1)), exit */

    /* Parameter adjustments */
    --ra;
    --ia;

    /* Function Body */
    if (*x >= ra[1]) {
	return 0;
    }

/*       replace and re-heapify */

    ra[1] = *x;
    ia[1] = *ix;
    peter_heapit_rea_down__(&ra[1], &ia[1], n, &c__1);

    return 0;
} /* peter_replace_one_down__ */






/* Subroutine */ int peter_heap_build_down__(doublereal *ra, integer *ia, 
	integer *n)
{
    static integer ii, ii0;
    extern /* Subroutine */ int peter_heapit_rea_down__(doublereal *, integer 
	    *, integer *, integer *);


    /* Parameter adjustments */
    --ra;
    --ia;

    /* Function Body */
    for (ii = *n; ii >= 2; ii += -2) {

	ii0 = ii / 2;
	peter_heapit_rea_down__(&ra[1], &ia[1], n, &ii0);
/* L1600: */
    }

    return 0;
} /* peter_heap_build_down__ */






/* Subroutine */ int peter_heapit_rea_down__(doublereal *ra, integer *ia, 
	integer *n, integer *ii)
{
    static integer i__;
    static doublereal d0, d1, d2;
    static integer id0, id1, id2, ijk, ison1, ison2;


/*       heapify */

    /* Parameter adjustments */
    --ra;
    --ia;

    /* Function Body */
    i__ = *ii;

    for (ijk = 1; ijk <= 100; ++ijk) {

	ison1 = i__ << 1;
	if (ison1 > *n) {
	    return 0;
	}

	ison2 = (i__ << 1) + 1;
	if (ison2 > *n) {

	    d0 = ra[i__];
	    d1 = ra[ison1];

	    id0 = ia[i__];
	    id1 = ia[ison1];

	    if (d0 >= d1) {
		return 0;
	    }

	    ra[i__] = d1;
	    ra[ison1] = d0;
	    ia[i__] = id1;
	    ia[ison1] = id0;

	    return 0;
	}


	d0 = ra[i__];
	d1 = ra[ison1];
	d2 = ra[ison2];

	id0 = ia[i__];
	id1 = ia[ison1];
	id2 = ia[ison2];

	if (d0 >= d1 && d0 >= d2) {
	    return 0;
	}
	if (d1 >= d2) {
	    ra[i__] = d1;
	    ra[ison1] = d0;

	    ia[i__] = id1;
	    ia[ison1] = id0;
	    i__ = ison1;

	    goto L1400;
	}

	ra[i__] = d2;
	ra[ison2] = d0;

	ia[i__] = id2;
	ia[ison2] = id0;
	i__ = ison2;

L1400:
	;
    }
    return 0;
} /* peter_heapit_rea_down__ */






/* Subroutine */ int peter_heapsort_rea_up__(doublereal *ra, integer *ia, 
	integer *n, integer *k, integer *kk)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__, m;
    static doublereal dd;
    static integer ii, jj, ii0;
    extern /* Subroutine */ int peter_heapit_rea_up__(doublereal *, integer *,
	     integer *, integer *);


/*        This subroutine sorts the array ra of n real numbers */
/*        in decreasing order starting from the bottom, and */
/*        terminates the process when k numbers with different */
/*        keys ia have been encountered. Thus, on exit the last */
/*        kk elements of ra are the smallest kk elements, with */
/*        the smallest one occupying the location ra(n). The */
/*        keys ia are subjected to the same permutation as the */
/*        elements of ra. */

/*        . . . heapify */

    /* Parameter adjustments */
    --ra;
    --ia;

    /* Function Body */
    for (ii = *n; ii >= 2; ii += -2) {

	ii0 = ii / 2;
	peter_heapit_rea_up__(&ra[1], &ia[1], n, &ii0);
/* L1600: */
    }

/*       . . . sort */

    *kk = 1;
    i__1 = *n - 1;
    for (i__ = 1; i__ <= i__1; ++i__) {

	m = *n - i__ + 1;

	jj = ia[m];
	ia[m] = ia[1];
	ia[1] = jj;

	dd = ra[m];
	ra[m] = ra[1];
	ra[1] = dd;

	if (i__ != 1 && ia[m] != ia[m + 1]) {
	    ++(*kk);
	}
	if (*kk == *k) {
	    return 0;
	}

	--m;
	peter_heapit_rea_up__(&ra[1], &ia[1], &m, &c__1);

/* L2000: */
    }

    return 0;
} /* peter_heapsort_rea_up__ */






/* Subroutine */ int peter_heapit_rea_up__(doublereal *ra, integer *ia, 
	integer *n, integer *ii)
{
    static integer i__;
    static doublereal d0, d1, d2;
    static integer id0, id1, id2, ijk, ison1, ison2;


/*       heapify */

    /* Parameter adjustments */
    --ra;
    --ia;

    /* Function Body */
    i__ = *ii;

    for (ijk = 1; ijk <= 100; ++ijk) {

	ison1 = i__ << 1;
	if (ison1 > *n) {
	    return 0;
	}

	ison2 = (i__ << 1) + 1;
	if (ison2 > *n) {

	    d0 = ra[i__];
	    d1 = ra[ison1];

	    id0 = ia[i__];
	    id1 = ia[ison1];

	    if (d0 <= d1) {
		return 0;
	    }

	    ra[i__] = d1;
	    ra[ison1] = d0;
	    ia[i__] = id1;
	    ia[ison1] = id0;

	    return 0;
	}


	d0 = ra[i__];
	d1 = ra[ison1];
	d2 = ra[ison2];

	id0 = ia[i__];
	id1 = ia[ison1];
	id2 = ia[ison2];

	if (d0 <= d1 && d0 <= d2) {
	    return 0;
	}
	if (d1 <= d2) {
	    ra[i__] = d1;
	    ra[ison1] = d0;

	    ia[i__] = id1;
	    ia[ison1] = id0;
	    i__ = ison1;

	    goto L1400;
	}

	ra[i__] = d2;
	ra[ison2] = d0;

	ia[i__] = id2;
	ia[ison2] = id0;
	i__ = ison2;

L1400:
	;
    }
    return 0;
} /* peter_heapit_rea_up__ */






/* Subroutine */ int second_search__(doublereal *a, integer *m, integer *n, 
	integer *k, integer *near_convicts__, doublereal *dists_convicts__, 
	integer *iarr, doublereal *rarr, integer *iarr2, integer *ia, 
	doublereal *rarr2)
{
    /* System generated locals */
    integer a_dim1, a_offset, near_convicts_dim1, near_convicts_offset, 
	    dists_convicts_dim1, dists_convicts_offset, i__1, i__2, i__3;

    /* Local variables */
    static doublereal d__;
    static integer i__, j, j1, ii, jj, icc;
    extern /* Subroutine */ int peter_heapsort_rea__(doublereal *, integer *, 
	    integer *);
    static integer iii, jjj;
    extern /* Subroutine */ int dist_compute__(doublereal *, doublereal *, 
	    integer *, doublereal *), prinf_(char *, integer *, integer *);


/*       for each of the n points, collect together its */
/*       putative neighbors and the putative neighbors of its */
/*       neighbors, find the nearest k neighbors among this */
/*       elite group of citizens, and put the results back */
/*       in the arrays near_convicts, dists_convicts */

    /* Parameter adjustments */
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    dists_convicts_dim1 = *k;
    dists_convicts_offset = 1 + dists_convicts_dim1;
    dists_convicts__ -= dists_convicts_offset;
    near_convicts_dim1 = *k;
    near_convicts_offset = 1 + near_convicts_dim1;
    near_convicts__ -= near_convicts_offset;
    --iarr;
    --rarr;
    --iarr2;
    --ia;
    --rarr2;

    /* Function Body */
    icc = 0;
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	++icc;
	if (icc == 1000) {
	    prinf_("in second_search2, i=*", &i__, &c__1);
	    icc = 0;
	}

/*        construct the derivative group for the i-th point */

	i__2 = *k;
	for (j = 1; j <= i__2; ++j) {

	    iarr[j] = near_convicts__[j + i__ * near_convicts_dim1];
	    rarr[j] = dists_convicts__[j + i__ * dists_convicts_dim1];
/* L1200: */
	}

	ii = *k;
	i__2 = *k;
	for (j = 1; j <= i__2; ++j) {

	    j1 = iarr[j];
	    i__3 = *k;
	    for (jj = 1; jj <= i__3; ++jj) {
		if (near_convicts__[jj + j1 * near_convicts_dim1] == i__) {
		    goto L1400;
		}
		++ii;
		iarr[ii] = near_convicts__[jj + j1 * near_convicts_dim1];
L1400:
		;
	    }
/* L1600: */
	}

/*       calculate the distances between the i-th point */
/*       and the points in the array iarr */

/* ccc        call prin2('rarr=*',rarr,k) */
	iii = 0;
	i__2 = ii;
	for (j = *k + 1; j <= i__2; ++j) {

	    jjj = iarr[j];
/* ccc        call dist_compute(a(1,i),a(1,jjj),m,rarr(j)) */
/* ccc        goto 2200 */
	    dist_compute__(&a[i__ * a_dim1 + 1], &a[jjj * a_dim1 + 1], m, &
		    d__);
	    if (d__ > rarr[*k]) {
		goto L2200;
	    }

	    ++iii;
	    rarr[iii + *k] = d__;
	    iarr[iii + *k] = iarr[j];
L2200:
	    ;
	}
/* ccc        call prinf('ii=*',ii,1) */
/* ccc        call prinf('and iii+k=*',iii+k,1) */
	ii = iii + *k;

/*       . . . sort */

/* ccc        call peter_copy(iarr,iarr7,ii) */
/* ccc        call peter_copy(rarr,rarr7,ii) */
/*        call peter_heapsort_rea_up(rarr,iarr,ii,k,kk) */
/* NOREP */
	peter_heapsort_rea__(&rarr[1], &iarr2[1], &ii);
	jjj = 1;
	near_convicts__[jjj + i__ * near_convicts_dim1] = iarr[iarr2[jjj]];
	dists_convicts__[jjj + i__ * dists_convicts_dim1] = rarr[iarr2[jjj]];
	i__2 = ii;
	for (j = 2; j <= i__2; ++j) {
	    i__3 = jjj;
	    for (iii = 1; iii <= i__3; ++iii) {
		if (near_convicts__[iii + i__ * near_convicts_dim1] == iarr[
			iarr2[j]]) {
		    goto L2300;
		}
/* L2350: */
	    }
	    ++jjj;
	    near_convicts__[jjj + i__ * near_convicts_dim1] = iarr[iarr2[j]];
	    dists_convicts__[jjj + i__ * dists_convicts_dim1] = rarr[iarr2[j]]
		    ;
	    if (jjj == *k) {
		goto L2375;
	    }
L2300:
	    ;
	}
L2375:
/* cccc        call peter_heapsort_rea_up(rarr7,iarr7,ii,k,kk) */
/* c */
/* c       extract from arrays iarr, rarr the non-repeating */
/* c       elements */
/* c */

/*        jjj=1 */
/*        iarr2(1)=iarr(ii) */
/*        rarr2(1)=rarr(ii) */
/* c */
/*        do 2300 j=ii-1,1,-1 */
/* c */
/*        if(iarr(j) .eq. iarr(j+1)) goto 2300 */
/* c */
/*        jjj=jjj+1 */
/*        iarr2(jjj)=iarr(j) */
/*        rarr2(jjj)=rarr(j) */
/* c */
/*        if(jjj .eq. k) goto 2350 */
/* 2300 continue */
/* 2350 continue */

/* ccc        call prinf('and iarr2 after sorting*',iarr2,k) */
/* ccc        call prin2('and rarr2 after sorting*',rarr2,k) */


/*       copy the first k elements of the sorted array into */
/*       the array near_convicts */

/*        do 2400 j=1,k */
/* c */
/*        jjj=ia(j) */
/*        jjj=j */
/*        near_convicts(j,i)=iarr2(jjj) */
/*        dists_convicts(j,i)=rarr2(jjj) */
/* 2400 continue */

/* L3000: */
	;
    }

    return 0;
} /* second_search__ */






/* Subroutine */ int get_stats__(integer *n, integer *m, doublereal *a, 
	integer *numit, integer *near_convicts__, doublereal *
	dists_convicts__, integer *k, doublereal *w, integer *lused, integer *
	ntest, integer *iw)
{
    /* System generated locals */
    integer a_dim1, a_offset, near_convicts_dim1, near_convicts_offset, 
	    dists_convicts_dim1, dists_convicts_offset;

    /* Local variables */
    extern /* Subroutine */
      int get_stats0__(integer *n, integer *m, doublereal *a, 
		       integer *numit, integer *near_convicts__,
		       doublereal *dists_convicts__,
		       integer *k, doublereal *w, integer *lused,
		       integer *ntest, integer *iw, integer *ia,
		       doublereal *dists, doublereal *dists2,
		       integer *iaa, integer *ib);
    static integer iia, iib, lia, iiaa, liaa, idists, ldists, idists2, 
	    ldists2;


/*       . . . allocate memory */

    /* Parameter adjustments */
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    dists_convicts_dim1 = *k;
    dists_convicts_offset = 1 + dists_convicts_dim1;
    dists_convicts__ -= dists_convicts_offset;
    near_convicts_dim1 = *k;
    near_convicts_offset = 1 + near_convicts_dim1;
    near_convicts__ -= near_convicts_offset;
    --w;

    /* Function Body */
    iia = 1;
    lia = *n + 2;

    idists = iia + lia;
    ldists = *n + 2;

    idists2 = idists + ldists;
    ldists2 = *n + 2;

    iiaa = idists2 + ldists2;
    liaa = *n + 2;

    iib = iiaa + liaa;
    
    get_stats0__(n, m, &a[a_offset],
		 numit, &near_convicts__[near_convicts_offset],
		 &dists_convicts__[dists_convicts_offset], 
		 k, &w[1], lused,
		 ntest, iw, (integer*)(&w[iia]),
		 &w[idists], &w[idists2],
		 (integer*)(&w[iiaa]), (integer*)(&w[iib]));
    return 0;
} /* get_stats__ */






/* Subroutine */ int get_stats0__(integer *n, integer *m, doublereal *a, 
	integer *numit, integer *near_convicts__, doublereal *
	dists_convicts__, integer *k, doublereal *w, integer *lused, integer *
	ntest, integer *iw, integer *ia, doublereal *dists, doublereal *
	dists2, integer *iaa, integer *ib)
{
    /* System generated locals */
    integer a_dim1, a_offset, near_convicts_dim1, near_convicts_offset, 
	    dists_convicts_dim1, dists_convicts_offset, i__1, i__2;
    doublereal d__1;

    /* Builtin functions */
    double sqrt(doublereal);

    /* Local variables */
    extern /* Subroutine */ int peter_heapsort_rea_part__(doublereal *, 
	    integer *, integer *, integer *);
    static doublereal sum_appr__, sum_true__, rat_nearest_aver__, d__;
    static integer i__, j;
    static doublereal sum_appr2__, sum_true2__;
    static integer ic;
    static doublereal var_appr_k__;
    static integer num_belong__;
    static doublereal var_true_k__, small_prop__, prop_belong__, 
	    rat_nearest__, dnum_belong_average__, sum_appr_sq__, 
	    sum_true_sq__, done;
    extern /* Subroutine */ int peter_heapsort_inte__(integer *, integer *, 
	    integer *), prin2_(char *, doublereal *, integer *), 
	    dist_compute__(doublereal *, doublereal *, integer *, doublereal *
	    );
    static integer nleft;
    extern /* Subroutine */ int prinf_(char *, integer *, integer *);
    static doublereal dist_appr_kth__, dist_true_kth__;
    static integer nsmall, nwrong, num_belong_tot__;


/*        analyze the results and print a summary */


/*        . . . for the first ntest points, construct the */
/*              nearest k neighbors via brute force */

    /* Parameter adjustments */
    a_dim1 = *m;
    a_offset = 1 + a_dim1;
    a -= a_offset;
    dists_convicts_dim1 = *k;
    dists_convicts_offset = 1 + dists_convicts_dim1;
    dists_convicts__ -= dists_convicts_offset;
    near_convicts_dim1 = *k;
    near_convicts_offset = 1 + near_convicts_dim1;
    near_convicts__ -= near_convicts_offset;
    --w;
    --ia;
    --dists;
    --dists2;
    --iaa;
    --ib;

    /* Function Body */
    //    *ntest = min(1000,*n);
    *ntest=1000;
    if (*n<1000) *ntest=*n;
    nsmall = 0;
    num_belong_tot__ = 0;
    rat_nearest_aver__ = 0.;
    nwrong = 0;

    sum_true__ = 0.;
    sum_appr__ = 0.;
/* ANDREI */
    sum_true2__ = 0.;
    sum_appr2__ = 0.;
    sum_true_sq__ = 0.;
    sum_appr_sq__ = 0.;
    ic = 0;
    i__1 = *ntest;
    for (i__ = 1; i__ <= i__1; ++i__) {

	++ic;
	if (ic == 100) {
	    prinf_("in get_stats, i=*", &i__, &c__1);
	    ic = 0;
	}

/*       . . . construct the distances for the i-th point */

	i__2 = *n;
	for (j = 1; j <= i__2; ++j) {

	    dist_compute__(&a[i__ * a_dim1 + 1], &a[j * a_dim1 + 1], m, &d__);

	    dists[j] = d__;
	    if (i__ == j) {
		dists[j] = 1e30;
	    }
	    if (dists[j] < dists_convicts__[i__ * dists_convicts_dim1 + 1]) {
		++nsmall;
	    }
/* L1600: */
	}

/*       sort the distances from the i-th point to all other */
/*       points, and take the first k elements */

	peter_heapsort_rea_part__(&dists[1], &ia[1], n, k);
	dist_true_kth__ = 0.;
	dist_appr_kth__ = 0.;

	i__2 = *k;
	for (j = 1; j <= i__2; ++j) {

	    dists2[j] = dists[ia[j]];
/*  ANDREI */
	    sum_true__ += sqrt(dists2[j]);
	    sum_true2__ += dists2[j];
	    dist_true_kth__ += dists2[j];
	    sum_appr__ += sqrt(dists_convicts__[j + i__ * dists_convicts_dim1]
		    );
	    sum_appr2__ += dists_convicts__[j + i__ * dists_convicts_dim1];
	    dist_appr_kth__ += dists_convicts__[j + i__ * dists_convicts_dim1]
		    ;
/* L1800: */
	}
	dist_true_kth__ /= *k;
	dist_appr_kth__ /= *k;
/* ANDREI: **2 */
/*        sum_true_sq = sum_true_sq + dist_true_kth**2 */
/*        sum_appr_sq = sum_appr_sq + dist_appr_kth**2 */
	sum_true_sq__ += dist_true_kth__ * dist_true_kth__;
	sum_appr_sq__ += dist_appr_kth__ * dist_appr_kth__;

/* ANDREI: PRINT THE DISTANCES */
/*        call prinf("i = *", i, 1) */
/*        call prin2("TRUE k distances = *", dists2, k) */
/*        call prin2("APPR k distances = *", dists_convicts(1, i), k) */
/*        call prinf("APPR k indices = *", near_convicts(1, i), k) */
	rat_nearest__ = dists_convicts__[i__ * dists_convicts_dim1 + 1] / 
		dists2[1];
	rat_nearest_aver__ += rat_nearest__;

	if (near_convicts__[i__ * near_convicts_dim1 + 1] != ia[1]) {
	    ++nwrong;
	}

/*       count the number of discrepancies between the "brute force" */
/*       and approximate nearest k neighbors for this point */

	i__2 = *k;
	for (j = 1; j <= i__2; ++j) {

	    dists[j] = dists2[j];
	    dists[j + *k] = dists_convicts__[j + i__ * dists_convicts_dim1];
	    ia[*k + j] = near_convicts__[j + i__ * near_convicts_dim1];
/* L2000: */
	}

/*       . . . sort them things */

	i__2 = *k << 1;
	peter_heapsort_inte__(&ia[1], &iaa[1], &i__2);

	i__2 = *k << 1;
	for (j = 1; j <= i__2; ++j) {

	    ib[j] = ia[iaa[j]];
/* L2200: */
	}

/*       squeeze out the doubles */

	nleft = 1;
	i__2 = *k << 1;
	for (j = 2; j <= i__2; ++j) {
	    if (ib[j - 1] != ib[j]) {
		++nleft;
	    }
/* L2400: */
	}

	done = 1.;
	prop_belong__ = (nleft - *k) * done / *k;
	num_belong__ = (*k << 1) - nleft;
	num_belong_tot__ += num_belong__;
/* ANDREI: PRINT NUM_BELONG */
/*        call prin2("point coordinates = *", a(1, i), m) */
/*        call prinf("num_belong = *", num_belong, 1) */

/* L3000: */
    }

    done = 1.;
    small_prop__ = nsmall * done / *n / *ntest;

    *iw = 13;

/*       ANDREI: DISABLE WRITE */
/*        write(6,3400) */
/*        write(iw,3400) */
/*        write(6,3400) */
/*        write(iw,3400) */
/* L3050: */
/*        write(6,3050) */
/*        write(iw,3050) */

/*        write(6,3400) */
/*        write(iw,3400) */
/*        write(6,3400) */
/*        write(iw,3400) */

/* L3100: */
/*        write(6,3100) n,m,k,numit,ntest */
/*        write(iw,3100) n,m,k,numit,ntest */
/*        write(6,3400) */
/*        write(iw,3400) */
/* L3200: */

/*        write(6,3200) small_prop */
/*        write(iw,3200) small_prop */
/* L3400: */
/*        write(6,3400) */
/*        write(iw,3400) */

/* L3600: */

/*         write(6,3600) sum_appr/sum_true */
/*         write(iw,3600) sum_appr/sum_true */

/* L3800: */

/*         write(6,3800) sum_appr/sum_true-1 */
/*         write(iw,3800) sum_appr/sum_true-1 */
/*         write(6,3400) */
/*         write(iw,3400) */

    rat_nearest_aver__ /= *ntest;

/* L4200: */

/*         write(6,4200) rat_nearest_aver */
/*         write(iw,4200) rat_nearest_aver */

/* L4400: */

/*         write(6,4400) rat_nearest_aver-1 */
/*         write(iw,4400) rat_nearest_aver-1 */
/*         write(6,3400) */
/*         write(iw,3400) */

/* L4600: */

/*         write(6,4600) nwrong */
/*         write(iw,4600) nwrong */

/* L4800: */

/*         write(6,4800) nwrong*done/ntest */
/*         write(iw,4800) nwrong*done/ntest */
/*         write(6,3400) */
/*         write(iw,3400) */


    dnum_belong_average__ = num_belong_tot__ * done / *ntest;

/* L5000: */

/*         write(6,5000) dnum_belong_average */
/*         write(iw,5000) dnum_belong_average */

/*         write(6,3400) */
/*         write(iw,3400) */

/* L5400: */

/*         write(6,5400) lused */
/*         write(iw,5400) lused */

/*         write(6,3400) */
/*         write(iw,3400) */
    d__1 = sum_appr2__ / sum_true2__;
    prin2_("SQ ratio(AVG) = *", &d__1, &c__1);
    d__1 = sum_true2__ / (*ntest * *k);
    prin2_("avg(true_k) = *", &d__1, &c__1);
    d__1 = sum_appr2__ / (*ntest * *k);
    prin2_("avg(appr_k) = *", &d__1, &c__1);
    prinf_("ntest = *", ntest, &c__1);
    prin2_("sum_true_sq = *", &sum_true_sq__, &c__1);
/* ANDREI: **2 */
/*         var_true_k = ((sum_true_sq)/ntest - */
/*     1      (sum_true2/(ntest*k))**2)*ntest/(ntest-1) */

/*         var_appr_k = ((sum_appr_sq)/ntest - */
/*     1      (sum_appr2/(ntest*k))**2)*ntest/(ntest-1) */
    var_true_k__ = (sum_true_sq__ / *ntest - sum_true2__ / (*ntest * *k) * (
	    sum_true2__ / (*ntest * *k))) * *ntest / (*ntest - 1);
    var_appr_k__ = (sum_appr_sq__ / *ntest - sum_appr2__ / (*ntest * *k) * (
	    sum_appr2__ / (*ntest * *k))) * *ntest / (*ntest - 1);
    prin2_("var(true_k) = *", &var_true_k__, &c__1);
    prin2_("var(appr_k) = *", &var_appr_k__, &c__1);
    d__1 = sqrt(var_true_k__ / *ntest) * 2;
    prin2_("err(true) = *", &d__1, &c__1);
    d__1 = sqrt(var_appr_k__ / *ntest) * 2;
    prin2_("err(appr) = *", &d__1, &c__1);
    w[1] = sum_true2__ / (*ntest * *k);
    w[2] = sum_appr2__ / (*ntest * *k);
    w[3] = dnum_belong_average__ / *k;
    return 0;
} /* get_stats0__ */


/*       RETURNS THE AMOUNT OF MEMORY (in real words, i.e. 8 bytes) */
/*       REQUIRED BY THE ALGORITHM */

/* Subroutine */ int get_memory_size__(integer *n, integer *m, integer *k, 
	integer *numit, integer *nwords)
{
    /* System generated locals */
    integer i__1, i__2;

    /* Builtin functions */
    double log(doublereal);
    integer pow_ii(integer *, integer *);

    /* Local variables */
    static integer icenters, lcenters, iinboxes, linboxes, lenstore;
    static doublereal d__;
    static integer keep_appr__, keepw_max__, isuspects, lsuspects, iv, iw, lv,
	     inear_nums__, nboxes_max__, lnear_nums__, ibb, lbb, iia, iib, 
	    lia, lib, irs, lrs, iib2, lib2, idists_near__, ldists_near__, 
	    irs2, lrs2, keep;
    static doublereal done;
    static integer ndmax, lused;
    extern /* Subroutine */ int prinf_(char *, integer *, integer *);
    static integer iipts, lipts, iinbox, iboxes, linbox, levmax, iindsv, 
	    lboxes, lindsv, iiwork, liwork, nsteps, inear_suspects__, 
	    lnear_suspects__, nwords1, iiconts, liconts;

/*        call print_on_off(1) */
    done = 1.;
    d__ = log(*n * done / *k) / log(done * 2);
    levmax = (integer) d__;
    prinf_("levmax=*", &levmax, &c__1);
    if (levmax > *m) {
	levmax = *m;
    }
    nsteps = 6;
    nboxes_max__ = pow_ii(&c__2, &levmax) << 1;
    keepw_max__ = *m * 3 * nsteps + *m * 10;
    prinf_("keepw_max=*", &keepw_max__, &c__1);

    lenstore = nboxes_max__ * 10 + levmax + nboxes_max__ + keepw_max__ + 
	    nboxes_max__ * (levmax + 1) + *n + *m + 1000;

/* ANDREI: query */
    lenstore *= *numit;

    iindsv = 100;
    lindsv = *numit + 100;

    iv = iindsv + lindsv;
    lv = lenstore + 1;

    keep = iv + lv;

/*       ANDREI: MEMORY */

    prinf_("iindsv = *", &iindsv, &c__1);
    prinf_("iv = *", &iv, &c__1);
    prinf_("iv+lv = keep = *", &keep, &c__1);

/*        . . . allocate memory */

    iipts = lenstore + 1101;

/*       ANDREI: MEMORY FIX */
/*       iipts might get less than iv+lv */
/*       (if numit > 900) */
/*       in this case w(iipts) overrides w(iv) !!!! */
/*       solution: make it later */


    iipts = keep + 1000;
    lipts = *n + 2;



    prinf_("iipts = *", &iipts, &c__1);

    iib = iipts + lipts;
    lib = (*k << 1) + 2;

    irs = iib + lib;
    lrs = (*k << 1) + 2;

    iib2 = irs + lrs;
    lib2 = (*k << 1) + 2;

    irs2 = iib2 + lib2;
    lrs2 = (*k << 1) + 2;

    iia = irs2 + lrs2;
    lia = (*k << 1) + 2;

    inear_suspects__ = iia + lia;
    lnear_suspects__ = *n * *k + 100;

    idists_near__ = inear_suspects__ + lnear_suspects__;
    ldists_near__ = *n * *k + 100;

    iw = idists_near__ + ldists_near__;

/*       ANDREI: SIZE */
/*       TO PREVENT FALLING FROM INSIDE ALL_ITER */
/*       EVEN IF REDUCE IT BY ONE: STOPPED */

    *nwords = iw + 2001;
    prinf_("nwords = *", nwords, &c__1);

/*       NOW WITH ALL_ITER0 */

    ibb = 1;
    lbb = *m * *n + 100;

/*       EXACTLY TO PREVENT FALLING FROM INSIDE ALL_ITER0 */

    *nwords = *nwords + ibb + lbb;
    prinf_("nwords = *", nwords, &c__1);

/*       CONSTRAINT 1 */

    keep_appr__ = *m * 3 * nsteps + *m * 10;
    nwords1 = *nwords + keep_appr__ + 100 + *m;

/*       CONSTRAINT 2 */

    iboxes = keep_appr__ + 100;
    lboxes = pow_ii(&c__2, &levmax) * 10 + 100;

    iinboxes = iboxes + lboxes;
    linboxes = *n + 10;

    iiconts = iinboxes + linboxes;
    liconts = 1000;

    iiwork = iiconts + liconts;
    liwork = *n * 6 + 200;

    isuspects = iiwork + liwork;
    lsuspects = *n + 10;

    irs = isuspects + lsuspects;
    lrs = *n + 10;

    iinbox = irs + lrs;
    linbox = *k * 10 + 10;

    iia = iinbox + linbox;
    lia = *n + 10;

    inear_nums__ = iia + lia;
    lnear_nums__ = *n + 10;

    icenters = inear_nums__ + lnear_nums__;
    lcenters = (pow_ii(&c__2, &levmax) << 2) + 100;
    prinf_("icenters = *", &icenters, &c__1);
    prinf_("lcenters = *", &lcenters, &c__1);

    ndmax = levmax + 1;
    lused = pow_ii(&c__2, &levmax) * (ndmax + 10) + *n * 7 + *k * 10 + 2000 + 
	    (pow_ii(&c__2, &levmax) << 2) + 100;
    prinf_("lused = *", &lused, &c__1);
/* Computing MAX */
    i__1 = lused, i__2 = icenters + lcenters;
    integer max1 = i__1;
    if (i__2 > i__1) max1=i__2;
    *nwords += max1;
    prinf_("nwords = *", nwords, &c__1);
    //    *nwords = max(*nwords,nwords1);
    if (nwords1 > *nwords) *nwords = nwords1;
    *nwords += *k * 5 * (*k + 1);
    prinf_("nwords = *", nwords, &c__1);
    return 0;
} /* get_memory_size__ */

/* ccccccccccccc */

/*       peter_sort */






/* Subroutine */ int peter_heapsort_inte__(integer *ra, integer *ia, integer *
	n)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__, m;
    extern /* Subroutine */ int peter_heapit_inte__(integer *, integer *, 
	    integer *, integer *);
    static integer ii, jj, ii0;


/*        This subroutine uses the standard heapsort scheme to */
/*        sort an integer array ra. The sort is returned in the */
/*        form of the integer array ia, such that the values */

/*        ra(ia(1)), ra(ia(2)), ra(ia(3)), . . .  ra(ia(n))        (1) */

/*        are in decreasing order. */

/*            Input parameters: */

/*  ra - the array to be sorted */
/*  n - the number of elements in array ra */

/*            Output parameters: */

/*  ia - integer array containing the permutation that sorts ra */
/*        (see (1) above) */


    /* Parameter adjustments */
    --ra;
    --ia;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	ia[i__] = i__;
/* L1200: */
    }

    for (ii = *n; ii >= 2; ii += -2) {

	ii0 = ii / 2;
	peter_heapit_inte__(&ra[1], &ia[1], n, &ii0);
/* L1600: */
    }

/*       . . . sort */

    i__1 = *n - 1;
    for (i__ = 1; i__ <= i__1; ++i__) {

	m = *n - i__ + 1;

	jj = ia[m];
	ia[m] = ia[1];
	ia[1] = jj;

	--m;
	peter_heapit_inte__(&ra[1], &ia[1], &m, &c__1);
/* L2000: */
    }

    return 0;
} /* peter_heapsort_inte__ */






/* Subroutine */ int peter_heapit_inte__(integer *ra, integer *ia, integer *n,
	 integer *ii)
{
    static integer i__, j0, j1, j2, ijk, ison1, ison2;


/*       heapify */

    /* Parameter adjustments */
    --ra;
    --ia;

    /* Function Body */
    i__ = *ii;

    for (ijk = 1; ijk <= 100; ++ijk) {

	ison1 = i__ << 1;
	if (ison1 > *n) {
	    return 0;
	}

	ison2 = (i__ << 1) + 1;
	if (ison2 > *n) {

	    j0 = ia[i__];
	    j1 = ia[ison1];
	    if (ra[j0] >= ra[j1]) {
		return 0;
	    }

	    ia[i__] = j1;
	    ia[ison1] = j0;
	    return 0;
	}

	j0 = ia[i__];
	j1 = ia[ison1];
	j2 = ia[ison2];

	if (ra[j0] >= ra[j1] && ra[j0] >= ra[j2]) {
	    return 0;
	}

	if (ra[j1] >= ra[j2]) {
	    ia[i__] = j1;
	    ia[ison1] = j0;
	    i__ = ison1;
	    goto L1400;
	}

	ia[i__] = j2;
	ia[ison2] = j0;
	i__ = ison2;

L1400:
	;
    }
    return 0;
} /* peter_heapit_inte__ */






/* Subroutine */ int peter_heapsort_rea__(doublereal *ra, integer *ia, 
	integer *n)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    extern /* Subroutine */ int peter_heapit_rea__(doublereal *, integer *, 
	    integer *, integer *);
    static integer i__, m, ii, jj, ii0;


/*        This subroutine uses the standard heapsort scheme to */
/*        sort a real array ra. The sort is returned in the */
/*        form of the integer array ia, such that the values */

/*        ra(ia(1)), ra(ia(2)), ra(ia(3)), . . .  ra(ia(n))        (1) */

/*        are in decreasing order. */

/*            Input parameters: */

/*  ra - the array to be sorted */
/*  n - the number of elements in array ra */

/*            Output parameters: */

/*  ia - integer array containing the permutation that sorts ra */
/*        (see (1) above) */


    /* Parameter adjustments */
    --ra;
    --ia;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	ia[i__] = i__;
/* L1200: */
    }

    for (ii = *n; ii >= 2; ii += -2) {

	ii0 = ii / 2;
	peter_heapit_rea__(&ra[1], &ia[1], n, &ii0);
/* L1600: */
    }

/*       . . . sort */

    i__1 = *n - 1;
    for (i__ = 1; i__ <= i__1; ++i__) {

	m = *n - i__ + 1;

	jj = ia[m];
	ia[m] = ia[1];
	ia[1] = jj;

	--m;
	peter_heapit_rea__(&ra[1], &ia[1], &m, &c__1);
/* L2000: */
    }

    return 0;
} /* peter_heapsort_rea__ */






/* Subroutine */ int peter_heapit_rea__(doublereal *ra, integer *ia, integer *
	n, integer *ii)
{
    static integer i__, j0, j1, j2, ijk, ison1, ison2;


/*       heapify */

    /* Parameter adjustments */
    --ra;
    --ia;

    /* Function Body */
    i__ = *ii;

    for (ijk = 1; ijk <= 100; ++ijk) {

	ison1 = i__ << 1;
	if (ison1 > *n) {
	    return 0;
	}

	ison2 = (i__ << 1) + 1;
	if (ison2 > *n) {

	    j0 = ia[i__];
	    j1 = ia[ison1];
	    if (ra[j0] >= ra[j1]) {
		return 0;
	    }

	    ia[i__] = j1;
	    ia[ison1] = j0;
	    return 0;
	}

	j0 = ia[i__];
	j1 = ia[ison1];
	j2 = ia[ison2];

	if (ra[j0] >= ra[j1] && ra[j0] >= ra[j2]) {
	    return 0;
	}

	if (ra[j1] >= ra[j2]) {
	    ia[i__] = j1;
	    ia[ison1] = j0;
	    i__ = ison1;
	    goto L1400;
	}

	ia[i__] = j2;
	ia[ison2] = j0;
	i__ = ison2;

L1400:
	;
    }
    return 0;
} /* peter_heapit_rea__ */





/* Subroutine */ int peter_heapsort_rea_part__(doublereal *ra, integer *ia, 
	integer *n, integer *k)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    static integer i__, j, m, i2, ii, jj, ii0;
    extern /* Subroutine */ int peter_heapit_rea_decr__(doublereal *, integer 
	    *, integer *, integer *);


/*        This subroutine uses the standard heapsort scheme to */
/*        find and sort the first k smallest elements of the */
/*        user-supplied double precision array ra. The sort is returned */
/*        in the form of the integer array ia, such that the */
/*        values */

/*        ra(ia(1)), ra(ia(2)), ra(ia(3)), . . .  ra(ia(k))        (1) */

/*        are in increasing order, and are the k smallest */
/*        elements of array ra */

/*            Input parameters: */

/*  ra - the array to be sorted */
/*  n - the number of elements in array ra */
/*  k - the first k smallest elements in array ra will be found and */
/*        returned in increasing order */

/*            Output parameters: */

/*  ia - integer array containing the permutation that sorts ra */
/*        (see (1) above). Please note that while only first k */
/*        elements of ia are meaningful, its length has to be at */
/*        least n */


    /* Parameter adjustments */
    --ra;
    --ia;

    /* Function Body */
    i__1 = *n;
    for (i__ = 1; i__ <= i__1; ++i__) {

	ia[i__] = i__;
/* L1200: */
    }

    for (ii = *n; ii >= 2; ii += -2) {

	ii0 = ii / 2;
	peter_heapit_rea_decr__(&ra[1], &ia[1], n, &ii0);
/* L1600: */
    }
/*        call prinf("in phrp, ia = *", ia, k) */

/*       . . . sort */

/* ccc        do 2000 i=1,n-1 */
    i__1 = *k;
    for (i__ = 1; i__ <= i__1; ++i__) {

	m = *n - i__ + 1;

	jj = ia[m];
	ia[m] = ia[1];
	ia[1] = jj;

	--m;
	peter_heapit_rea_decr__(&ra[1], &ia[1], &m, &c__1);
/* L2000: */
    }
/*        call prinf("again in phrp, ia = *", ia, k) */

/*       move the k smallest values to the beginning of the array */

    i__1 = *n / 2;
    for (i__ = 1; i__ <= i__1; ++i__) {

	i2 = *n - i__ + 1;
	j = ia[i2];
	ia[i2] = ia[i__];
	ia[i__] = j;
/* L2200: */
    }
    return 0;
} /* peter_heapsort_rea_part__ */






/* Subroutine */ int peter_heapit_rea_decr__(doublereal *ra, integer *ia, 
	integer *n, integer *ii)
{
    static integer i__, j0, j1, j2, ijk, ison1, ison2;


/*       heapify */

    /* Parameter adjustments */
    --ra;
    --ia;

    /* Function Body */
    i__ = *ii;

    for (ijk = 1; ijk <= 100; ++ijk) {

	ison1 = i__ << 1;
	if (ison1 > *n) {
	    return 0;
	}

	ison2 = (i__ << 1) + 1;
	if (ison2 > *n) {

	    j0 = ia[i__];
	    j1 = ia[ison1];
/* ccc            if(ra(j0) .ge. ra(j1)) return */
	    if (ra[j0] <= ra[j1]) {
		return 0;
	    }

	    ia[i__] = j1;
	    ia[ison1] = j0;
	    return 0;
	}

	j0 = ia[i__];
	j1 = ia[ison1];
	j2 = ia[ison2];

/* ccc        if( (ra(j0) .ge. ra(j1)) .and. (ra(j0) .ge. ra(j2))) return */
	if (ra[j0] <= ra[j1] && ra[j0] <= ra[j2]) {
	    return 0;
	}

/* ccc        if(ra(j1) .ge. ra(j2)) then */
	if (ra[j1] < ra[j2]) {
	    ia[i__] = j1;
	    ia[ison1] = j0;
	    i__ = ison1;
	    goto L1400;
	}

	ia[i__] = j2;
	ia[ison2] = j0;
	i__ = ison2;

L1400:
	;
    }
    return 0;
} /* peter_heapit_rea_decr__ */



integer pow_ii(integer *m, integer *n) {
  integer m0 = *m;
  integer n0 = *n;
  integer res = 1;
  integer k;
  for (k=0; k<n0; k=k+1)
    res=res*m0;
  return res;
}


int cpu_time__(doublereal* t) {
  clock_t t1;
  t1 = clock();
  doublereal tt = (doublereal)(t1)/CLOCKS_PER_SEC;
  *t = tt;
  return 0;
}
