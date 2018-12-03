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
                <title>Combe Project | Doctor Syntax</title>
                <link rel="stylesheet" href="combe.css" />
                <script type="text/javascript" src="combe.js" xml:space="preserve"></script>
            </head>
            <body>
                <xsl:comment> SSI line below</xsl:comment>
                <xsl:comment>#include virtual="top.html" </xsl:comment>
                <div class="body-container">
                    <div class="text-container">
                        <div class="content">
                            <div class="syntax-toc">
                                <p>Canta</p>
                                <p>Table of Contents</p>
                                <p><a href="#c1">Canta 1</a></p>
                                <p><a href="#c1">Canta 2</a></p>
                                <p><a href="#c1">Canta 3</a></p>
                                <p><a href="#c1">Canta 4</a></p>
                                <p><a href="#c1">Canta 5</a></p>
                            </div>
                            <h1><xsl:value-of select=".//bibl/title"/></h1>
                            <h2><xsl:value-of select=".//bibl/date/@when"/></h2>
                            <xsl:apply-templates/>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="l">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="lg">
        <div class="stanza"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="emph">
        <span class="italic"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="head">
        <p><strong><xsl:apply-templates/></strong></p>
    </xsl:template>
    <xsl:template match="div[@type='speech']">
        <div class="speech"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="div[@type='canto']">
        <div class="canto">
            <div class="c{//descendant::div[@type]/@n}">
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>