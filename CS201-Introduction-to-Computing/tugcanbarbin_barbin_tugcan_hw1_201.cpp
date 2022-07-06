#include <iostream>
using namespace std;

int main()
{
   string Name;

   double PriceOut, TotalOut ;
   int MinOut;
   cout << "Please enter your name: ";
   cin >> Name;
   cout << "\n";
   cout << Name << ", please enter the price for outgoing call per minute: ";
   cin >> PriceOut;
   cout << Name << ", please enter how many minutes you have talked in outgoing calls: ";
   cin >>  MinOut;
   TotalOut = PriceOut*MinOut;
   cout << Name << ", you have spent " << TotalOut <<" TL for outgoing calls you made while you are abroad." << endl << endl;


   double Pricein,Totalin;
   int Minin;

   cout << Name << ", please enter the price for incoming call per minute: ";
   cin >> Pricein;
   cout << Name << ", please enter how many minutes you have talked in incoming calls: ";
   cin >> Minin;
   Totalin = Pricein * Minin;
   cout << Name << ", you have spent " << Totalin <<" TL for incoming calls you made while you are abroad." << endl << endl;



   double Pricemb, AmountGB, Totalint;
   cout << Name << ", please enter the price for internet usage per MB: ";
   cin >> Pricemb;
   cout << Name << ", please enter how many GBs you have used: ";
   cin >> AmountGB;
   Totalint = 1024 * Pricemb * AmountGB;
   cout << Name << ", you have spent " << Totalint <<" TL for the internet while you are abroad." << endl << endl;

   double PriceSMS, TotalSMS;
   int NumSMS;
   cout << Name << ", please enter the price for one SMS: ";
   cin >> PriceSMS;
   cout << Name << ", please enter the number of SMS you have sent: ";
   cin >> NumSMS;
   TotalSMS = NumSMS * PriceSMS;
   cout << Name << ", you have spent " << TotalSMS <<" TL for the SMS while you are abroad." << endl << endl;


   double TOTAL, Tax;

   TOTAL = Totalin + TotalOut + Totalint +TotalSMS;
   Tax = TOTAL*18/100;
   cout << Name << ", total cost for all roaming services is " << TOTAL << " TL." << endl ;
   cout << Name << ", tax is " << Tax << " TL."<< endl;
   cout << Name << ", total roaming bill fee with tax is " << TOTAL + Tax << " TL."<<endl;

   return 0;







}
