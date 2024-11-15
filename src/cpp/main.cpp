#include <iostream>

using namespace std;

extern "C" int factorial(int input);

int main() {
    cout << "Hello World!" << endl;
    cout << factorial(9) << endl; //9! = 362880
    string str;
    getline(cin, str); 
    return 0;
}