<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>ReqTrack_Auto_Rank_On_Creation</fullName>
        <field>Rank__c</field>
        <formula>IF( ISNUMBER(RIGHT(Name, 4) ) , VALUE(RIGHT(Name, 4)) * 10, 9999)</formula>
        <name>ReqTrack_Auto_Rank_On_Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>ReqTrack_Auto_Rank_On_Creation</fullName>
        <actions>
            <name>ReqTrack_Auto_Rank_On_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISBLANK( Rank__c )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
