clear;
tic;
prompt = "Give a prime: " ;
    p = input(prompt);
    
while isprime(p) == 0
    fprintf('Invalid input. Give a prime!: \n');
    p = input(prompt);
end

prompt2 = "Give the degree of the polynom: " ;
m = input(prompt2); 
       
for j=0:m
    promptString = sprintf('Please enter the coefficient of x^%d : ', j);  
    input2 = input(promptString);
    s(j+1) = input2;
end
        
syms f(x,y) g(x,y) h1(x)
f(x,y) = x+y;
g(x,y) = x-y;
  
h=sym(zeros(1, m+1));
for k=0:m                          
    h(k+1)= s(k+1)*x^(k); 
end
   
h1(x)=0;
for i=1:length(s) 
    h1(x)= h1(x)+h(i);
end
    
q1=h1(f(x,y));
q2=h1(g(x,y));
syms p1(x,y) p2(x,y)
  
p1(x,y)=(q1+q2)/2;
p2(x,y)=(q1-q2)/(2*y);

while 1 
    promptString2 = sprintf('Please give n between 1 and %d : ', p);
    n = input(promptString2);
    X=jacobi(n,p);  % Legendre symbole calculation
       
    while X ~= -1 
        fprintf('%d is quadratic residue (mod p), choose another n: \n', n);
        n = input(promptString2);
        X=jacobi(n,p); 
    end 
         
    n1=p1(x,sqrt(n));
    n2=p2(x,sqrt(n));
    R=resultant(n1,n2);
    
    if R ~= 0 || mod(R,p) ~= 0
        fprintf('The quadratic non-residue n(=%d) is admissible to f(x)\n ',n);
        break;
    else
        fprintf('\n The quadratic non-residue n(=%d) does NOT admissible to f(x), Choose another n\n \n ',n); 
    end
e   nd   
toc;