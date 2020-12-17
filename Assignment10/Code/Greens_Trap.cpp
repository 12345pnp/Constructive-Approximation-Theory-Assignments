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

double G(double x, double y)
{
	if(y <= x)
		return y*(x-1);
	else
		return x*(y-1);
}

double trap(int N, double *f)
{
    double h = 1/((double)(N+1)); 
	double sum = 0;

	for (int i = 0; i<N; ++i)
	{
		sum += f[i];

	}

	return h*sum; 

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

	int N_Arr[] = {10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 50000, 100000, 200000, 300000, 500000, 1000000,5000000,10000000 };
	int N,MAX = 10;

	double h,x_i,x_j;

	for(int k = 0; k<MAX; k++)
	{     
		N = N_Arr[k];
		h = 1/((double)(N+1)); 

		double *u = new double[N];
		double *u_act = new double[N];

		gettimeofday(&start,NULL);

		for (int i = 0; i<N; ++i)
		{   
			x_i = ((double)(i+1) )*h;

            

			double *Gf = new double[N];

			for (int j = 0; j<N; ++j)
				{   
					x_j = ((double)(j+1) )*h;

					Gf[j] = G(x_i,x_j)*u_xx(x_j);
				}

			u[i] = trap(N, Gf);
            u_act[i] = u_actual(x_i);
			

			delete Gf;
		}

		gettimeofday(&end,NULL);
        
      
		printf("%d, %ld, %.14lf;\n",N, (end.tv_sec - start.tv_sec)*1000000 + end.tv_usec - start.tv_usec,
				error(N, u, u_act)); 

		delete u_act;
		delete u;

	}


	return 0;
}

