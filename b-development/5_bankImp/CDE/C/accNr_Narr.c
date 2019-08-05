#include "accNr_Narr.h"

#include <stdio.h>
#include <sys/types.h>
#include <netinet/in.h>

extern FILE *dump_file;

#define convert_arr_htonl(a,i,n) \
  j = i; \
  k = 0; \
  while ( k < n ) { \
    a [ j ] = htonl ( a [ j ] ); \
    j++; \
    k++; \
  }

#define convert_arr_ntohl(a,i,n) \
  j = i; \
  k = 0; \
  while ( k < n ) { \
    a [ j ] = ntohl ( a [ j ] ); \
    j++; \
    k++; \
  }

#define  write_fm(a,b)    fwrite(&a,sizeof(int),b,dump_file)

void
accNr_SAV_NARR()
{
	write_fm(accNr_Narray[1],accNr_NarrP2);
}

void
accNr_SAVN_NARR()
{
        int j, k;
	convert_arr_htonl(accNr_Narray,1,accNr_NarrP2);
	write_fm(accNr_Narray[1],accNr_NarrP2);
	convert_arr_ntohl(accNr_Narray,1,accNr_NarrP2);
}


#define  read_fm(a,b)    fread(&a,sizeof(int),b,dump_file)

void
accNr_RST_NARR()
{
	read_fm(accNr_Narray[1],accNr_NarrP2);
}

void
accNr_RSTN_NARR()
{
        int j, k;
	read_fm(accNr_Narray[1],accNr_NarrP2);
	convert_arr_ntohl(accNr_Narray,1,accNr_NarrP2);
}


void
#ifdef _BT_ANSIC
accNr_SWP_NARR( int ii, int jj )
#else
accNr_SWP_NARR( ii, jj )
int ii, jj;
#endif
{
	int i;
	i=accNr_Narray[ii];
	accNr_Narray[ii]=accNr_Narray[jj];
	accNr_Narray[jj]=i;
}


void
#ifdef _BT_ANSIC
accNr_MAX_IDX_NARR( int *vv, int ii, int jj )
#else
accNr_MAX_IDX_NARR( vv, ii, jj )
int* vv;
int ii, jj;
#endif
{
	int x,t,k;
	x=ii;
	t=0;
	k=ii;
	while( x<=jj ){
		if( accNr_Narray[x]>=t ){
			t=accNr_Narray[x];
			k=x;
		};
		x=x+1;
	};
	*(vv)=k;
}


void
#ifdef _BT_ANSIC
accNr_MIN_IDX_NARR( int *vv, int ii, int jj )
#else
accNr_MIN_IDX_NARR( vv, ii, jj )
int* vv;
int ii, jj;
#endif
{
	int x,t,k;
	x=ii;
	k=ii;
	t=accNr_NarrP1;
	while( x<=jj ){
		if( accNr_Narray[x]<=t ){
			t=accNr_Narray[x];
			k=x;
		};
		x=x+1;
	};
	*(vv)=k;
}


void
#ifdef _BT_ANSIC
accNr_SCH_LO_EQL_NARR( int *bb, int *ii, int jj, int kk, int vv )
#else
accNr_SCH_LO_EQL_NARR( bb, ii, jj, kk, vv )
int *bb;
int *ii;
int jj, kk, vv;
#endif
{
	int r,y;
	r=jj;
	y=kk+1;
	while( y!=r ){
		if( accNr_Narray[r] == vv ){
			y=r;
		} else{
			r=r+1;
		};
	}
	*(bb)=((r!=kk+1)!=0);
	*(ii)=r;
}


void
#ifdef _BT_ANSIC
accNr_SCH_LO_NEQ_NARR( int *bb, int *ii, int jj, int kk, int vv )
#else
accNr_SCH_LO_NEQ_NARR( bb, ii, jj, kk, vv )
int *bb;
int *ii;
int jj, kk, vv;
#endif
{
	int r,y;
	r=jj;
	y=kk+1;
	while( y!=r ){
		if( accNr_Narray[r] != vv ){
			y=r;
		} else{
			r=r+1;
		};
	}
	*(bb)=((r!=kk+1)!=0);
	*(ii)=r;
}


