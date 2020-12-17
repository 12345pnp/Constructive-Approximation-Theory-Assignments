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
   
	int N_Arr[] = {100000, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 50000, 100000, 200000, 300000, 500000, 1000000,5000000,10000000 };
	int N,MAX = 1;

	double h,l_i,u_i;

	for(int k = 0; k<MAX; k++)
	{     
		N = N_Arr[k];
		h = 1/((double)(N+1)); 

		double *u = new double[N];
		double *u_act = new double[N];
        double *S = new double[N];
        double *S2 = new double[N];

		gettimeofday(&start,NULL);
        

        S[N - 1] = 0;         

		for (int i = N-1; i>0; --i)
		{   
		  
			l_i = ((double)(i+1) )*h;
			u_i = l_i - 1; 

            S[i - 1] = S[i] + u_i*u_xx(l_i);
            
		}

        S2[0] = 0;
        
        for (int i = 0; i<N - 1; ++i)
		{   
		  
		    l_i = ((double)(i+1) )*h;

            S2[i + 1] = S2[i] +  l_i*u_xx(l_i);
            
		}
		
       for (int i = 0; i<N; ++i)
		{   

			l_i = ((double)(i+1) )*h;
			u_i = l_i - 1; 
            
            u[i] = l_i*u_i*u_xx(l_i) + l_i*S[i] + u_i*S2[i];
            u[i] = u[i]*h;
            u_act[i] = u_actual(l_i);
           printf("%lf, %lf \n",u[i], u_act[i]);

		}

		gettimeofday(&end,NULL);
        


		//printf("%d, %ld, %.14lf;\n",N, (end.tv_sec - start.tv_sec)*1000000 + end.tv_usec - start.tv_usec,
				//error(N, u, u_act)); 

		delete u_act;
		delete u;
        delete S;
        delete S2;

	}


	return 0;
}

