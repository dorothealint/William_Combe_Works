<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <!-- drl 2018-12-02 xslt to run over Modern Spectator documents and pull out all signatures of letters to Mr. Spectator -->
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:variable name="spectatorColl" select="collection('Modern_Spectator/?select=*.xml')"/>
    
    <xsl:template match="/">
        <html>
            <head><title>Writers to the Modern Spectator</title>
                <!-- Link to CSS -->
            </head>
            <body>
                <div id="Intro">
                    <p>The column The Modern Spectator is based on an earlier publication, The Spectator which was published in the early 1700s.  William Combe seems to have revived the spirit of that original column with fictional letters from readers embedded in commentary from the Modern Spectator.  Since Combe had a penchant for writing letters in various characters, especially females, we decided to pull a list of all the signatures to see if there are any that are distinctly different from the others.  It will be interesting to see if any are plausible names and eventually do research to see if there were people in existence attached to those names.  Prior to this project, that would have involved going through copies of the Repository, looking up each column, and reading through the column to see if it contained a letter and noting the signature, a time consuming process.</p>
                </div>
                <div id="letterWriters">
                    <ul>
                    <xsl:apply-templates select="$spectatorColl//body"/>
                    </ul>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="body">
        <li><xsl:apply-templates select="descendant::closer/signatures"/></li>
    </xsl:template>

    
</xsl:stylesheet>