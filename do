#include<stdio.h>
int main()
{
int nop,a[20],maximum[20][20],avail[20][20],
allocation[15][15],availres[15],seq[15],c[15][15];
int reso,count=0;
int process;
printf("\n Please Enter the number of processes: ");
scanf("%d",&nop);
for(int i=0;i<nop;i++)
{
a[i]=0;
printf("\n Number of Resources: ");
scanf("%d",&reso);
printf("\n Maximum resources: ");
for(int i=0;i<nop;i++)
{
printf("\n For P[%d]: ",i+1);
for(int j=0;j<reso;j++)
{
scanf("%d",&maximum[i][j]);
}
}
printf("\n Allocation: ");
for(int i=0;i<nop;i++)
{
printf("\n P[%d]: ",i+1);
for(int j=0;j<reso;j++)
{
scanf("%d",&allocation[i][j]);
}
}
printf("\n Available Resources: ");
for(int i=0;i<reso;i++)
{
scanf("%d",&availres[i]);
}
for(int i=0;i<nop;i++)
{
for(int j=0;j<reso;j++)
{
avail[i][j]=maximum[i][j]-allocation[i][j];
}
}
do
{
printf("\n\n Process\t\tAllocation\t\tMaximum\n");
for(int i=0;i<nop;i++)
{
printf("P[%d]\t\t",i+1);
for(int j=0;j<reso;j++)
{
printf("%d\t\t",allocation[i][j]);
printf("%d\n",maximum[i][j]);
}
}
process=-1;
for(i=0;i<nop;i++)
{
if(c[i]==0)
{
process=i;
for(int j=0;j<reso;j++)
{
if(availres[j]<avail[i][j])
{
process=-1;
break;
}
}
}
if(process!=-1)
break;
}
if(process!=-1)
{
printf("P[%d] runs successfully",process+1);
seq[i]=process+1;
count++;
for(int j=0;j<reso;j++)
{
availres[j]=availres[j]+allocation[process][j];
allocation[process][j]=0;
maximum[process][j]=0;
c[process][j]=1;
}
}
}
