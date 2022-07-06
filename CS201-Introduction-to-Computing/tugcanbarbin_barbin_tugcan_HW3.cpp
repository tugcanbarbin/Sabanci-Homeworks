#include <iostream>
#include <string>
//  2 sorun var 1.si stringin sonunda n varsa n? yapsan da buluyor ikincisi de search stringinde harf checki çalýþmýyor.
using namespace std;
void search(int firstq,int secondq,string stringSearch, string stringSource);
int searchSecondQ(string stringSearch);
bool checkTotalQuestionMark(string stringSource,string stringSearch);
int searchfirstQ(string stringSearch);
void Entrance();
//void betweenQ(string stringSearch,string stringSource);
int main()
{
	Entrance();
    wrongnumber:
	int count = 0;
    string inputString;
	string which;
	string stringSource = "thislectureisawesome";
	string stringSearch = "lecture";
	changedSearch:
	cout << "Enter your choice and string: ";
	getline(cin,inputString);
	which = inputString.substr(0,1);
	if (which == "1")
	{
		stringSource = inputString.substr(2,inputString.length());
		for (int i = 0; i < stringSource.length();i+=1)
		{
			int indexAt = stringSource.at(i);
			if ('a'> indexAt || indexAt > 'z')
			{
				cout << "Wrong input format! Try again."<< endl << endl;
				goto wrongnumber;
			}
		}
		cout << "Source word has been changed to " << "\"" << stringSource << "\"" << endl << endl;
		count+=1;
		goto changedSearch;
	}
	else if (which == "2" )
	{
		stringSearch = inputString.substr(2,inputString.length());
		for (int i = 0; i < stringSearch.length();i+=1)
		{
			if ( count > 0 && ((96 < stringSearch.at(i) && stringSearch.at(i) < 122) || stringSearch.at(i) == '?')) 
			{
				if(stringSearch.length() <= stringSource.length())
				{
					if (!checkTotalQuestionMark(stringSource,stringSearch))
					{
						cout << "Wrong input format! Try again.\n"<< endl;
						goto changedSearch;
					}
				}
				else
				{
					cout << "Wrong input format! Try again.\n"<< endl;
					goto changedSearch;
				}
			}
			else
			{
				cout << "Wrong input format! Try again.\n"<< endl;
				goto changedSearch;
			}
		}
		int countOfFirstQ= searchfirstQ(stringSearch);
		int countOfLastQ= searchSecondQ(stringSearch);
		//if (countOfFirstQ == 0 && checkTotalQuestionMark(stringSource,stringSearch) )
		//{
		//	betweenQ(stringSearch,stringSource);
		//}
		search(countOfFirstQ,countOfLastQ,stringSearch,stringSource);
		goto changedSearch;
	}
	else if (which == "3")
	{
		cout << "See you!" << endl;
		return 0;
	}
	else
	{
		cout << "Choice can be 1, 2 or 3! Try again.\n"<< endl;
		goto changedSearch;
	}
	return 0;
}
 void Entrance()
{
	cout << "This program searches a search string in a source string with the option of wildcards.\n"<< endl;
	cout << "Example inputs with their meaning in parantheses:" << endl;
    cout << "1 thislectureisawesome (to enter a new source string)" << endl;
	cout << "2 lecture (to enter a new source string)" << endl;
	cout << "2 t?r? (to enter a source string with wildcards)  " << endl;
	cout << "3 (to exit the program)" << endl << endl;
}
 int searchfirstQ(string stringSearch)
{
	int countFirst=0;
	for (int i = 0; i < stringSearch.length(); i+=1)
	{
		if (stringSearch.at(i) == '?')
		{
			countFirst+=1;
		}
		else
			break;
	}
	return countFirst;
 }
 int searchSecondQ(string stringSearch)
{
	int countFirst=0,countSecond=0,countLastQ=0;
	for (int i = 0; i < stringSearch.length(); i+=1)
	{
		if (stringSearch.at(i) == '?' && countSecond==0)
		{
			countFirst+=1;
		}
		else if (stringSearch.at(i)!= '?')
		{
			countSecond++;
		}
		else if (stringSearch.at(i)=='?' && countSecond != 0)
			countLastQ++;
	}
	return countLastQ;
}
void search(int firstq,int secondq,string stringSearch, string stringSource)
{
	string stringSearchAfterQ = stringSearch.substr(firstq,stringSearch.length()-(firstq+secondq));
	int indexOfFindings = stringSource.find(stringSearchAfterQ)-firstq;
	if (indexOfFindings != string::npos)
	{
		string SearchedFindings = stringSource.substr(indexOfFindings,stringSearch.length());
		cout << "For the source word " << "\"" << stringSource << "\"" << " and search word "<< "\"" << stringSearch << "\"" << ",\n";
		cout  << "\"" << SearchedFindings << "\"" << " has been found at index "<< indexOfFindings << endl;
		while (indexOfFindings != string::npos && indexOfFindings >=0)
		{
			indexOfFindings = stringSource.find(stringSearchAfterQ,indexOfFindings+(firstq+1))-firstq;
			if (indexOfFindings >= 0)
			{
				string SearchedFindings = stringSource.substr(indexOfFindings,stringSearch.length());
				if ((indexOfFindings+stringSearch.length()-1) < stringSource.length())
				{
					cout  << "\"" << SearchedFindings << "\"" << " has been found at index " << indexOfFindings << endl;
				}
			}
		}
		cout << endl;
	}
	else
	{
		cout << "For the source word " << "\"" << stringSource << "\"" << " and search word " << "\"" << stringSearch << "\"" << ", no match has been found." << endl << endl;
	}
}
bool checkTotalQuestionMark(string stringSource,string stringSearch)
{
	int ascee,count=0;
	for (int i = 0; i < stringSearch.length();i+=1)
	{
		ascee = stringSearch.at(i);
		if (ascee != '?')
		{
			count+=1;
		}
	}
	if (count<1)
	{
		return false;
	}
	else
		return true;
}
//void betweenQ(string stringSearch,string stringSource)
//{
//	int count = 0;
//	int occurance1 = 0;
//	int occurance = 0;
//	int occurancefirst = 0;
//
//	for (int i =0 ;i<stringSearch.length();i+=1)
//	{
//		if (stringSource.find(stringSearch.at(i),occurancefirst+count) !=-1 || stringSource.find(stringSearch.at(i),occurancefirst+count) != string::npos)
//		{
//			if (stringSearch.at(i) != '?')
//			{
//				 occurancefirst = stringSource.find(stringSearch.at(i));
//			
//				if ((occurancefirst != string::npos || occurancefirst != -1) &&  count == 0 )
//				{
//					occurance1 = occurance1 + occurancefirst;
//					count += 1;
//				}
//				else
//				{
//					cout << "For the source word " << "\"" << stringSource << "\"" << " and search word " << "\"" << stringSearch << "\"" << ", no match has been found." << endl << endl;
//					break;
//				}
//				while (stringSearch.length() > count && (stringSource.find(stringSearch.at(occurance1+count))!= string::npos || stringSource.find(stringSearch.at(occurance1+count))!= -1) )
//				{
//					if (stringSearch.at(occurance1 + count) == '?')
//					{
//						count += 1;
//					}
//					else if (stringSearch.at(occurance1 +count) != '?' && count > 0)
//					{
//				
//						if (stringSource.at(occurancefirst+count) == stringSearch.at(i+count))
//						{
//							count +=1;
//						}				
//						else 
//						{
//							if (occurance == 0)
//							{
//								occurance +=1;
//								cout << "For the source word " << "\"" << stringSource << "\"" << " and search word "<< "\"" << stringSearch << "\"" << ",\n";
//							}
//							cout << "For the source word " << "\"" << stringSource << "\"" << " and search word " << "\"" << stringSearch << "\"" << ", no match has been found." << endl << endl;
//							break;
//						}
//				   
//					}
//					if (stringSearch.length() == count)
//					{
//						cout  << "\"" << stringSource.substr(occurance1,count) << "\"" << " has been found at index " << occurance1 << endl;
//						break;
//					}
//				}
//			}
//		}
//		else
//		{
//			cout << "For the source word " << "\"" << stringSource << "\"" << " and search word " << "\"" << stringSearch << "\"" << ", no match has been found." << endl << endl;
//			break;
//		}
//		//a?a?a
//			
//	}
//}