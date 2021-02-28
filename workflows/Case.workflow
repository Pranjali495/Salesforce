<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Case_Alert_Team_Alert_US</fullName>
        <description>New Case Alert - Customer Service Team Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Customer_Service_EMEA</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Technical_Account_Managers</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Customer_Support_Templates/Case_assignment_notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Set_to_Existing_Case</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Existing_Case</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set to Existing Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>CS Support Case Opened</fullName>
        <actions>
            <name>New_Case_Alert_Team_Alert_US</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>Used to notify assignee or queue manager of new cases received.</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Set to Existing Case Record Type</fullName>
        <actions>
            <name>Set_to_Existing_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>New</value>
        </criteriaItems>
        <description>When case Status changes, change record type to Existing Case</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Z_Review%3A Case%3A Response Time Evaluation</fullName>
        <active>false</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Client_Initially_Contacted__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Evaluate if the response time has exceeded SLA requirements</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Email_alert_sent</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Case.CreatedDate</offsetFromField>
            <timeLength>14</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Email_alert_sent</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Case.CreatedDate</offsetFromField>
            <timeLength>20</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Email_alert_sent</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Case.CreatedDate</offsetFromField>
            <timeLength>24</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Email_alert_sent</fullName>
        <assignedToType>role</assignedToType>
        <description>Inactive Rules.  Possible Delete.  Used to log a &quot;History&quot; of alerts sent via a workflow rule</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Email alert sent</subject>
    </tasks>
</Workflow>
