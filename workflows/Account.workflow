<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Account_Owner_Changed</fullName>
        <description>Account Owner Changed</description>
        <protected>false</protected>
        <recipients>
            <recipient>jluong@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rr-system-login@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Account_Owner_Changed</template>
    </alerts>
    <alerts>
        <fullName>Account_has_been_disqualified</fullName>
        <description>Account has been disqualified</description>
        <protected>false</protected>
        <recipients>
            <recipient>rbadarinath@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rr-system-login@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tsantiago@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_Alert_Templates/Account_Relationship_Change_Alert</template>
    </alerts>
    <alerts>
        <fullName>Account_risk_changed_to_red_Americas</fullName>
        <ccEmails>ravi.shankar@manthan.com</ccEmails>
        <description>Account risk changed to red Americas</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>Director_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Director_Client_Services_Americas</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>VP_Sales_Client_Services_Americas</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CompanyGenericTemplates/Account_Health_Red</template>
    </alerts>
    <alerts>
        <fullName>Account_risk_changed_to_red_EMEA</fullName>
        <ccEmails>ravi.shankar@manthan.com</ccEmails>
        <description>Account risk changed to red EMEA</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Director_Client_Services_EMEA</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>VP_Sales_Client_Services_Americas</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>VP_and_General_Manager_EMEA</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CompanyGenericTemplates/Account_Health_Red</template>
    </alerts>
    <alerts>
        <fullName>Blank_Status_and_ACV_greater_than_0</fullName>
        <description>Blank Status and ACV greater than 0</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_Alert_Templates/Account_Status_blank_for_ACV_greater_than_0</template>
    </alerts>
    <alerts>
        <fullName>Contract_Renewal_Notification_30_Days</fullName>
        <description>Contract Renewal Notification - 30 days</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Contract_Renewal_Notification_30_Days</template>
    </alerts>
    <alerts>
        <fullName>Contract_Renewal_Notification_60_days</fullName>
        <description>Contract Renewal Notification - 60 Days</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Contract_Renewal_Notification_60_Days</template>
    </alerts>
    <alerts>
        <fullName>Contract_Renewal_Notification_90_days</fullName>
        <description>Contract Renewal Notification - 90 Days</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Contract_Renewal_Notification_90_Days</template>
    </alerts>
    <alerts>
        <fullName>Renewal_Date_is_Empty_email_account_owner</fullName>
        <description>Renewal Date is Empty - email account owner</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/RenewalDate_Empty</template>
    </alerts>
    <alerts>
        <fullName>Score_Card_URL_Alert</fullName>
        <description>Score Card URL Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Score_Card_URL_Entered</template>
    </alerts>
    <alerts>
        <fullName>Site_Review_URL_Alert</fullName>
        <description>Site Review URL Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Site_Review_URL_Entered</template>
    </alerts>
    <alerts>
        <fullName>Update_Status_for_ACV_greater_than_450K</fullName>
        <description>Update Status for ACV different than 0</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Account_Status_update_for_ACV_different_than_0</template>
    </alerts>
    <fieldUpdates>
        <fullName>Change_to_Customer</fullName>
        <description>Change to Customer after Closed Won.</description>
        <field>Account_Relationship__c</field>
        <literalValue>Customer</literalValue>
        <name>Change to Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Profile_Complete_Date</fullName>
        <field>Profile_Complete_Date__c</field>
        <formula>Today()</formula>
        <name>Populate Profile Complete Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Status_Last_Updated</fullName>
        <description>Updates Date last modified for Status</description>
        <field>Status_Last_Updated__c</field>
        <formula>Today()</formula>
        <name>Populate Status Last Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Profile_Completed_By</fullName>
        <field>Profile_Completed_By__c</field>
        <formula>$User.FirstName &amp;&quot; &quot;&amp; $User.LastName</formula>
        <name>Profile Completed By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Score_Card_URL_Entered</fullName>
        <field>Score_Card_Date__c</field>
        <formula>TODAY()</formula>
        <name>Score Card URL Entered</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Wipe_Profile_Complete_Date</fullName>
        <field>Profile_Complete_Date__c</field>
        <name>Wipe Profile Complete Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Wipe_Profile_Completed_By</fullName>
        <field>Profile_Completed_By__c</field>
        <name>Wipe - Profile Completed By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>ACV greater than 0 and Status Blank</fullName>
        <actions>
            <name>Blank_Status_and_ACV_greater_than_0</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ACV_Amount2__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status_Last_Updated__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Evaluates blank status for Accounts with ACV &gt; 0</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Account Heatlh Red Americas</fullName>
        <actions>
            <name>Account_risk_changed_to_red_Americas</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>4 - Red</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_Region__c</field>
            <operation>contains</operation>
            <value>Americas</value>
        </criteriaItems>
        <description>The account risk status is changed to red.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Account Heatlh Red EMEA</fullName>
        <actions>
            <name>Account_risk_changed_to_red_EMEA</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>4 - Red</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_Region__c</field>
            <operation>contains</operation>
            <value>EMEA</value>
        </criteriaItems>
        <description>The account risk status is changed to red.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Account Red%2FYellow Health Update</fullName>
        <active>true</active>
        <description>Every two weeks if account is yellow or red send alert</description>
        <formula>AND(OR(ISPICKVAL(Status__c , &quot;4 - Red&quot;),ISPICKVAL(Status__c , &quot;3 - Yellow&quot;)), FLOOR( NOW() - LastModifiedDate)&gt;14,NOT(ISCHANGED( Account_Health__c )))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Change to Customer</fullName>
        <actions>
            <name>Change_to_Customer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Closed_Won_New__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <description>Changes Account Relationship to Customer if Closed Won &gt; 0.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Renewal in 90 Days</fullName>
        <active>false</active>
        <description>Evaluates if Renewal Date is 90 Days from now</description>
        <formula>(TODAY() +90)&gt; Contract_Renewal_Date__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Score Card URL Entered</fullName>
        <actions>
            <name>Score_Card_URL_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Score_Card_URL_Entered</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Score_Card__c  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Profile Complete Date</fullName>
        <actions>
            <name>Populate_Profile_Complete_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Profile_Completed_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Evaluates when Profile Complete Field is Checked</description>
        <formula>AND(Profile_Complete__c = True , ISCHANGED( Profile_Complete__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Status for ACV greater than 450K</fullName>
        <actions>
            <name>Update_Status_for_ACV_greater_than_450K</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>System will send monthly notification an create task to update Status for accounts with ACV greater than 450K</description>
        <formula>AND( ACV_Amount2__c &gt;450000, 
Status_Last_Updated__c&lt;= (TODAY() - 30) , 
NOT(ISBLANK(Status_Last_Updated__c)), NOT( OR( ISPICKVAL( Account_Relationship__c , &quot;Terminated Customer&quot;) , ISPICKVAL( Status__c ,  &quot;Termination&quot;) ) ) 
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Status for ACV less than 450K</fullName>
        <actions>
            <name>Update_Status_for_ACV_greater_than_450K</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>System to quarterly notify owner to update status for account with ACV less than 450K</description>
        <formula>AND( 
ACV_Amount2__c &lt;= 450000 , ACV_Amount2__c &gt;0, 
Status_Last_Updated__c&lt;= (TODAY() - 90) , 
NOT(ISBLANK(Status_Last_Updated__c)),  NOT(  OR( ISPICKVAL( Account_Relationship__c , &quot;Terminated Customer&quot;) , ISPICKVAL( Status__c , &quot;Termination&quot;) )
 ) 
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Status%2F Heath Last Modified Date</fullName>
        <actions>
            <name>Populate_Status_Last_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Evaluates when status is changed and sets date of change</description>
        <formula>OR(ISCHANGED(Status__c),ISCHANGED( Account_Health__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Wipe - Update Profile Complete Date</fullName>
        <actions>
            <name>Wipe_Profile_Complete_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Wipe_Profile_Completed_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Evaluates when Profile Complete Field is Unchecked</description>
        <formula>AND(Profile_Complete__c = False , ISCHANGED( Profile_Complete__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
