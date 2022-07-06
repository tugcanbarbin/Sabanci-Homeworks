#include <iostream>
#include <string>
using namespace std;


//it is the statement that the material is in coffee or not

bool state(string material);
//takes the result with the parameter of name and coffee
void resulting(string name,string coffee);
bool equality(string x1,string x2);
void first(string x);

int main()
{
    string name;
	cout << "Welcome to Pequod's Coffee! Can you tell me your name?" << endl;
	cin >> name;
    first(name);
    return 0;
}

bool state(string material)
{
    string statement;
    cout << "Does it have " << material << "?" << endl;
    cin >> statement;
    if (statement=="yes")
    {
        return true;
    }
    else
    {
        return false;
    }
}
void resulting(string name,string coffee)
{
    cout << "Your order is ready " <<  name << "! What you want is a"<< coffee <<". Enjoy!"<< endl;
}
bool equality(string x1,string x2)
{
    cout << "Do "<< x1 <<" and " << x2 << " are in equal amounts?"<< endl;
    string last;
    cin >> last ;
    if (last == "no")
    {
        return false;
    }
    else
    {
        return true;
    }
}

void first(string x)
{
    cout << "Dear " << x <<", would you kindly answer our questions, so we can determine the coffee you want.\n";
    if (state("espresso")==false)
    {
        resulting(x," filtered coffee");
    }
    else
    {
        if (state("milk") == true)
        {
            if (state("hot chocolate")==true)
            {
                resulting(x, " mocha");
            }
            else
            {
                if (state("foam")==false)
                {
                    resulting(x," cafe au lait");
                }
                else
                {
                    if (equality("foam", "milk")==true)
                    {
                        resulting(x," cappucino");
                    }
                    else
                    {
                        resulting(x," latte");
                    }
                }
            }
        }
        else
        {
            if (state("water")==true)
            {
                resulting(x,"n americano");
            }
            else
            {
                resulting(x,"n espresso");
            }
        }
    }
}

