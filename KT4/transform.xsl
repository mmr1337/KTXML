<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <items>
      <xsl:apply-templates select="//li">
        <xsl:with-param name="parentid" select="0"/>
      </xsl:apply-templates>
    </items>
  </xsl:template>

  <xsl:template match="li">
    <xsl:param name="parentid"/>
    
    <xsl:variable name="currentid" select="@data-id"/>
    
    <item id="{$currentid}" parentid="{$parentid}" author="{b}">
      <xsl:value-of select="span"/>
    </item>
    
    <xsl:apply-templates select="ul/li">
      <xsl:with-param name="parentid" select="$currentid"/>
    </xsl:apply-templates>
  </xsl:template>

</xsl:stylesheet>
