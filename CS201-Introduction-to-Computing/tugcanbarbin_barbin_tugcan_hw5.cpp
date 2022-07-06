#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <vector>

using namespace std;
bool gettingFiles(string & fileNameGrades, ifstream & gradesinput , string & fileNameStudent, ifstream & studentinput);
int numberOfStudentsAndCreatingVectors(ifstream &studentinput, vector<string> & idler, vector <string> &isimler, vector<string> &soyisim);
bool isThereMiddleName(ifstream &studentinput,int index);
bool CheckTheChangingExam(string linegrade);
void takingQuery (int &query, int sizeOfList);
int main()
{
    string fileNameGrades, fileNameStudent,linegrade,linestudent,currentID;
    ifstream gradesinput, studentinput;
    int countOfStudents;
	double currentGrade;
	struct Student
	{
		string id;
		string name,lastName;
	    double gpa;
	};
	Student stu;
    if (gettingFiles(fileNameGrades,gradesinput, fileNameStudent, studentinput))
		return 0;
    vector <string> idler,isimler,soyisim;
    countOfStudents = numberOfStudentsAndCreatingVectors(studentinput, idler, isimler, soyisim);
	vector <double> GPAler(countOfStudents,0);

	while (getline(gradesinput,linegrade))
    {
        if (linegrade == "***HOMEWORK***")
        {
            getline(gradesinput,linegrade);
            while (linegrade != "")
            {
                istringstream wordGrade(linegrade);
                wordGrade >> currentID;
                wordGrade >> currentGrade;
                for (int n =0 ; n < countOfStudents; n++)
                {
                    if (idler[n] == currentID)
                    {
                        GPAler[n] += (currentGrade/10.0);
                    }
                }
                getline(gradesinput,linegrade);
            }
        }
        if (linegrade == "***MIDTERM***")
        {
            getline(gradesinput,linegrade);
            while (linegrade != "")
            {
                istringstream wordGrade(linegrade);
                wordGrade >> currentID;
                wordGrade >> currentGrade;
                for (int n =0 ; n < countOfStudents; n++)
                {
                    if (idler[n] == currentID)
                    {
                        GPAler[n] += (2*currentGrade/10.0);
                    }
                }
                getline(gradesinput,linegrade);
            }
        }
        if (linegrade == "***FINAL***")
        {
            getline(gradesinput,linegrade);
            while (linegrade != "")
            {
                istringstream wordGrade(linegrade);
                wordGrade >> currentID;
                wordGrade >> currentGrade;
                for (int n =0 ; n < countOfStudents; n++)
                {
                    if (idler[n] == currentID)
                    {
                        GPAler[n] += (3*currentGrade/10.0);
                    }
                }
                getline(gradesinput,linegrade);
            }
        }
    }
	double temp;
	int index;
	string id,ism,soysm;
	double gp;
	vector <string> idlerSorted,isimlerSorted, soyisimSorted;
	vector <double> GPAlerSorted;
	vector <Student> VectorSorted;
	for (int son = 0 ; son < countOfStudents ; son ++ )
	{
		temp = 0;
		for (int asd = 0 ; asd < countOfStudents; asd++)
		{
			if (GPAler[asd] > temp)
			{
				temp = GPAler[asd];
				index = asd;
			}
		}
		id =idler[index];
		ism = isimler[index];
		soysm = soyisim[index];
		gp = GPAler[index];
		idlerSorted.push_back(id);
		isimlerSorted.push_back(ism);
		soyisimSorted.push_back(soysm);
		GPAlerSorted.push_back(gp);
		idler[index]= "000000000";
		isimler[index] = "ZZZZZZZZZZZZ";
		soyisim[index] = "ZZZZZZZZZZZZ";
		GPAler[index] = 0;
	}
	for (int j =0 ; j < countOfStudents ; j++)
	{
		if (GPAlerSorted[j] != 0)
		{
			stu.id = idlerSorted[j];
			stu.name = isimlerSorted[j];
			stu.lastName = soyisimSorted[j];
			stu.gpa = GPAlerSorted[j];
			VectorSorted.push_back(stu);
		}
	}
	int sizeOfList = VectorSorted.size();
	int query = 1 ;
	takingQuery (query, sizeOfList);
	while (query !=0)
	{
		cout<< query << ", " << VectorSorted[query-1].id << ", " << VectorSorted[query-1].name << " " << VectorSorted[query-1].lastName << ", " << VectorSorted[query-1].gpa << endl;
		takingQuery (query,sizeOfList);
		
 	}
	cout << "Exiting..." << endl;

}
bool gettingFiles(string & fileNameGrades, ifstream & gradesinput , string & fileNameStudent, ifstream & studentinput)//dosyalarý açýp eðer açýlamýyorsa mesaj gösterip programý durduruyor
{
	cout << "Please enter a filename for Students Grades Results: ";
	cin >> fileNameGrades;
	gradesinput.open(fileNameGrades.c_str());
	if (gradesinput.fail())
	{
		cout << "Can not find the requested file. Terminating application ..."<< endl ;
		return true;
	}
	cout << "Please enter a filename for Students Names : ";
	cin  >> fileNameStudent;
	studentinput.open(fileNameStudent.c_str());
	if (studentinput.fail())
	{
		cout << "Can not find the requested file. Terminating application ..." << endl;
		return true;
	}
	return false;
}
int numberOfStudentsAndCreatingVectors(ifstream &studentinput, vector<string> & idler, vector <string> &isimler, vector<string> &soyisim)  // dosyadaki öðrenci sayýsýný buluyor.
{
    string SatirSayisi,id,Names;
	int count = 0;
	while(getline(studentinput,SatirSayisi))
	{
		istringstream wordbyword(SatirSayisi);
		wordbyword >> id;
		idler.push_back(id);
    	if (isThereMiddleName(studentinput,count))
		{
			wordbyword >> Names;
			isimler.push_back(Names);
			wordbyword >> Names;
			isimler[count] = isimler[count]+ " " + Names;
			wordbyword >> Names;
			soyisim.push_back(Names);
		}
		else
		{
			wordbyword >> Names;
			isimler.push_back(Names);
			wordbyword >> Names;
			soyisim.push_back(Names);
		}
		count = count+1;
	}
	studentinput.clear();
	studentinput.seekg(0);
	return count;
}
bool isThereMiddleName(ifstream &studentinput,int index)  // dosyadaki öðrenci adýnýn uzunluðunu buluyor.
{
	studentinput.clear();
	studentinput.seekg(0);
	string SatirSayisi,NameWord;
	int count=0, id;
	for (int i =0; i < index; i ++)
	{
		getline(studentinput,SatirSayisi);
	}
	getline(studentinput,SatirSayisi);
	istringstream nameLine(SatirSayisi);
	nameLine >> id;
	while (	nameLine >> NameWord)
    {
			count++;
    }
	if (count == 3)
		return true;
	else
		return false;
}
void takingQuery (int & query, int sizeOfList)
{
	cout << "Enter the rank you want to query (enter 0 to exit): " ;
	cin >> query;
	while ( query < 0 || query > sizeOfList)
	{
		cout << "Rank needs to be greater than 0 and smaller than " << sizeOfList+1 << "!" << endl;
		cout << "Enter the rank you want to query (enter 0 to exit): " ;
		cin  >> query;
	}
}