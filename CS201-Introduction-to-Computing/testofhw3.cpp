#include <iostream>
#include <string>
using namespace std;

int main()
{
	int firstq = 1, secondq= 0;
	string stringSearch="?a",stringSource="sananelansananelan";
    string stringSearchAfterQ = stringSearch.substr(firstq,stringSearch.length()-(firstq+secondq));
	int indexOfFindings = stringSource.find(stringSearchAfterQ)-firstq;
	if (indexOfFindings != string::npos)
	{
		string SearchedFindings = stringSource.substr(indexOfFindings,stringSearch.length());
		cout << "For the source word " << "\"" << stringSource << "\"" << "and search word "<< "\"" << stringSearch << "\"" << ",\n";
		cout  << "\"" << SearchedFindings << "\"" << " has been found at index" << "\"" << indexOfFindings << "\"" << endl;
		while (indexOfFindings != string::npos)
		{
			indexOfFindings = stringSource.find(stringSearchAfterQ,indexOfFindings+(firstq+1))-firstq;
			if (indexOfFindings >= 0)
			{
				string SearchedFindings = stringSource.substr(indexOfFindings,stringSearch.length());
				cout  << "\"" << SearchedFindings << "\"" << " has been found at index" << "\"" << indexOfFindings << "\"" << endl;
			}
		}
	}
	else
	{
		cout << "For the source word " << "\"" << stringSource << "\"" << " and search word " << "\"" << stringSearch << "\"" << ", no match has been found." << endl << endl;
	}
	return 0;


}
