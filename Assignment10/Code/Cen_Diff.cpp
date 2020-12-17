#include <math.h>
#include <iostream>
#include <sys/time.h>
#include <stdlib.h> 
#include <stdio.h> 

using namespace std;

double u_actual(double x)
{
	double temp = 1 - cos(2*M_PI*x);
	temp = temp - 2*(pow(M_PI,2))*(x-1)*x;
	return (temp/8); 

}

double u_xx(double x)
{ 
	return -(pow(M_PI,2))*pow(sin(M_PI*x),2); 

}

double error(int n, double *u, double *u_act)
{

	double sum = 0;

	for (int i = 0; i<n; ++i)
	{
		sum += fabs( u[i] - u_act[i] );
	}
	return sum;
}

int main( )
{ 
	struct timeval start, end;
	srand (time(NULL));


	double b = -2, h, h2,c;
    
    int N_Arr[] = {10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 50000, 100000, 200000,300000, 500000, 1000000,2000000,5000000 };
    int N,MAX = 18;

	for(int j = 0; j<MAX; j++)
	{     
		N = N_Arr[j];


		h = 1/((double)(N+1)); 
        h2 = pow(h,2);

		double *d = new double[N];
		double *u = new double[N];
		double *u_act = new double[N];
        
        gettimeofday(&start,NULL);

		d[0] = h2*u_xx(h)/b;

		for(int i = 1; i<N; ++i)
		{  
            c = - ((double)(i)/(double)(i+1));

			d[i] = (h2*u_xx( (i+1)*h) - d[i-1])/(b - c);

		}

		u[N - 1] = d[N-1];

		for(int i = N - 2; i>= 0; --i)
 			{   
 				c = - ((double)(i+1)/(double)(i+2));
 
				u[i] =  d[i] - c*u[i+1];
			}

			gettimeofday(&end,NULL);

			for(int i = 0; i<N; ++i)
			{
				u_act[i] = u_actual( (i+1)*h); 
			}


			printf("%d, %ld, %.14lf;\n",N, (end.tv_sec - start.tv_sec)*1000000 + end.tv_usec - start.tv_usec,
				                    error(N, u, u_act));      

			delete u_act;
			delete u; 
			delete d;
	}	
		return 0;

}