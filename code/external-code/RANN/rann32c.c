#include <math.h>
#include "mex.h"
#include <stdio.h>
#include <stdlib.h>

/* Output Arguments */
#define	Idx	plhs[0]
#define Dis plhs[1]

#if !defined(MAX)
#define	MAX(A, B)	((A) > (B) ? (A) : (B))
#endif

#if !defined(MIN)
#define	MIN(A, B)	((A) < (B) ? (A) : (B))
#endif


void mexFunction( int nlhs, mxArray *plhs[], 
		  int nrhs, const mxArray*prhs[] )
     
{ 
    double *yp; 
    double *a,*dis, *w; 
    int knn, m, n, isuper,numit, istat, nwords, i;
    int* idx;
    int nm = n*m;
    //double *a = (double*)(malloc(sizeof(double)*n*m));
    
    
    if (nrhs !=5) {
        mexErrMsgTxt( "usage [Idx Dis] = rann_32(X,k,numit,isuper,istat)");
        
               
    } 
    if(nlhs != 2){
        mexErrMsgTxt( "usage [Idx Dis] = rann_32(X,k,numit,isuper,istat)");
        
    }
    
    a = mxGetPr(prhs[0]);
    knn =mxGetScalar(prhs[1]);
    numit = mxGetScalar(prhs[2]);
    isuper = mxGetScalar(prhs[3]);
    istat = mxGetScalar(prhs[4]);
    
    m = mxGetM(prhs[0]); 
    n = mxGetN(prhs[0]);
 
    Idx = mxCreateNumericMatrix(knn,n,mxINT32_CLASS, mxREAL);
    if (Idx==NULL) {
        mexErrMsgTxt("Cannot allocate enough memory\n");
        
    }
    
    Dis = mxCreateDoubleMatrix(knn,n, mxREAL);
    if (Dis==NULL) {
        mexErrMsgTxt("Cannot allocate enough memory\n");
        
    }

    
    idx = mxGetData(Idx);
    dis = mxGetPr(Dis);
    
    
    nwords = 0;
    get_rann_memory(n,m,knn,numit, &nwords);
    
    w = (double *)malloc(sizeof(double)*nwords);
    if (w == 0) {
    mexErrMsgTxt("Cannot allocate enough memory\n");
    
    }
     
    rann_all(n,m,a,numit,isuper,istat,idx,dis,knn,w,nwords);
    //tree_test_(&n,&m,a,&numit,&isuper,&istat,idx,dis,&knn,w,&nwords); 
    
      
  label_report_done:

    
    return;
    
}
