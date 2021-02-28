<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Opportunity_Product_Billing_Date_Alert</fullName>
        <ccEmails>billing@richrelevance.com</ccEmails>
        <description>Opportunity Product Billing Date Alert</description>
        <protected>false</protected>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_Alert_Templates/SaaS_Opportunity_Billing_Date</template>
    </alerts>
    <fieldUpdates>
        <fullName>Clear_Fair_Value</fullName>
        <field>Finance_Fair_Value__c</field>
        <name>Clear Fair Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Prod_Set_Prod_Category_Text</fullName>
        <description>Sets Product Category text.  Used for fair value calculation.</description>
        <field>ProductCategoryText__c</field>
        <formula>TEXT(Product2.Product_Sub_Category__c)</formula>
        <name>Opportunity Prod: Set Prod Category Text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Prod_Set_Prod_Category_Txt</fullName>
        <field>ProductCategoryText__c</field>
        <formula>TEXT(Product2.Product_Sub_Category__c)</formula>
        <name>Opportunity Prod: Set Prod Category Txt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Product_Set_Prod_Cat_Text</fullName>
        <field>ProductCategoryText__c</field>
        <formula>TEXT(Product2.Product_Sub_Category__c)</formula>
        <name>Opportunity Product Set Prod Cat Text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Product_Set_Prod_Type_Text</fullName>
        <description>Updates the Opportunity Product Type field</description>
        <field>ProductTypeText__c</field>
        <formula>TEXT(Product2.Family)</formula>
        <name>Opportunity Product: Set Prod Type Text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Product_Uncheck_Processed</fullName>
        <field>Processed__c</field>
        <literalValue>0</literalValue>
        <name>Opportunity Product: Uncheck Processed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OpportunityproductSet_Prod_type_text</fullName>
        <field>ProductTypeText__c</field>
        <formula>TEXT(Product2.Family)</formula>
        <name>Opportunity product: Set Prod type text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Oppty_Prod_Set_Prod_Type_Text</fullName>
        <field>ProductTypeText__c</field>
        <formula>TEXT(Product2.Family)</formula>
        <name>Oppty Prod: Set Prod Type Text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Oppty_Prod_Set_Prod_Type_Txt</fullName>
        <field>ProductTypeText__c</field>
        <formula>TEXT(Product2.Family)</formula>
        <name>Oppty Prod Set Prod Type Txt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSE_Set_IsServices_Flag_On_Opp_Products</fullName>
        <field>pse__IsServicesProductLine__c</field>
        <literalValue>1</literalValue>
        <name>PSE Set IsServices Flag On Opp Products</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Prod_Category_text</fullName>
        <field>ProductCategoryText__c</field>
        <formula>TEXT(Product2.Product_Sub_Category__c)</formula>
        <name>Prod Category text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Prod_Type_Text</fullName>
        <field>ProductTypeText__c</field>
        <formula>TEXT(Product2.Family)</formula>
        <name>Prod Type Text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Product_Name</fullName>
        <field>Name__c</field>
        <formula>PricebookEntry.Product2.Name</formula>
        <name>Product Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Opportunity_Approval_Status</fullName>
        <description>This sets the Opportunity Approval Status = null.</description>
        <field>Approval_Status__c</field>
        <name>Opportunity: Set Approval Status to Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>OpportunityId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Opportunity Product%3A Approved%2C Rejected%2C or Recalled Opportunities</fullName>
        <actions>
            <name>Reset_Opportunity_Approval_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Approved,Rejected,Recalled</value>
        </criteriaItems>
        <description>This rule sets the Opportunity Approval status to null when Opportunity Products are created or edited.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Product%3A Cloned Opportunities</fullName>
        <actions>
            <name>Opportunity_Product_Uncheck_Processed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Sets actions to occur when an opportunity is cloned.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Product%3AProduct Type and Prod Category Update</fullName>
        <actions>
            <name>Opportunity_Prod_Set_Prod_Category_Txt</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Oppty_Prod_Set_Prod_Type_Txt</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.CreatedById</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Updates product type and product category</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>OpportunityLineItem.CreatedDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>PSA Set Opportunity Product IsServicesProductLine Flag</fullName>
        <actions>
            <name>PSE_Set_IsServices_Flag_On_Opp_Products</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product2.pse__IsServicesProduct__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>This workflow will look at the product that has been added to the opportunity product line item. If the product is a services product it will check the check box on the opportunity product line item.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Product Name for ACV</fullName>
        <actions>
            <name>Product_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>include product name for ACV roll-up and reporting</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
