'*******************************************************************
'       ByteScout PDF Extractor SDK
'                                                                   
'       Copyright © 2016 Bytescout, http://www.bytescout.com        
'       ALL RIGHTS RESERVED                                         
'                                                                   
'*******************************************************************

Imports System.Drawing
Imports Bytescout.PDFExtractor

Namespace FindText
	Class Program
		Friend Shared Sub Main(args As String())

            ' Create Bytescout.PDFExtractor.TextExtractor instance
			Dim extractor As New TextExtractor()
			extractor.RegistrationName = "demo"
			extractor.RegistrationKey = "demo"

			' Load sample PDF document
			extractor.LoadDocumentFromFile("sample2.pdf")

			Dim pageCount As Integer = extractor.GetPageCount()

			' Search each page for some keyword 
			For i As Integer = 0 To pageCount - 1
				If extractor.Find(i, "References", False) Then
					' If page contains the keyword, extract a text from it.
					' For demonstration we'll extract the text from top part of the page only
					extractor.SetExtractionArea(0, 0, 600, 200)
					Dim text As String = extractor.GetTextFromPage(i)
					Console.WriteLine(text)
				End If
			Next

			Console.WriteLine()
			Console.WriteLine("Press any key to continue...")
			Console.ReadLine()
		End Sub
	End Class
End Namespace
