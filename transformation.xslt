<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <xsl:template match="/">
        <xsl:text>{&#xa;</xsl:text>
        <xsl:apply-templates select="restaurant"/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="restaurant">
        <xsl:text>"restaurant": {&#xa;</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>",&#xa;"address": {&#xa;</xsl:text>
        <xsl:text>"streetAddress": "</xsl:text>
        <xsl:value-of select="address/streetAddress"/>
        <xsl:text>",&#xa;"addressLocality": "</xsl:text>
        <xsl:value-of select="address/addressLocality"/>
        <xsl:text>",&#xa;"addressCountry": "</xsl:text>
        <xsl:value-of select="address/addressCountry"/>
        <xsl:text>"&#xa;},&#xa;"phone": "</xsl:text>
        <xsl:value-of select="phone"/>
        <xsl:text>",&#xa;"email": "</xsl:text>
        <xsl:value-of select="email"/>
        <xsl:text>",&#xa;"menu": [&#xa;</xsl:text>
        <xsl:for-each select="menu/item">
            <xsl:sort select="type"/>
            <xsl:text>{&#xa;</xsl:text>
            <xsl:text>"name": "</xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>",&#xa;"type": "</xsl:text>
            <xsl:value-of select="type"/>
            <xsl:text>",&#xa;"price": "</xsl:text>
            <xsl:value-of select="price"/>
            <xsl:text>"&#xa;}</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
        <xsl:text>],&#xa;"reservation": [&#xa;</xsl:text>
        <xsl:apply-templates select="reservation/table"/>
        <xsl:text>&#xa;],&#xa;"chef": [&#xa;</xsl:text>
        <xsl:apply-templates select="chef"/>
        <xsl:text>&#xa;]&#xa;</xsl:text>
        <xsl:text>}&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="menu/item">
        <xsl:text>{&#xa;"name": "</xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>",&#xa;"description": "</xsl:text>
        <xsl:value-of select="description"/>
        <xsl:text>",&#xa;"price": "</xsl:text>
        <xsl:value-of select="price"/>
        <xsl:text>",&#xa;"type": "</xsl:text>
        <xsl:value-of select="type"/>
        <xsl:text>"&#xa;}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,&#xa;</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="reservation/table">
        <xsl:text>{&#xa;"id": "</xsl:text>
        <xsl:value-of select="id"/>
        <xsl:text>",&#xa;"capacity": "</xsl:text>
        <xsl:value-of select="capacity"/>
        <xsl:text>",&#xa;"location": "</xsl:text>
        <xsl:value-of select="location"/>
        <xsl:text>"&#xa;}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,&#xa;</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="chef">
        <xsl:text>{&#xa;"name": "</xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>",&#xa;"specialty": "</xsl:text>
        <xsl:value-of select="specialty"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:choose>
            <xsl:when test="experience &gt;= 10">
                <xsl:text>"status": "pro"</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>"status": "noob"</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>,&#xa;"experience": "</xsl:text>
        <xsl:value-of select="experience"/>
        <xsl:text>"&#xa;}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,&#xa;</xsl:text>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>