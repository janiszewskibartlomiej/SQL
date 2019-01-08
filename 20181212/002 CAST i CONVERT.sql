  print CONVERT(char(4), YEAR(GETDATE())) +'a'
  print TRY_CONVERT(char(4), YEAR(GETDATE())) +'a'
  print CAST(YEAR(GETDATE()) AS char(4)) +'a'
  print TRY_CAST(YEAR(GETDATE()) AS char(4)) +'a'