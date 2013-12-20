using System.Collections.Generic;

public class DBConfiguration
{
    private Dictionary<string,string> data;

    DBConfiguration(Dictionary<string,string> hash)
    {
        this.data = hash;
    }

    public static void main(string[] args)
    {

    }

    static DBConfiguration _instance = null;

    public static DBConfiguration Instance()
    {
        if (_instance == null)
            _instance = new DBConfiguration();

        return _instance;
    }

}

DBConfiguration.main()


###

