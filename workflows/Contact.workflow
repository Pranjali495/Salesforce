<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Email_Opt_Out</fullName>
        <description>Check Contact Email Opt Out</description>
        <field>HasOptedOutOfEmail</field>
        <literalValue>1</literalValue>
        <name>Email Opt Out</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sifdata__Contact_Account_Name_Contact_SD_Company</fullName>
        <field>Sifdata__SD_Company__c</field>
        <formula>Account.Name</formula>
        <name>Contact.Account.Name-&gt;Contact.SD Company</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sifdata__Contact_Title_Contact_SD_Title</fullName>
        <field>Sifdata__SD_Title__c</field>
        <formula>Title</formula>
        <name>Contact.Title -&gt; Contact.SD Title</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Left Company Opt Out</fullName>
        <actions>
            <name>Email_Opt_Out</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Status_at_Account__c</field>
            <operation>equals</operation>
            <value>Left Company</value>
        </criteriaItems>
        <description>When status at account is &quot;Left Company&quot;, email opt out is checked out</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Sifdata__Contact%2ESD_Tracking %3D True</fullName>
        <actions>
            <name>Sifdata__Contact_Account_Name_Contact_SD_Company</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Sifdata__Contact_Title_Contact_SD_Title</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Sifdata__SD_Tracking__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
