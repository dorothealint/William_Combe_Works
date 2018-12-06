<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:variable name="epiColl" select="collection('Modern_Spectator/?select=*.xml')"/>

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="combe.css" />
                <title>Modern Spectator Epigraphs</title>
            </head>
            <body>
                <div class="body-container">
                    <div class="text-container">
                        <div class="content">
                            <div class="epigraphs">
                                <div class="epigraphs-toc">
                                    <p>Table of Contents</p>
                                    <ul>
                                        <xsl:apply-templates select="$epiColl//bibl" mode="toc"/>
                                    </ul>
                                </div>
                                <h1>Analysis of Epigraphs</h1>
                                <ul>
                                    <xsl:apply-templates select="$epiColl//bibl" mode="list"/>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="bibl" mode="toc">
        <li>
            <a href="#ms{descendant::date/@when}"><xsl:apply-templates select="descendant::date/@when"/></a>
        </li>
    </xsl:template>
    <xsl:template match="bibl" mode="list">
        <li>
            <h2 id="ms{descendant::date/@when}">
                <xsl:apply-templates select="title"/>
            </h2>
            <h3>
                <xsl:apply-templates select="date/@when"/>
            </h3>
            <p>
                <xsl:apply-templates select="//descendant::body/epigraph"/>
            </p>
        </li>
    </xsl:template>
    <xsl:template match="l">
        <p><xsl:apply-templates/></p>
    </xsl:template>

</xsl:stylesheet>
