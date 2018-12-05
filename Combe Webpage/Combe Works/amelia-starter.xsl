<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Amelia's Letters | Number <xsl:value-of select=".//label ! tokenize(., ' ')[last()]"/></title>
                <link rel="stylesheet" href="combe.css" />
            </head>
            <body>
                <xsl:comment> SSI line below </xsl:comment>
                <xsl:comment>#include virtual="top.html" </xsl:comment>
                <xsl:comment> SSI line below </xsl:comment>
                <xsl:comment>#include virtual="ameliaLinks.html" </xsl:comment>
                <xsl:comment> SSI line below</xsl:comment>
                <xsl:comment>#include virtual="alToggleSSI.html" </xsl:comment>
                <div class="body-container">
                    <div class="text-container">
                        <div class="content">
                            <h1>Letter Number <xsl:value-of select=".//label ! tokenize(., ' ')[last()]"/></h1>
                            <xsl:apply-templates/>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="label">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="desc">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="signatures">
        <p><span class="signature"><xsl:apply-templates/></span></p>
    </xsl:template>
    <xsl:template match="closer">
        <p><span class="closer"><xsl:apply-templates/></span></p>
    </xsl:template>
    <xsl:template match="emph">
        <span class="emph"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="l">
        <span class="poem"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>

</xsl:stylesheet>