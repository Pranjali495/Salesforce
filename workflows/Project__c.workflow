<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Project_Black_Squad_ELTS_Alert</fullName>
        <ccEmails>jaxelsson@richrelevance.com</ccEmails>
        <description>Project Black Squad ELTS Alert</description>
        <protected>false</protected>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Project_ELTS_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Project_CE_Squad_ELTS_Alert</fullName>
        <ccEmails>schandler@richrelevance.com</ccEmails>
        <description>Project CE Squad ELTS Alert</description>
        <protected>false</protected>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Project_ELTS_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Project_Complete_Alert</fullName>
        <description>Project Complete Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Finance</recipient>
            <type>role</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/SaaS_Opportunity_Project_Complete</template>
    </alerts>
    <alerts>
        <fullName>Project_Green_Squad_ELTS_Alert</fullName>
        <ccEmails>dlewis@richrelevance.com</ccEmails>
        <description>Project Green Squad ELTS Alert</description>
        <protected>false</protected>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Project_ELTS_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Project_Manager_Squad_ELTS_Alert</fullName>
        <description>Project Manager ELTS Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>ssvedevi@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Project_ELTS_Reminder</template>
    </alerts>
    <rules>
        <fullName>Expected Go live Date - Black Squad</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Project__c.Expected_Completion_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Project__c.Project_Status2__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Squad__c</field>
            <operation>contains</operation>
            <value>Black</value>
        </criteriaItems>
        <criteriaItems>
            <field>Project__c.Type__c</field>
            <operation>notEqual</operation>
            <value>Client Excellence</value>
        </criteriaItems>
        <description>Notify EMEA teams when Expected Go live date is about to pass</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Project_Black_Squad_ELTS_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Project__c.Expected_Completion_Date__c</offsetFromField>
            <timeLength>-2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Project_Manager_Squad_ELTS_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Project__c.Expected_Completion_Date__c</offsetFromField>
            <timeLength>-1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Expected Go live Date - CE Squad</fullName>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND (4 or 5)</booleanFilter>
        <criteriaItems>
            <field>Project__c.Expected_Completion_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Project__c.Project_Status2__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Squad__c</field>
            <operation>contains</operation>
            <value>Green,Black</value>
        </criteriaItems>
        <criteriaItems>
            <field>Project__c.Type__c</field>
            <operation>contains</operation>
            <value>Optimization,A/B,Excellence,Retainer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Project__c.Project_Manager__c</field>
            <operation>equals</operation>
            <value>Sarah Chandler</value>
        </criteriaItems>
        <description>Notify CE EMEA teams when Expected Go live date is about to pass</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Project_CE_Squad_ELTS_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Project__c.Expected_Completion_Date__c</offsetFromField>
            <timeLength>-2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Project_Manager_Squad_ELTS_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Project__c.Expected_Completion_Date__c</offsetFromField>
            <timeLength>-1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Expected Go live Date - Green Squad</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Project__c.Expected_Completion_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Project__c.Project_Status2__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Squad__c</field>
            <operation>contains</operation>
            <value>Green</value>
        </criteriaItems>
        <criteriaItems>
            <field>Project__c.Type__c</field>
            <operation>notEqual</operation>
            <value>Client Excellence</value>
        </criteriaItems>
        <description>Notify EMEA teams when Expected Go live date is about to pass</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Project_Green_Squad_ELTS_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Project__c.Expected_Completion_Date__c</offsetFromField>
            <timeLength>-2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Project_Manager_Squad_ELTS_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Project__c.Expected_Completion_Date__c</offsetFromField>
            <timeLength>-1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Project Completion Status</fullName>
        <actions>
            <name>Project_Complete_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Project__c.LTS__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When Project is LTS notify team</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
