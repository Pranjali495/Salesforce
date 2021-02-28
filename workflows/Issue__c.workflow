<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Issue_Notify_detector_that_res_note_has_been_updated</fullName>
        <description>ACLRT Issue Notify detector that res note has been updated</description>
        <protected>false</protected>
        <recipients>
            <field>Detected_By__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <recipient>rr-system-login@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Requirements_Manager_Templates/Notify_detector_that_res_note_has_been_updated</template>
    </alerts>
    <alerts>
        <fullName>New_Issue_Notification</fullName>
        <description>ACLRT New Issue Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>rr-system-login@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Requirements_Manager_Templates/New_Issue_Notification</template>
    </alerts>
    <alerts>
        <fullName>emailnoticesenttoassignedtopersonwithlinktotheopenreopenedissue</fullName>
        <description>Email notice sent to assigned to person with link to the open/reopened issue.</description>
        <protected>false</protected>
        <recipients>
            <recipient>rr-system-login@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Assigned_To__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Requirements_Manager_Templates/Issue_Open_or_Reopened</template>
    </alerts>
    <alerts>
        <fullName>emailtoissuedetectedbyuserprovidingnoticeoffixedduplicateorasdesigned</fullName>
        <description>Email to Issue detected by user providing notice of fixed, duplicate or as designed.</description>
        <protected>false</protected>
        <recipients>
            <field>Detected_By__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <recipient>rr-system-login@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Requirements_Manager_Templates/Issue_Fixed_As_Designed_or_Duplicate</template>
    </alerts>
    <fieldUpdates>
        <fullName>incrementversionnumber</fullName>
        <field>Version__c</field>
        <formula>Version__c  + 1</formula>
        <name>Increment Version Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>setcloseddate</fullName>
        <field>Closed_Date__c</field>
        <formula>now()</formula>
        <name>Set Closed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>ACLRT New Issue Notification</fullName>
        <actions>
            <name>New_Issue_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Increment Version Number</fullName>
        <actions>
            <name>incrementversionnumber</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Issue__c.Status__c</field>
            <operation>equals</operation>
            <value>Reopen</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Issue status changed to Fixed or As Designed or Duplicate</fullName>
        <actions>
            <name>emailtoissuedetectedbyuserprovidingnoticeoffixedduplicateorasdesigned</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Issue__c.Status__c</field>
            <operation>equals</operation>
            <value>As Designed,Fixed,Duplicate</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Issue status changed to open or reopen</fullName>
        <actions>
            <name>emailnoticesenttoassignedtopersonwithlinktotheopenreopenedissue</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Issue__c.Status__c</field>
            <operation>equals</operation>
            <value>Reopen,Open</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify detector that res note has been updated</fullName>
        <actions>
            <name>Issue_Notify_detector_that_res_note_has_been_updated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Resolution_Note__c ) &amp;&amp;  (ISPICKVAL( Status__c , &quot;Open&quot;)  || ISPICKVAL( Status__c , &quot;Reopen&quot;) || ISPICKVAL( Status__c , &quot;As Designed&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Closed Date</fullName>
        <actions>
            <name>setcloseddate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Issue__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
