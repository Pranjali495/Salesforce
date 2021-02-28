<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Oppty_Product_History_Set_Expiration</fullName>
        <description>This sets the expiration date to today + 30.</description>
        <field>ExpirationDate</field>
        <formula>TODAY() + 30</formula>
        <name>Oppty Product History: Set Expiration</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Quote_Status_to_None</fullName>
        <field>Status</field>
        <name>Set Quote Status to None</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Opportunity Product History%3A Number is not null</fullName>
        <actions>
            <name>Oppty_Product_History_Set_Expiration</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Quote.QuoteNumber</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>This rule sets the expiration date to today + 30 for all quotes when they are created.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set Quote Status to None</fullName>
        <actions>
            <name>Set_Quote_Status_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>True</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
