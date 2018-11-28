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
                <title>Combe Project| <xsl:value-of select=".//bibl/date/@when"/></title>
                <link rel="stylesheet" href="combe.css" />
            </head>
            <body>
                <!-- SSI line below -->
                <!--#include virtual="top.html" -->
                <!-- SSI line below -->
                <!--#include virtual="spectatorLinks.html" -->
                <div class="body-container">
                    <div class="text-container">
                        <div class="content">
                            <h1><xsl:value-of select=".//bibl/title"/></h1>
                            <h2><xsl:value-of select=".//bibl/date/@when"/><xsl:text> :</xsl:text><xsl:value-of select=".//bibl/biblScope"/></h2>
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
        <div class="signature">
            <p><xsl:apply-templates/></p>
        </div>
    </xsl:template>
    <xsl:template match="closer">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="l">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="bibl">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
</xsl:stylesheet>