<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Lead_Converted_US_Canada</fullName>
        <description>Lead Converted US Canada</description>
        <protected>false</protected>
        <recipients>
            <recipient>tsantiago@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Lead_Converted</template>
    </alerts>
    <fieldUpdates>
        <fullName>Sifdata__Lead_Company_Lead_SD_Company</fullName>
        <field>Sifdata__SD_Company__c</field>
        <formula>Company</formula>
        <name>Lead.Company -&gt; Lead.SD_Company</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sifdata__Lead_Title_Lead_SD_Title</fullName>
        <field>Sifdata__SD_Title__c</field>
        <formula>Title</formula>
        <name>Lead.Title -&gt; Lead.SD_Title</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Sifdata__Lead%2ESD_Tracking %3D True</fullName>
        <actions>
            <name>Sifdata__Lead_Company_Lead_SD_Company</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Sifdata__Lead_Title_Lead_SD_Title</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Sifdata__SD_Tracking__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
