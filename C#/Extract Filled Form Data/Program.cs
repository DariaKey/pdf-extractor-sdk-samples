//*******************************************************************
//       ByteScout PDF Extractor SDK		                                     
//                                                                   
//       Copyright © 2016 ByteScout - http://www.bytescout.com       
//       ALL RIGHTS RESERVED                                         
//                                                                   
//*******************************************************************

using System;
using System.Diagnostics;
using System.Xml;
using Bytescout.PDFExtractor;

namespace ExtractFilledFormData
{
	static class Program
	{
		static void Main()
		{
			// Create XMLExtractor instance
			XMLExtractor extractor = new XMLExtractor();
			extractor.RegistrationName = "demo";
			extractor.RegistrationKey = "demo";

			// Load sample PDF document
			extractor.LoadDocumentFromFile("interactiveform.pdf");

			// Get PDF document text as XML
			string xmlText = extractor.GetXML();

			// Load XML
			XmlDocument xmlDocument = new XmlDocument();
			xmlDocument.LoadXml(xmlText);

			// Select all "control" nodes
			XmlNodeList formControls = xmlDocument.SelectNodes("//control");
			if (formControls != null)
			{
				foreach (XmlNode formControl in formControls)
				{
					XmlAttribute typeAttribute = formControl.Attributes["type"];

					// Trace filled textboxes
					if (typeAttribute.Value == "editbox")
					{
						if (!String.IsNullOrEmpty(formControl.InnerText))
							Trace.WriteLine("EDITBOX " + formControl.Attributes["id"].Value + ": " + formControl.InnerText);
					}
					// Trace checked checkboxes
					else if (typeAttribute.Value == "checkbox")
					{
						if (formControl.Attributes["state"].Value == "1")
							Trace.WriteLine("CHECKBOX " + formControl.Attributes["id"].Value + ": " + formControl.Attributes["state"].Value);

					}
				}
			}
		}
	}
}
