'*******************************************************************
'       ByteScout PDF Extractor SDK
'                                                                   
'       Copyright � 2016 Bytescout, http://www.bytescout.com        
'       ALL RIGHTS RESERVED                                         
'                                                                   
'*******************************************************************

' Load first document
Set document1 = CreateObject("Bytescout.PDFExtractor.TextExtractor")
document1.RegistrationName = "demo"
document1.RegistrationKey = "demo"
document1.LoadDocumentFromFile("..\..\comparison1.pdf")

' Load second  document
Set document2 = CreateObject("Bytescout.PDFExtractor.TextExtractor")
document2.RegistrationName = "demo"
document2.RegistrationKey = "demo"
document2.LoadDocumentFromFile("..\..\comparison2.pdf")

' Compare documents
Set comparer = CreateObject("Bytescout.PDFExtractor.TextComparer")
comparer.RegistrationName = "demo"
comparer.RegistrationKey = "demo"
comparer.Compare document1, document2

' Generate report
comparer.GenerateHtmlReport "report.html" 

' Open output file in default associated application
Set shell = CreateObject("WScript.Shell")
shell.Run "report.html", 1, false

