<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/2000/svg"  
    exclude-result-prefixes="xs"
    version="3.0">
    
    <!-- drl 2018-11-26  A timeline on our project is possible even with the small collection of works
    we put up this semester.  The timeline would reach into the date of the bibl in the fileDesc
    because that is where I have put the publication date.  Eventually, this timeline would show
    the timeline of all the works over Combe's life.  It could be useful in determining the likelihood
    that he actually wrote the works he claimed to because he didn't publish with his name on his works
    and there is some question on a number of works being his.-->
    
    <TEI xmlns="http://www.tei-c.org/ns/1.0"/>
        
    <xsl:variable name="lettersColl" as="document-node()+" select="collection('letters/?select=*.xml')"/>
    
    
    <xsl:template match="/">
        <xsl:for-each select="$lettersColl//fileDesc/bibl">
            <xsl:sort select="date/@when"/>
            <!-- drl 2018-11-26 Clearly I have to fix some code in the xml files!  I thought the only thing I left out was the git namespace but after attempting to run this I was apparently wrong! -->
        </xsl:for-each>
        
        <!-- drl 2018-11-26 It will be useful to space the timeline using the earliest and latest dates of
        letters included on the site in real time.-->
        <xsl:variable name="allDates"  select="$lettersColl//fileDesc/bibl/date/@when"/>
            <xsl:comment>      List all dates: <xsl:value-of select="string-join($allDates, ', ')"/>
            </xsl:comment>  
            <!-- Earliest date:--> <xsl:variable name="earliest" select="min(for $i in $allDates return tokenize($i, '-')[1]) ! xs:integer(.) "/> 
            <!--Latest date:--> <xsl:variable name="latest" select="max(for $i in $allDates return tokenize($i, '-')[1]) ! xs:integer(.)"/>
            <xsl:comment>Earliest date: <xsl:value-of select="$earliest"/>. Latest date: <xsl:value-of select="$latest"/>. Difference between the two:
     <xsl:value-of select="$latest - $earliest"/></xsl:comment>
        
        <xsl:variable name="spacer" select="100"/>
        <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="{$latest * $spacer - $earliest * $spacer + 500}" viewBox="0 0 1200 2000">
            
            <g transform="translate(200, -5500)">
                <line stroke="red" stroke-width="6" x1="0" x2="0" y1="0" y2="{$latest * $spacer - $earliest * $spacer}"/>
                
                <!--drl 2018-11-27 Plotting the years should still work the same way. -->
                <xsl:for-each select="0 to $latest - $earliest">
                    <circle cx="0" cy="{current() ! xs:integer(.) * $spacer}"  r="6" fill="black"/>
                    <text x="-50" y="{current() ! xs:integer(.) * $spacer}" text-anchor="middle" style="font-family: Arial;
                        font-size  : 20;
                        stroke     : black;
                        fill       : red;
                        "><xsl:value-of select="$earliest + position() - 1"/></text>
                </xsl:for-each>
                
                <g><!--drl 2018-11-26  I want to plot each work so I need to pull out the title of the work..-->
                    <xsl:for-each select="$lettersColl//fileDisc/bibl/title">
                        <xsl:variable name="work" select="."/> 
                        
                        <!-- drl 2018-11-26 There will be 12 of each of the running columns in each year.  Is it possible to do a 
                        distinct values and then maybe a nested java-script timeline for years like this?  It would show the months in
                        that year during which a column was published?-->
                        
                        <!--drl 2018-11-26 There will only be one date on each file to calculate, publication -->
                        <xsl:variable name="pub" select="@when"/>
                        <xsl:variable name="yearPub" select="tokenize($pub, '-')[1] ! xs:integer(.)"/>
                        <xsl:variable name="yearPub_SVG" select="$yearPub - $earliest"/>
                        
                        <!-- That will pull only the year part of the publication dates.
                        Books probably won't have months, and nothing but letters will have days (if those do, we shall see in Athens if I'm allowed to use them)-->
                        <xsl:variable name="pubMonth">
                            <xsl:choose>
                                <xsl:when test="contains(@when, '-')">
                                    <xsl:value-of select="(format-date($pub, '[m]') ! xs:integer(.)) div 12"/>
                                    
                                    <!-- drl 2018-11-26 Does that work?  To divide the months rather than the days? -->
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="0"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="pubMonth_SVG" select="($yearPub_SVG + $pubMonth) * $spacer "/>
                        <xsl:comment> The value of $pubMonth is <xsl:value-of select="$pubMonth"/>. The value of $pubMonth_SVG is <xsl:value-of select="$pubMonth_SVG"/></xsl:comment>
                        
                        <!--SVG for publication: -->                 
                        <circle cx="{150 + position()*50}" cy="{$pubMonth_SVG}" r="6" fill="purple"/> 
                        <line x1="0" x2="{150 + position()*50}" y1="{$pubMonth_SVG}" y2="{$pubMonth_SVG}" stroke="black" stroke-width="1.5"/> 
                        <text x="{375 + position()*50}" y="{$pubMonth_SVG}" text-anchor="middle" style="font-family: Arial;
                            font-size  : 20;
                            stroke     : black;
                            fill       : red;
                            "><xsl:value-of select="$work"/> is born (<xsl:value-of select="$pub"/>).</text>  
                    </xsl:for-each>
                </g>
                
            </g>
        </svg>
            
    </xsl:template>
    
    
</xsl:stylesheet>