global class Accountdeleted implements Database.Batchable<sobject>
{

global final String query;

global Accountdeleted(String q)
{
query=q;
}
 
global Database.QueryLocator start(Database.BatchableContext BC)
{
return Database.getQueryLocator(query);
}
 
global void execute(Database.BatchableContext BC , List<sobject> scope)
    {
List <Account> lstAccount = new list<Account>();
for(Sobject s : scope)
{
 Account a = (Account)s;
a.phone='5555555555555';
lstAccount.add(a);
}
Upsert lstAccount;
}
 global void finish(Database.BatchableContext BC)
{
                //Send an email to the User after your batch completes
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
String[] toAddresses = new String[] {'puneetjha1593@gmail.com'};
mail.setToAddresses(toAddresses);
mail.setSubject('Apex Batch Job is done');
mail.setPlainTextBody('The batch Apex job processed ');
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}}