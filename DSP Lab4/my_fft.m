function [ y ] = my_fft( x )                                            
p=nextpow2(length(x));                                                     
x=[x zeros(1,(2^p)-length(x))];                                             
N=length(x);                                                                
Step=log2(N);                                                                  
first=N/2;                                                                   
for i=1:Step;                                                          
    for k=0:(N/(2^(i-1))):(N-1);                                 
        for n=0:(first-1);                                                   
            position=n+k+1;                                                  
            power=(2^(i-1))*n;                                            
            w=exp((-1i)*(2*pi)*power/N);                                      
            a=x(position)+x(position+first);                                           
            b=(x(position)-x(position+first)).*w;                                     
            x(position)=a;                                                      
            x(position+first)=b;                                                  
        end;
    end;
first=first/2;                                                              
end;
y=bitrevorder(x);                                                           
end
