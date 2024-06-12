#include <iostream>

void* __dso_handle = nullptr;

extern "C" void _entry(int argc, char* argv[]);

void _entry(int argc, char* argv[])
{
    std::cout << "Argc " << argc << "\n";
    for (int i = 0; i < argc; i++) {
        std::cout << "Argv[" << i << "] " << argv[i] << "\n";
    }
}
