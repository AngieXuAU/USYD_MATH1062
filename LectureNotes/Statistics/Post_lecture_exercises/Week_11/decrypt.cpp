#include <algorithm>
#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>

using namespace std;

// all English characters in decreasing list of frequency
const vector<char> true_order = {'E', 'T', 'A', 'O', 'I', 'N', 'S', 'R', 'H',
                                 'L', 'D', 'C', 'U', 'M', 'F', 'P', 'G', 'W',
                                 'Y', 'B', 'V', 'K', 'X', 'J', 'Q', 'Z'};

int main() {
    unordered_map<char, int> freqs;
    string whole_input = "";
    string line;

    int total_num = 0;
    while (getline(cin, line)) {
        whole_input += line + '\n';
        for (char c : line) {
            freqs[c]++;
            total_num++;
        }
    }

    vector<pair<char, int>> sorted_freqs(freqs.begin(), freqs.end());

    sort(sorted_freqs.begin(), sorted_freqs.end(),
         [](const auto &a, const auto &b) { return a.second > b.second; });

    // cout << whole_input;
    // check output
    for (const auto &[ch, count] : sorted_freqs) {
        double x = static_cast<double>(count) / total_num;
        cout << ch << ": " << x << "\n";
    }

    // construct mapping
    unordered_map<char, char> letter_mappings;
    for (size_t i = 0; i < min(sorted_freqs.size(), true_order.size()); i++) {
        letter_mappings[sorted_freqs[i].first] = true_order[i];
    }

    // check mapping
    cout << "The cipher maps:\n";
    for (const auto &[encoded, decoded] : letter_mappings) {
        cout << decoded << " -> " << encoded << "\n";
    }

    cout << "Result: \n";
    for (char c : whole_input) {
        if (c == '\n') {
            cout << c;
        } else {
            cout << letter_mappings[c];
        }
    }

    return 0;
}