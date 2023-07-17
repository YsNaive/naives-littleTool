#include <string>
#include <iostream>
#include <cstdlib>
#include <windows.h>
#include <fstream>
#include <vector>
using namespace std;
wstring path();
vector<wstring> getFiles(const wstring& directoryPath, const wstring& extension = L"md");
vector<wstring> getFolders(const wstring& directoryPath);
wstring getFolderName(const wstring& fullPath);
void writeData(wofstream& os, const wstring& folder, const wstring& releatedPath = L"./markdown", int level = -1);

int main(int argc, char* args[]) {
    bool flag = false;
    for (auto f : getFolders(path())) {
        if (getFolderName(f) == L"markdown")
            flag = true;
    }
    if (!flag) {
        cout << "./markdown Not Found.\n";
        system("pause");
        return 0;
    }
    wofstream SUMMARY("SUMMARY.md");
    if (!SUMMARY) {
        cerr << "Error opening file: SUMMARY.md\n";
        return 1;
    }

    SUMMARY << "# Summary\n\n";
    SUMMARY << "* [Introduction](./README.md)\n";
    wcout << "# Summary\n\n" << "* [Introduction](./README.md)\n";
    writeData(SUMMARY, path() + L"/markdown");
    SUMMARY.close();

    cout << "\nSUMMARY.md Generated.\n";
    cout << "0 for EXIT\n";
    cout << "1 for Build\n>";
    string in;
    while (true)
    {
        cin >> in;
        if ((in == "0" || (in == "1")))
            break;
        cout << "Please Input Again:\n>";
    }

    if (in == "0")return 0;

    system("npx honkit build");

    cout << "------------------\n";
    cout << "|  Build Finish  |\n";
    cout << "------------------\n";

    system("pause");
    return 0;
}

wstring path() {
	system("cls");
	wchar_t  buffer[MAX_PATH];
	GetModuleFileName(NULL, buffer, MAX_PATH);
	wstring currentPath(buffer);
	int found = currentPath.find_last_of('\\');
	return currentPath.substr(0, found);
}

vector<wstring> getFiles(const wstring& directoryPath, const wstring& extension) {
    wstring searchPattern = directoryPath + L"\\*." + extension;

    WIN32_FIND_DATA findFileData;
    HANDLE hFind = FindFirstFile(searchPattern.c_str(), &findFileData);

    vector<wstring> matchingFiles;

    if (hFind == INVALID_HANDLE_VALUE) {
        cerr << "Error finding first file." << endl;
        return matchingFiles;
    }

    do {
        if (!(findFileData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)) {
            wstring fileName = findFileData.cFileName;
            if (fileName.length() >= extension.length() && fileName.substr(fileName.length() - extension.length()) == extension) {
                matchingFiles.push_back(fileName);
            }
        }
    } while (FindNextFile(hFind, &findFileData) != 0);

    FindClose(hFind);

    return matchingFiles;
}

vector<wstring> getFolders(const wstring& directoryPath) {
    vector<wstring> folders;

    wstring searchPath = directoryPath + L"\\*";
    WIN32_FIND_DATAW findData;
    HANDLE hFind = FindFirstFileW(searchPath.c_str(), &findData);

    if (hFind == INVALID_HANDLE_VALUE) {
        return folders;
    }

    do {
        if (findData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
            if (wcscmp(findData.cFileName, L".") != 0 && wcscmp(findData.cFileName, L"..") != 0) {
                wstring folderName = directoryPath + L"\\" + findData.cFileName;
                folders.push_back(folderName);
            }
        }
    } while (FindNextFileW(hFind, &findData) != 0);

    FindClose(hFind);
    return folders;
}

wstring getFolderName(const wstring& fullPath) {
    int found = fullPath.find_last_of('\\');
    return fullPath.substr(found + 1, fullPath.size() - found - 1);
}

void writeData(wofstream& os, const wstring& folder, const wstring& releatedPath, int level) {
    if (level != -1) {
        for (int i = 0; i < level; i++) {
            os << "    ";
            wcout << "    ";
        }
        os << L"- " << getFolderName(folder) << "\n";
        wcout << L"- " << getFolderName(folder) << "\n";
    }
    for (auto md : getFiles(folder)) {
        for (int i = -1; i < level; i++) {
            os << "    ";
            wcout << "    ";
        }
        os << "* [" << md.substr(0,md.size()-3) << "](" << releatedPath << "/" << md << ")" << '\n';
        wcout << "* [" << md.substr(0, md.size() - 3) << "](" << releatedPath << "/" << md << ")" << '\n';
    }

    for (auto dir : getFolders(folder)) {
        writeData(os, dir, releatedPath + L"/" + getFolderName(dir), level + 1);
    }
}