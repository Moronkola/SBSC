void main() {

// Given two numbers, return true if the sum of both numbers is less 
//than 100. Otherwise return false.

  bool lessThan100(int x, int y){
    if(x + y <= 100){
        return true;
    }else {
        return false;
    }
  }
    print(lessThan100(22, 15));
    print(lessThan100(83, 34));
    print(lessThan100(3, 77));
  
}