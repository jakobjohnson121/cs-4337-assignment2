#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main() {
    char input[5]; 
    int total = 0;
    cout << "Enter numbers (type 'done' to stop):" << endl;
    while (true) {
        cin >> input;
        string s = input; 
        if (s == "done") {
            break;
        }
        int number = stoi(s);
        total = total + number;
    }
    int prev = 1;
    ifstream myFile("/tmp/prev_amount.txt");
    if (myFile.is_open()) {
        myFile >> prev;
        myFile.close();
    }
    if (prev == 0) {
        // don't divide by zero
        prev = 1;
    }
    int answer = total / prev;
    if (answer == 0) {
        answer = 1;
    }
    ofstream myOutFile("/tmp/prev_amount.txt");
    myOutFile << answer;
    myOutFile.close();
    cout << "Saved: " << answer << endl;
    return 0;
}