#include <iostream>
#include <string>
#include <sstream>
using namespace std;
int main()
{
	string myKey, myText;
	cout << "*** Welcome to the Simple Data Encryption Application ***" << endl;
	cout << "Please enter the encryption key: ";  ////////////// getting key
	getline(cin,myKey);
	bool got_input = false;
	int keyIndex;
	do ///////////////////// doing loop until user enters ctrl+z and enter
	{
		cout << "Please enter the plaintext to be encrypted: "; 
		if(getline(cin,myText)) // if not ctrl+z
		{
			keyIndex = 0; /////// key index which starts from 0 and uptades itself character by character
			got_input  = true;
			cout << "Ciphertext: " ;
			for(unsigned int i = 0 ; i < myText.length();i++)
			{

				//cout <<"my first character " << myText[i] <<" hexi = " << hex <<(int) myText[i] << " "  ;

				unsigned char temp = myText[i];  // temp is my unsigned char variable which storage the current char and manipulates it
				unsigned char result = 0x00;     // my result 
				if(myText[i] & 0x01)
					temp = temp | 0x04;
				else
					temp = temp  & 0xfb;//////////////////////
				if(myText[i] & 0x02)//////////////////////////
					temp = temp | 0x01;///////////////////////
				else//////////////////////////////////////////
					temp = temp & 0xfe;///////////////////////
				if(myText[i] & 0x04)//////////////////////////
					temp = temp | 0x08;///////////////////////
				else//////////////////////////////////////////
					temp = temp & 0xf7;///////////////////////
				if(myText[i] & 0x08)//////////////////////////
					temp = temp | 0x02;///////////////////////
				else//////////////////////////////////////////
					temp = temp & 0xfd;///////////////////////
				if(myText[i] & 0x10)//////////////////////////
					temp = temp | 0x40;/////////////////////// These if and elses performs my permutation which is as explained in homework pdf
				else//////////////////////////////////////////
					temp = temp & 0xbf;///////////////////////
				if(myText[i] & 0x20)//////////////////////////
					temp = temp | 0x10;///////////////////////
				else /////////////////////////////////////////
					temp = temp & 0xef;///////////////////////
				if(myText[i] & 0x40)//////////////////////////
					temp = temp | 0x80;///////////////////////
				else//////////////////////////////////////////
					temp = temp & 0x7f;///////////////////////
				if(myText[i] & 0x80)//////////////////////////
					temp = temp | 0x20;///////////////////////
				else//////////////////////////////////////////
					temp = temp & 0xdf;///////////////////////

	//			cout <<"my character  after permutation" << temp <<" hexi = " << hex <<(int) temp << " " << endl ;
    //			cout <<"my key character " << myKey[keyIndex] <<" hexi = " << hex <<(int) myKey[keyIndex] << " "  ;
	//			myText[i] = temp ^ myKey[keyIndex];
    //			cout <<"after xor my mytex[i] " <<  myText[i] <<" hexi = " << hex <<(int)  myText[i] << " " << endl ;


				result  = temp ^ myKey[keyIndex];
				cout << hex <<(int) result; ///////////////////////// print out the result
				if(keyIndex ==(myKey.length()-1))/////////// if my key index is at the end of the string then make it 0 
					keyIndex = 0;
				else
					keyIndex ++; /////////////////////////////otherwise uptade
			}
			cout << "\n\n" ;
		}
		else
			got_input = false; /////////// if there is no input

	}while(got_input);  ///////////////// stop the execution of do while
	return 0;
}