global class CurrencyConversion {
    
    public static Decimal TEST_CONV_RATE = 0.8;
    
    private static Map<String, Decimal> conversionRateMap; 

    public Decimal ccyAmount;
    public String fromCCYCode;
    public String toCCYCode;
    public Date asOfDate;
    public Decimal convCCYAmount;
    
    public CurrencyConversion(Decimal ccyAmount, String fromCCYCode, String toCCYCode, Date asOfDate) {
        this.ccyAmount = ccyAmount;
        this.fromCCYCode = fromCCYCode;
        this.toCCYCode = toCCYCode;
        this.asOfDate = asOfDate;
    }
    
    public static Decimal convertToCorpCurrency(Decimal value, String currencyCode)
    {
        if(value == null)
        {
            return null;
        }
        if(conversionRateMap == null)
        {
            initConversionRateMap();
        }
        if(conversionRateMap.containsKey(currencyCode))
        {
            return value / conversionRateMap.get(currencyCode);
        }
        return value;
    }   

    public static List<CurrencyConversion> convertCurrencyAmounts(List<CurrencyConversion> conversions) {
        
        Set<String> ccyCodes = new Set<String>();
        Date startDate = null;
        Date endDate = null;
        for (CurrencyConversion cc : conversions) {
            if (cc.fromCCYCode != null && cc.fromCCYCode != '' && cc.asOfDate != null) {
                ccyCodes.add(cc.fromCCYCode);
                if (startDate == null) startDate = cc.asOfDate; else if (cc.asOfDate < startDate) startDate = cc.asOfDate;
                if (endDate == null) endDate = cc.asOfDate; else if (cc.asOfDate > endDate) endDate = cc.asOfDate;
            }
        }

        System.debug('retrieving rates for ' + ccyCodes + ' between ' + startDate + ' and ' + endDate);
        List<DatedConversionRate> rates = [SELECT ConversionRate, IsoCode, StartDate
                                             FROM DatedConversionRate
                                            WHERE IsoCode IN :ccyCodes
                                              AND StartDate <= :endDate
                                              AND NextStartDate >= :startDate
                                         ORDER BY StartDate DESC NULLS LAST];
        for (CurrencyConversion cc : conversions) {
            cc.convCCYAmount = cc.ccyAmount; // default
            if (cc.fromCCYCode != null && cc.fromCCYCode != '' && cc.fromCCYCode != 'USD' && cc.asOfDate != null) {
                Decimal convRate = 0.0;
                for (DatedConversionRate rate : rates) {
                    if (rate.IsoCode == cc.fromCCYCode && rate.StartDate <= cc.asOfDate) {
                        convRate = rate.ConversionRate;
                        break;
                    }
                }
                if (Test.isRunningTest()) {
                    convRate = TEST_CONV_RATE;
                }
                if (convRate > 0.0) {
                    cc.convCCYAmount = cc.ccyAmount / convRate;
                }
            }
        }
        return conversions;
    }
    
    public static Decimal convertToLocalCurrency(Decimal value, String currencyCode)
    {
        if(value == null)
        {
            return null;
        }
        if(conversionRateMap == null)
        {
            initConversionRateMap();
        }
        if(conversionRateMap.containsKey(currencyCode))
        {
            return value * conversionRateMap.get(currencyCode);
        }
        return value;
    }

    private static void initConversionRateMap()
    {
        Date today = Date.today();
        conversionRateMap = new Map<String, Decimal>();
        for(DatedConversionRate conversionRate : [select IsoCode, ConversionRate 
                                                  from DatedConversionRate
                                                  where StartDate <= :today and NextStartDate >= :today])
        {
            conversionRateMap.put(conversionRate.IsoCode, conversionRate.ConversionRate);
        }
    }
    
    public static Boolean isAutoConversionEnabled() {
    
        Boolean isEnabled = Test.isRunningTest() ? true : false;
        Currency_Settings__c cs = Currency_Settings__c.getInstance('Default');
        if (cs != null) {
            isEnabled = cs.Enable_Autoconversion__c;
        }
        return isEnabled;
    }
    
    /*
    webService static boolean isExistingOpportunity(Id opportunityId)
    {
        boolean isHascurrencyCode = false;
        List<Opportunity> opps = [select Id,Name from Opportunity where Total_Addressable_Revenue__c > USD2000000 and Id = :opportunityId];
        if(opps.size() > 0)
        {
            isHascurrencyCode = true;
        }
        return isHascurrencyCode;
        
        
        List<Opportunity> opps = [select Id,CurrencyIsoCode,Total_Addressable_Revenue__c from Opportunity where Id = :valueId];
        if(opps.size() == 0)
        {
            return 0.00;
        }
        else
        {
            return convertToCorpCurrency(opps[0].Total_Addressable_Revenue__c,opps[0].CurrencyIsoCode);
        }
        
    }
    */
}