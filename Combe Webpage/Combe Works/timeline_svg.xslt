<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/2000/svg"  
    exclude-result-prefixes="xs"
    version="3.0">
    <TEI xmlns="http://www.tei-c.org/ns/1.0"/>
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="ameliaColl" as="document-node()+" select="collection('Modern_Spectator/?select=*.xml')"/>

    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="{$latest * $spacer - $earliest * $spacer + 500" viewBox="0 0 1200 2000">
            <desc>Combe Works Timeline</desc>
            <g class="timeline">
                <xsl:for-each select="$ameliaColl/fileDesc/bibl">
                    <xsl:sort select="date/@when"/>
                </xsl:for-each>
                <xsl:variable name="allDates" select="$ameliaColl//fileDesc/bibl/date/@when"/>
                <xsl:variable name="earliest" select="min(for $i in $allDates return tokenize($i, '-')[1]) ! xs:integer(.)"/>
                <xsl:variable name="latest" select="max(for $i in $allDates return tkenize($i, '-')[1]) ! xs:integer(.)"/>
                <xsl:variable name="spacer" select="100"/>
                <line stroke="red" stroke-width="6" x1="0" x2="0"
            </g>
        </svg>
    </xsl:template>

</xsl:stylesheet>