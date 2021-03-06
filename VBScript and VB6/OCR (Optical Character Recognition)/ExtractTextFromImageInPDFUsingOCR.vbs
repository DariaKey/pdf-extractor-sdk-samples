'*******************************************************************
'       ByteScout PDF Extractor SDK
'                                                                   
'       Copyright © 2016 Bytescout, http://www.bytescout.com        
'       ALL RIGHTS RESERVED                                         
'                                                                   
'*******************************************************************

' Create TextExtractor object
Set extractor = CreateObject("Bytescout.PDFExtractor.TextExtractor")
extractor.RegistrationName = "demo"
extractor.RegistrationKey = "demo"

' Load sample PDF document
extractor.LoadDocumentFromFile("..\..\sample_ocr.pdf")


' Enable Optical Character Recognition (OCR)
extractor.OCRMode = 1 ' OCRMode.Auto = 1

' Set the location of "tessdata" folder containing language data files
extractor.OCRLanguageDataFolder = "c:\Program Files\Bytescout PDF Extractor SDK\Redistributable\net2.00\tessdata"
			
' Set OCR language
' "eng" for english, "deu" for German, "fra" for French, "spa" for Spanish etc - according to files in "tessdata" folder.
extractor.OCRLanguage = "eng"  
' Find more language files at https://github.com/tesseract-ocr/tessdata/tree/3.04.00

' Set PDF document rendering resolution
extractor.OCRResolution = 300


' You can also apply various preprocessing filters
' to improve the recognition on low-quality scans.

' Automatically deskew skewed scans
'extractor.OCRImagePreprocessingFilters.AddDeskew()

' Repair broken letters
'extractor.OCRImagePreprocessingFilters.AddDilate()

' Remove vertical or horizontal lines (sometimes helps to avoid OCR engine's page segmentations errors)
'extractor.OCRImagePreprocessingFilters.AddVerticalLinesRemover()
'extractor.OCRImagePreprocessingFilters.AddHorizontalLinesRemover()

' Remove noise
'extractor.OCRImagePreprocessingFilters.AddMedian()

' Apply Gamma Correction	
'extractor.OCRImagePreprocessingFilters.AddGammaCorrection()

	
' Save extracted text to file
extractor.SaveTextToFile("output.txt")

MsgBox "Text was extracted to output.txt"

Set extractor = Nothing

