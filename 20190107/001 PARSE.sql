print CONVERT(date, '18-sep-16')
PRINT PARSE('18-sie-16' AS date USING 'pl-pl')
PRINT TRY_PARSE('18-sty-16' AS date USING 'pl-pl')