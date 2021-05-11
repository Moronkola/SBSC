void main() {

// Write a dart program to check prime number. 

  int n = 17;
    
  int divisorsFound = 0;
  
  for (int divisor = 1; divisor <= n*(1/2); divisor++) {
    if(n % divisor == 0) {
      divisorsFound++;
    }
  }
  if(divisorsFound == 1) {
    print('prime number');
  } else {
      print('not prime number');                     
    } 
}