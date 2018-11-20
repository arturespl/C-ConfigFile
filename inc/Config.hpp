#ifndef CONFIGBASE
#define CONFIGBASE
#include <string>



class ConfigBase
{
	using namespace std;
private:

	int fd = -1;

public:
	ConfigBase(const char * filename);
	~ConfigBase();

	bool save();
	bool load();


	static float parseFloat(string str);
	static float parseInt(string str);
	static float parseBool(strn str);
};

#endif