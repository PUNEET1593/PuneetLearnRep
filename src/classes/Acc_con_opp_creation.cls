public class Acc_con_opp_creation {
    public Account createAccount(string n)
    {
        Account a=new Account();
        a.Name='n';
        insert a;
        contact c=new contact();
        c.LastName='test Contact';
        c.Phone='987654321';
        c.AccountId=a.Id;
        insert c;
        opportunity o=new opportunity();
        o.Name='Test opportunity';
        o.AccountId=a.Id;
        return a;
    }
}