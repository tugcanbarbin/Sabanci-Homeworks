struct StackNode
{
	int value;
	StackNode *next;
};

class DynIntStack
{
private:
	StackNode *top;

public:
	DynIntStack(void);
	~DynIntStack();
	void push(int);
	void pop(int &);
	bool isEmpty(void);
};