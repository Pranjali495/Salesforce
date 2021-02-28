<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>APAC_Oppty_Closed_Alert</fullName>
        <description>APAC Opportunity Closed - Send Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Director_Client_Services_EMEA</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_Alert_Templates/SaaS_Opportunity_Dependency</template>
    </alerts>
    <alerts>
        <fullName>Americas_Deal_is_Closed_Won</fullName>
        <description>Americas Deal is Closed Won</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
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
        <template>Email_Alert_Templates/SaaS_Opportunity_Dependency</template>
    </alerts>
    <alerts>
        <fullName>CE_Project_Opportunity_Alert</fullName>
        <description>CE Project Opportunity Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_Client_Services_EMEA</recipient>
            <type>role</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/SaaS_Opportunity_CE_Projects</template>
    </alerts>
    <alerts>
        <fullName>Close_Date_in_the_Past_Email_Opp_Owner</fullName>
        <description>Close Date in the Past - Email Opportunity Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Close_Date_in_Past</template>
    </alerts>
    <alerts>
        <fullName>Close_Date_in_the_Past_Email_Opportunity_Ownerc</fullName>
        <description>Close Date in the Past - Email Opportunity Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Close_Date_in_Past</template>
    </alerts>
    <alerts>
        <fullName>Closed_Lost_Oppty_Alert</fullName>
        <description>Closed Lost Oppty Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Chief_Marketing_Officer</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>rbadarinath@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rmiller@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sjarugula@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>CompanyGenericTemplates/Lost_Oppty_Alert</template>
    </alerts>
    <alerts>
        <fullName>Closed_Won_Deal_Alert_Finance</fullName>
        <ccEmails>billing@richrelevance.com</ccEmails>
        <description>Closed Won Deal Alert - Finance</description>
        <protected>false</protected>
        <recipients>
            <recipient>FP_A_Manager</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_Alert_Templates/SaaS_Opportunity_Dependency</template>
    </alerts>
    <alerts>
        <fullName>Finance_Check_Complete</fullName>
        <description>Finance Check Complete</description>
        <protected>false</protected>
        <recipients>
            <field>CS_Director__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Finance_Check_Complete</template>
    </alerts>
    <alerts>
        <fullName>Open_Oppty_Past_Due</fullName>
        <description>Open Oppty Past Due</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Oppty_Closed_Date_Past_Due</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_100</fullName>
        <description>Opportunity 100%</description>
        <protected>false</protected>
        <recipients>
            <recipient>zkoekemoer@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_Alert_Templates/SaaS_Opportunity_100</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Approval_Alert</fullName>
        <description>Opportunity Approval Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Opportunity_Approved</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Approval_Submit_Request</fullName>
        <description>Opportunity Approval Submit Request</description>
        <protected>false</protected>
        <recipients>
            <field>CS_Director__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_Alert_Templates/Opportunity_Approval_Submit_Approval</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Close_Date_set_at_a_future_month</fullName>
        <description>Opportunity Close Date set at a future month.</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>FP_A_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Finance</recipient>
            <type>role</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Close_Date_is_in_Future</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Rejection_Alert</fullName>
        <description>Opportunity Rejection Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Opportunity_Rejected</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_with_Dependency</fullName>
        <description>EMEA Opportunity Closed - Send Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Director_Client_Services_EMEA</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>mevans@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_Alert_Templates/SaaS_Opportunity_Dependency</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_with_Dependency_US</fullName>
        <ccEmails>billing@richrelevance.com</ccEmails>
        <description>Z_Review: Opportunity with Dependencies - US</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>mevans@richrelevance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_Alert_Templates/SaaS_Opportunity_Dependency</template>
    </alerts>
    <alerts>
        <fullName>Pricing_Date_Alert</fullName>
        <ccEmails>billing@richrelevance.com</ccEmails>
        <description>Pricing Date Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>FP_A_Manager</recipient>
            <type>role</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Pricing_Date_Alert</template>
    </alerts>
    <alerts>
        <fullName>Update_Close_Date</fullName>
        <description>Update Close Date</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Close_Date_in_Past</template>
    </alerts>
    <alerts>
        <fullName>Update_Close_Date2</fullName>
        <description>Update Close Date</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Close_Date_in_Past</template>
    </alerts>
    <alerts>
        <fullName>Update_Close_Date3</fullName>
        <description>Update Close Date</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Close_Date_in_Past</template>
    </alerts>
    <alerts>
        <fullName>email_oppty_close_date</fullName>
        <description>Close Date in the Past - Email Opportunity Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/Close_Date_in_Past</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approval_Status_Pending_Approval</fullName>
        <description>Sets approval status to pending approval.</description>
        <field>Approval_Status__c</field>
        <literalValue>Pending Approval</literalValue>
        <name>Approval Status Pending Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Legal_Status</fullName>
        <field>Legal_Status_del__c</field>
        <name>Clear Legal Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Close_DAte_Workflow_to_False3</fullName>
        <field>Workflow_Close_Date__c</field>
        <literalValue>0</literalValue>
        <name>Close Date Workflow to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Close_Date_Workflow_to_False</fullName>
        <field>Workflow_Close_Date__c</field>
        <literalValue>0</literalValue>
        <name>Close Date Workflow to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Close_Date_Workflow_to_False2</fullName>
        <field>Workflow_Close_Date__c</field>
        <literalValue>0</literalValue>
        <name>Close Date Workflow to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closed_by_AE</fullName>
        <field>Closed_by_AE__c</field>
        <literalValue>1</literalValue>
        <name>Closed by AE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contract_Effective_Date</fullName>
        <field>Agreement_Start_Date__c</field>
        <formula>Account.Contract_Effective_Date__c</formula>
        <name>Contract Effective Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contract_Renewal_Date</fullName>
        <field>Agreement_End_Date__c</field>
        <formula>Account.Contract_Renewal_Date__c</formula>
        <name>Contract Renewal Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy_Account_Name_to_Oppty_Name</fullName>
        <description>Copies the Account Name and a &quot;-&quot; to the Opportunity Name upon Creation.</description>
        <field>Name</field>
        <formula>Account.Name &amp; &quot; - &quot; &amp; Name</formula>
        <name>Copy Account Name to Oppty Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy_Online_Revenue_Acct_to_Oppty</fullName>
        <description>Copies Online Revenue on the Account Level to the Opportunity upon creation</description>
        <field>Web_Online_Revenue__c</field>
        <formula>Account.Online_Revenue__c</formula>
        <name>Copy Online Revenue Acct to Oppty</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Count_in_ACV_Uncheck</fullName>
        <description>Uncheck Count in ACV field if Oppty Type is = Renewal</description>
        <field>Count_in_ACV__c</field>
        <literalValue>0</literalValue>
        <name>Count in ACV - Uncheck</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Count_in_ACV_Validation_Check</fullName>
        <description>Check Count in ACV field if Oppty Type is &lt;&gt; Renewal</description>
        <field>Count_in_ACV__c</field>
        <literalValue>1</literalValue>
        <name>Count in ACV Validation - Check</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Discover_Surpassed_Date</fullName>
        <description>Update Discover Surpassed Date to Today</description>
        <field>Discover_Surpassed_Date__c</field>
        <formula>TODAY()</formula>
        <name>Discover Surpassed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance_Check_Unchecked</fullName>
        <field>Operations_Check_Complete__c</field>
        <literalValue>0</literalValue>
        <name>Finance Check Unchecked</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Increment_Push_Counter_Field</fullName>
        <description>Increment the Push Counter by 1</description>
        <field>Push_Counter__c</field>
        <formula>IF( 
ISNULL( Push_Counter__c ), 
1, 
Push_Counter__c + 1 
)</formula>
        <name>Increment Push Counter Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Initial_Contract_Term</fullName>
        <field>Initial_Contract_Term__c</field>
        <formula>Account.Initial_Contract_Term__c</formula>
        <name>Initial Contract Term</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Market_Dev_Close_Date_Update</fullName>
        <description>Update Market Dev date to today</description>
        <field>Market_Dev_Close_Date__c</field>
        <formula>TODAY()</formula>
        <name>Market Dev Close Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Approved</fullName>
        <description>Sets Approval Status to Approved.</description>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Opportunity Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Recalled</fullName>
        <description>Sets Approval Status to Recalled.</description>
        <field>Approval_Status__c</field>
        <literalValue>Recalled</literalValue>
        <name>Opportunity Recalled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Rejected</fullName>
        <description>Sets Approval Status to Rejected.</description>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Opportunity Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Approval_Process_False</fullName>
        <field>Approval_Process_Identified__c</field>
        <literalValue>0</literalValue>
        <name>Opportunity: Set Approval Process False1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Approval_Status_to_Null</fullName>
        <field>Approval_Status__c</field>
        <name>Opportunity: Set Approval Status to Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Budget_Approved_False</fullName>
        <field>Budget_Approved__c</field>
        <literalValue>0</literalValue>
        <name>Opportunity: Set Budget Approved False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Business_Case_ROI_False</fullName>
        <field>Business_Case_ROI__c</field>
        <literalValue>0</literalValue>
        <name>Opportunity: Set Business Case ROI False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Close_Date_out_30_days</fullName>
        <field>CloseDate</field>
        <formula>TODAY()+30</formula>
        <name>Opportunity: Set Close Date out 30 days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Close_Plan_Date_Null</fullName>
        <field>Due_Date_1__c</field>
        <name>Opportunity: Set Close Plan Date Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Competitor_Pricing_Null</fullName>
        <field>Competitor_rate_card_available__c</field>
        <name>Opportunity: Set Competitor Pricing Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Contracts_Prepare_False</fullName>
        <field>Contracts_Prepared_and_Delivered__c</field>
        <literalValue>0</literalValue>
        <name>Opportunity: Set Contracts Prepare False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Date_to_Revisit_Null</fullName>
        <field>When_should_we_re_visit_the_opportunity__c</field>
        <name>Opportunity: Set Date to Revisit Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Finance_Check_False</fullName>
        <field>Operations_Check_Complete__c</field>
        <literalValue>0</literalValue>
        <name>Opportunity: Set Finance Check False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Forecasting_Status_Null</fullName>
        <field>Forecasting_Status__c</field>
        <name>Opportunity: Set Forecasting Status Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Main_Differentiato_Null</fullName>
        <field>Differentiator_for_who_won_the_deal__c</field>
        <name>Opportunity: Set Main Differentiato Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Market_Dev_Rep_Null</fullName>
        <field>MDR__c</field>
        <name>Opportunity: Set Market Dev Rep Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Market_Dev_Sur_Null</fullName>
        <field>Market_Dev_Close_Date__c</field>
        <name>Opportunity: Set Market Dev Sur Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Next_Best_Project_Null</fullName>
        <field>Next_Best_Product__c</field>
        <name>Opportunity: Set Next Best Project Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Reason_Won_Lost_Null</fullName>
        <field>Reason_won_or_lost_oppty__c</field>
        <name>Opportunity: Set Reason Won/Lost Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Resource_Requests_False</fullName>
        <field>Create_Resource_Requests__c</field>
        <literalValue>0</literalValue>
        <name>Opportunity: Set Resource Requests False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Risks_Null</fullName>
        <field>Risks__c</field>
        <name>Opportunity: Set Risks Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Signator_Sponsor_Null</fullName>
        <field>Executive_Business_Sponsor_Identified__c</field>
        <name>Opportunity: Set Signator Sponsor Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Stage_to_Lead</fullName>
        <field>StageName</field>
        <literalValue>10% - Lead</literalValue>
        <name>Opportunity: Set Stage to Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Steps_to_Close_False</fullName>
        <field>Steps_to_Close_Confirmed_with_Sponsor__c</field>
        <literalValue>0</literalValue>
        <name>Opportunity: Set Steps to Close False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Steps_to_Close_Out_Null</fullName>
        <field>Steps_to_Close_Outlined__c</field>
        <name>Opportunity: Set Steps to Close Out Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Who_Owned_Budget_Null</fullName>
        <field>Who_owned_the_budget__c</field>
        <name>Opportunity: Set Who Owned Budget Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Set_Wrkflow_CloseDate_False</fullName>
        <field>Workflow_Close_Date__c</field>
        <literalValue>0</literalValue>
        <name>Opportunity: Set Wrkflow CloseDate False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Proposal_Surpassed_Date</fullName>
        <description>Update Proposal Surpassed Date to Today</description>
        <field>Proposal_Surpassed_Date__c</field>
        <formula>TODAY ()</formula>
        <name>Proposal Surpassed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Renewal_Notes</fullName>
        <field>Renewal_Notes__c</field>
        <formula>Account.Renewal_Notes__c</formula>
        <name>Renewal Notes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Renewal_Term</fullName>
        <field>Renewal_Term__c</field>
        <formula>Account.Renewal_Term__c</formula>
        <name>Renewal Term</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Approval_Status</fullName>
        <description>Sets Approval status to null.</description>
        <field>Approval_Status__c</field>
        <name>Opportunity: Set Approval Status to Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Closed_Date_Workflow_to_True</fullName>
        <field>Workflow_Close_Date__c</field>
        <literalValue>1</literalValue>
        <name>Set Closed Date Workflow to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_is_Won_Lost</fullName>
        <description>Use to update Forecasting Status to Won/Lost</description>
        <field>Forecasting_Status__c</field>
        <literalValue>Won/Lost</literalValue>
        <name>Stage is Won-Lost</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Finance_Check_Complete</fullName>
        <field>Operations_Check_Complete__c</field>
        <literalValue>1</literalValue>
        <name>Update Finance Check Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Won_Loss_Analysis_Required</fullName>
        <description>Marks the checkbox for Won Loss Analysis when over 35% so Won/Loss Analysis is required to close the deal.</description>
        <field>Won_Loss_Analysis_Required__c</field>
        <literalValue>1</literalValue>
        <name>Won/Loss Analysis Required</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Close_Date_False</fullName>
        <field>Workflow_Close_Date__c</field>
        <literalValue>0</literalValue>
        <name>Workflow Close Date to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Close_Date_True</fullName>
        <field>Workflow_Close_Date__c</field>
        <literalValue>1</literalValue>
        <name>Workflow Close Date to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Close_Date_is_True</fullName>
        <field>Workflow_Close_Date__c</field>
        <literalValue>1</literalValue>
        <name>Workflow Close Date to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Close_Date_to_True</fullName>
        <field>Workflow_Close_Date__c</field>
        <literalValue>1</literalValue>
        <name>Workflow Close Date to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>100 Percent Closed Won Americas</fullName>
        <actions>
            <name>Americas_Deal_is_Closed_Won</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Opportunity Closed Alert Includes Americas.</description>
        <formula>AND(ISCHANGED(StageName),OR(
 ISPICKVAL(StageName,&quot;100% - Signed&quot;)), Opportunity_Owner_Division__c == &quot;Americas&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>100 Percent Closed Won EMEA</fullName>
        <actions>
            <name>Opportunity_with_Dependency</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Opportunity Closed Alert Includes EMEA.</description>
        <formula>AND(ISCHANGED(StageName),OR(
 ISPICKVAL(StageName,&quot;100% - Signed&quot;)), Opportunity_Owner_Division__c == &quot;EMEA&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>100 Percent Closed Won Finance</fullName>
        <actions>
            <name>Closed_Won_Deal_Alert_Finance</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Opportunity Closed Alert Includes all deals for Finance to alter opportunities as needed.</description>
        <formula>AND(ISCHANGED(StageName),OR(
 ISPICKVAL(StageName,&quot;100% - Signed&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>100 Percent Closed WonAPAC</fullName>
        <actions>
            <name>APAC_Oppty_Closed_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Opportunity Closed Alert Includes APAC.</description>
        <formula>AND(ISCHANGED(StageName),OR(
 ISPICKVAL(StageName,&quot;100% - Signed&quot;)), Opportunity_Owner_Division__c == &quot;APAC&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>100%25 - Signed</fullName>
        <actions>
            <name>Stage_is_Won_Lost</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>100% - Signed</value>
        </criteriaItems>
        <description>For Stage &quot;100% - Signed&quot; forecast status value should be lost/ won</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>100%25 CFO</fullName>
        <actions>
            <name>Opportunity_100</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Alert CFO when hits 100% stage Includes EMEA.</description>
        <formula>AND(ISCHANGED(StageName),OR(Probability == 1.00, ISPICKVAL(StageName,&quot;100% - Signed&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>95%25 Legal</fullName>
        <actions>
            <name>Clear_Legal_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Clear Legal Status when opportunity is 95%+</description>
        <formula>AND(ISCHANGED(StageName),Probability &gt;= 0.95)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Account Name Defaults in Oppty Name for New Opportys</fullName>
        <actions>
            <name>Copy_Account_Name_to_Oppty_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When a new Opportunity is created, the name will have [Account Name -] at the beginning of every opportunity.  This is so that naming conventions are more standard.</description>
        <formula>ISNEW()</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CE Forecast Products</fullName>
        <actions>
            <name>CE_Project_Opportunity_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CE_Projects__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>75% - Verbal Agreement</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_Region__c</field>
            <operation>equals</operation>
            <value>EMEA</value>
        </criteriaItems>
        <description>Notify CE EMEA that an Opportunity with CE projects has reached 75%</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Close Date in Future</fullName>
        <actions>
            <name>Opportunity_Close_Date_set_at_a_future_month</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>100% - Signed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CloseDate</field>
            <operation>greaterThan</operation>
            <value>THIS MONTH</value>
        </criteriaItems>
        <description>Gives email warning to rep and manager about setting Close Date in future month.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Closed Lost Oppty Rule</fullName>
        <actions>
            <name>Closed_Lost_Oppty_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(
   ISCHANGED(StageName),

OR(
 ISPICKVAL(StageName,&quot;0% - Lost Oppty&quot;),
 ISPICKVAL(StageName,&quot;0% - Lost Recycle&quot;)
)


)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Copy Online Revenue Acct to Oppty</fullName>
        <actions>
            <name>Copy_Online_Revenue_Acct_to_Oppty</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.isCloned__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Copy Online Revenue at the Account Level to the Opportunity Level upon creation of the opportunity.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Count in ACV Validation - Check</fullName>
        <actions>
            <name>Count_in_ACV_Validation_Check</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>notEqual</operation>
            <value>Renewal</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Count in ACV Validation - Uncheck</fullName>
        <actions>
            <name>Count_in_ACV_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>Renewal</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Debooking Stages</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>(35%) – Debooking,(50%) – Debooking,(75%) – Debooking,(100%) – Debooking</value>
        </criteriaItems>
        <description>For Stage (35%) Debooking, (50%) Debooking, (75%) Debooking, and (100%) Debooking forecast status value should be lost/ won</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Discover Surpassed Date - SaaS</fullName>
        <actions>
            <name>Discover_Surpassed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>SaaS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Probability</field>
            <operation>greaterOrEqual</operation>
            <value>20</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>(35%) – Debooking,(50%) – Debooking,(75%) – Debooking,(100%) – Debooking</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CloseDate</field>
            <operation>greaterOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Market_Dev_Close_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Update Discover Surpassed Date field once it hits 20% or above</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Finance Check is True</fullName>
        <actions>
            <name>Finance_Check_Complete</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Operations_Check_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New Customer,Upsell,Renewal,Acquired</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Julie</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Market Dev Close Date - SaaS</fullName>
        <actions>
            <name>Market_Dev_Close_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>SaaS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Probability</field>
            <operation>greaterOrEqual</operation>
            <value>35</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>(35%) – Debooking,(50%) – Debooking,(75%) – Debooking,(100%) – Debooking</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CloseDate</field>
            <operation>greaterOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Market_Dev_Close_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Update Market Dev Close Date field once it hits 35% or above</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Open Oppty Closed Date Past Due</fullName>
        <actions>
            <name>Open_Oppty_Past_Due</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CloseDate</field>
            <operation>lessThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Probability</field>
            <operation>lessThan</operation>
            <value>100</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Probability</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Lost - 0%25</fullName>
        <actions>
            <name>Stage_is_Won_Lost</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>0% - Lost Oppty,0% - Lost Recycle</value>
        </criteriaItems>
        <description>For Stage  0% - Lost Oppty,0% - Lost Recycle forecast status value should be lost/ won</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity%3A Approval Status %3D Approved %26 Revenue is Changed</fullName>
        <actions>
            <name>Reset_Approval_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This rule sets Approval Status to null when an approved opportunity is edited.</description>
        <formula>AND( ISPICKVAL(Approval_Status__c,&quot;Approved&quot;), OR( ISCHANGED(NumberOfSites__c), ISCHANGED(In_Store_Revenue__c), ISCHANGED(In_Store_Addressable__c), ISCHANGED(Web_Online_Revenue__c), ISCHANGED(Web_Online_Perc_Addressable__c), ISCHANGED(Mobile_Revenue__c), ISCHANGED(Mobile_Addressable__c), ISCHANGED(Phone_Contact_Center_Revenue__c), ISCHANGED(Phone_Contact_Center_Addressable__c) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity%3A Cloned Opportunities - New</fullName>
        <actions>
            <name>Opportunity_Set_Approval_Process_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Approval_Status_to_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Budget_Approved_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Business_Case_ROI_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Close_Plan_Date_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Competitor_Pricing_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Contracts_Prepare_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Date_to_Revisit_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Market_Dev_Rep_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.isCloned__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sets actions to occur when an opportunity is cloned.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity%3A Cloned Opportunities 2 - New</fullName>
        <actions>
            <name>Opportunity_Set_Finance_Check_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Main_Differentiato_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Next_Best_Project_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Reason_Won_Lost_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Resource_Requests_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Risks_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Signator_Sponsor_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Steps_to_Close_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Steps_to_Close_Out_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Who_Owned_Budget_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.isCloned__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sets actions to occur when an opportunity is cloned.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity%3A Cloned Opportunities 3 - New</fullName>
        <actions>
            <name>Opportunity_Set_Forecasting_Status_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Market_Dev_Sur_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Stage_to_Lead</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Set_Wrkflow_CloseDate_False</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.isCloned__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sets actions to occur when an opportunity is cloned.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity%3A Initial Submission Notification</fullName>
        <actions>
            <name>Opportunity_Approval_Submit_Request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Pending Approval</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty closed by AE</fullName>
        <actions>
            <name>Closed_by_AE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>Upsell,Upsell - 2YRS,Upsell - 3YRS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Probability</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>equals</operation>
            <value>David Lewis,Mike McCall,Caique Severo,Doug Turpel,Henrik Nambord,Robb Miller</value>
        </criteriaItems>
        <description>Evaluate if an Upsell was closed by an AE</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Overwrite Contract Elements</fullName>
        <actions>
            <name>Contract_Effective_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Contract_Renewal_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Initial_Contract_Term</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Renewal_Notes</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Renewal_Term</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Overwrite_Contract_Elements__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When overwrite contract elements is set to true, all Opportunity contract fields inherit the Account&apos;s corresponding field values</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pricing Date</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Pricing_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Alert Finance that Pricing Date is coming up</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Pricing_Date_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.Pricing_Date__c</offsetFromField>
            <timeLength>-1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Proposal Surpassed Date - SaaS</fullName>
        <actions>
            <name>Proposal_Surpassed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>SaaS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Probability</field>
            <operation>greaterOrEqual</operation>
            <value>50</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>(35%) – Debooking,(50%) – Debooking,(75%) – Debooking,(100%) – Debooking</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CloseDate</field>
            <operation>greaterOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Proposal_Surpassed_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Update Proposal Surpassed Date field once it hits 50% or above</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Push Counter</fullName>
        <actions>
            <name>Increment_Push_Counter_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Increment the Push Counter field by 1</description>
        <formula>IF(  CloseDate &gt; PRIORVALUE( CloseDate ),  IF (MONTH(CloseDate) &lt;&gt; MONTH(PRIORVALUE( CloseDate )) ,  TRUE,  FALSE),  FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Won%2FLoss Analysis Reuqired</fullName>
        <actions>
            <name>Won_Loss_Analysis_Required</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Probability</field>
            <operation>greaterOrEqual</operation>
            <value>35</value>
        </criteriaItems>
        <description>Check Won/Loss Analysis Required check box if probability exceeds 35%.  This is used to call the workflow for the Won/Loss Analysis section that is required on closing an opportunity at 0% or 100%</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Z_Review%3A 100 Percent US</fullName>
        <actions>
            <name>Opportunity_with_Dependency_US</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Opportunity Closed Alert  Excludes EMEA (Sara), US only.</description>
        <formula>AND(ISCHANGED(StageName),OR(
ISPICKVAL(StageName,&quot;100% - Signed&quot;)), Opportunity_Owner_Division__c &lt;&gt; &quot;EMEA&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
