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

    <xsl:variable name="ameliaColl" select="collection('Amelia/?select=*.xml')"/>

    <xsl:template match="/">
        <html>
            <head><title>Amelia's Letters</title></head>
            <body>
                <div id="toc">
                    <h2>Table of Contents</h2>
                    <ul><xsl:apply-templates select="$ameliaColl//body" mode="toc"/></ul>
                    <hr/>
                </div>
                <div id="main"><xsl:apply-templates select="$ameliaColl"/></div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="body" mode="toc">
        <li><xsl:apply-templates select="descendant::label[1]"/></li>
    </xsl:template>

    <xsl:template match="body">
        <h2><xsl:apply-templates select="descendant::label[1]"/></h2>
    </xsl:template>

</xsl:stylesheet>