void
#ifdef _BT_ANSIC
accNr_SCH_LO_GEQ_NARR( int *bb, int *ii, int jj, int kk, int vv )
#else
accNr_SCH_LO_GEQ_NARR( bb, ii, jj, kk, vv )
int *bb;
int *ii;
int jj, kk, vv;
#endif
{
	int r,y;
	r=jj;
	y=kk+1;
	while( y!=r ){
		if( accNr_Narray[r] >= vv ){
			y=r;
		} else{
			r=r+1;
		};
	}
	*(bb)=((r!=kk+1)!=0);
	*(ii)=r;
}


void
#ifdef _BT_ANSIC
accNr_SCH_LO_GTR_NARR( int *bb, int *ii, int jj, int kk, int vv )
#else
accNr_SCH_LO_GTR_NARR( bb, ii, jj, kk, vv )
int *bb;
int *ii;
int jj, kk, vv;
#endif
{
	int r,y;
	r=jj;
	y=kk+1;
	while( y!=r ){
		if( accNr_Narray[r] > vv ){
			y=r;
		} else{
			r=r+1;
		};
	}
	*(bb)=((r!=kk+1)!=0);
	*(ii)=r;
}


void
#ifdef _BT_ANSIC
accNr_SCH_LO_LEQ_NARR( int *bb, int *ii, int jj, int kk, int vv )
#else
accNr_SCH_LO_LEQ_NARR( bb, ii, jj, kk, vv )
int *bb;
int *ii;
int jj, kk, vv;
#endif
{
	int r,y;
	r=jj;
	y=kk+1;
	while( y!=r ){
		if( accNr_Narray[r] <= vv ){
			y=r;
		} else{
			r=r+1;
		};
	}
	*(bb)=((r!=kk+1)!=0);
	*(ii)=r;
}


void
#ifdef _BT_ANSIC
accNr_SCH_LO_SMR_NARR( int *bb, int *ii, int jj, int kk, int vv )
#else
accNr_SCH_LO_SMR_NARR( bb, ii, jj, kk, vv )
int *bb;
int *ii;
int jj, kk, vv;
#endif
{
	int r,y;
	r=jj;
	y=kk+1;
	while( y!=r ){
		if( accNr_Narray[r] < vv ){
			y=r;
		} else{
			r=r+1;
		};
	}
	*(bb)=((r!=kk+1)!=0);
	*(ii)=r;
}


void
#ifdef _BT_ANSIC
accNr_SCH_HI_EQL_NARR( int *bb, int *ii, int jj, int kk, int vv )
#else
accNr_SCH_HI_EQL_NARR( bb, ii, jj, kk, vv )
int *bb;
int *ii;
int jj, kk, vv;
#endif
{
	int r,y;
	r=kk;
	y=jj-1;
	while( y!=r ){
		if( accNr_Narray[r] == vv ){
			y=r;
		} else{
			r=r-1;
		};
	}
	*(bb)=((r!=jj-1)!=0);
	*(ii)=r;
}


void
#ifdef _BT_ANSIC
accNr_SCH_HI_NEQ_NARR( int *bb, int *ii, int jj, int kk, int vv )
#else
accNr_SCH_HI_NEQ_NARR( bb, ii, jj, kk, vv )
int *bb;
int *ii;
int jj, kk, vv;
#endif
{
	int r,y;
	r=kk;
	y=jj-1;
	while( y!=r ){
		if( accNr_Narray[r] != vv ){
			y=r;
		} else{
			r=r-1;
		};
	}
	*(bb)=((r!=jj-1)!=0);
	*(ii)=r;
}


void
#ifdef _BT_ANSIC
accNr_SCH_HI_GEQ_NARR( int *bb, int *ii, int jj, int kk, int vv )
#else
accNr_SCH_HI_GEQ_NARR( bb, ii, jj, kk, vv )
int *bb;
int *ii;
int jj, kk, vv;
#endif
{
	int r,y;
	r=kk;
	y=jj-1;
	while( y!=r ){
		if( accNr_Narray[r] >= vv ){
			y=r;
		} else{
			r=r-1;
		};
	}
	*(bb)=((r!=jj-1)!=0);
	*(ii)=r;
}


void
#ifdef _BT_ANSIC
accNr_SCH_HI_GTR_NARR( int *bb, int *ii, int jj, int kk, int vv )
#else
accNr_SCH_HI_GTR_NARR( bb, ii, jj, kk, vv )
int *bb;
int *ii;
int jj, kk, vv;
#endif
{
	int r,y;
	r=kk;
	y=jj-1;
	while( y!=r ){
		if( accNr_Narray[r] > vv ){
			y=r;
		} else{
			r=r-1;
		};
	}
	*(bb)=((r!=jj-1)!=0);
	*(ii)=r;
}


void
#ifdef _BT_ANSIC
accNr_SCH_HI_LEQ_NARR( int *bb, int *ii, int jj, int kk, int vv )
#else
accNr_SCH_HI_LEQ_NARR( bb, ii, jj, kk, vv )
int *bb;
int *ii;
int jj, kk, vv;
#endif
{
	int r,y;
	r=kk;
	y=jj-1;
	while( y!=r ){
		if( accNr_Narray[r] <= vv ){
			y=r;
		} else{
			r=r-1;
		};
	}
	*(bb)=((r!=jj-1)!=0);
	*(ii)=r;
}


void
#ifdef _BT_ANSIC
accNr_SCH_HI_SMR_NARR( int *bb, int *ii, int jj, int kk, int vv )
#else
accNr_SCH_HI_SMR_NARR( bb, ii, jj, kk, vv )
int *bb;
int *ii;
int jj, kk, vv;
#endif
{
	int r,y;
	r=kk;
	y=jj-1;
	while( y!=r ){
		if( accNr_Narray[r] < vv ){
			y=r;
		} else{
			r=r-1;
		};
	}
	*(bb)=((r!=jj-1)!=0);
	*(ii)=r;
}


void
#ifdef _BT_ANSIC
accNr_SRT_ASC_NARR( int ii, int jj )
#else
accNr_SRT_ASC_NARR( ii, jj )
int ii, jj;
#endif
{
	int i,v,b,r;
	i=ii;
	while( i<jj ){
		accNr_VAL_NARR(&v,i+1);
		accNr_SCH_LO_GTR_NARR(&b,&r,ii,i,v);
		if( b==1 ){
			accNr_RHT_NARR(r,i,1);
			accNr_STO_NARR(r,v);
		};
		i=i+1;
	};
}


void
#ifdef _BT_ANSIC
accNr_SRT_DSC_NARR( int ii, int jj )
#else
accNr_SRT_DSC_NARR( ii, jj )
int ii, jj;
#endif
{
	int i,v,b,r;
	i=ii;
	while( i<jj ){
		accNr_VAL_NARR(&v,i+1);
		accNr_SCH_LO_SMR_NARR(&b,&r,ii,i,v);
		if( b==1 ){
			accNr_RHT_NARR(r,i,1);
			accNr_STO_NARR(r,v);
		};
		i=i+1;
	};
}


void
#ifdef _BT_ANSIC
accNr_REV_NARR( int ii, int jj )
#else
accNr_REV_NARR( ii, jj )
int ii, jj;
#endif
{
	int i,j;
	i=ii;
	j=jj;
	while( i<j ){
		accNr_SWP_NARR(i,j);
		i=i+1;
		j=j-1;
	};
}


void
#ifdef _BT_ANSIC
accNr_RHT_NARR( int ii, int jj, int nn )
#else
accNr_RHT_NARR( ii, jj, nn )
int ii, jj, nn;
#endif
{
	int k,n;
	n=jj-ii+1;
	k=0;
	while( k<n ){
		if( jj+nn-k<=accNr_NarrP2 ){
			accNr_Narray[jj+nn-k]=accNr_Narray[jj-k];
		}
		k=k+1;
	};
}


void
#ifdef _BT_ANSIC
accNr_LFT_NARR( int ii, int jj, int nn )
#else
accNr_LFT_NARR( ii, jj, nn )
int ii, jj, nn;
#endif
{
	int k,n;
	n=jj-ii+1;
	k=0;
	while( k<n ){
		if( ii-nn+k>=1 ){
			accNr_Narray[ii-nn+k]=accNr_Narray[ii+k];
		}
		k=k+1;
	};
}

