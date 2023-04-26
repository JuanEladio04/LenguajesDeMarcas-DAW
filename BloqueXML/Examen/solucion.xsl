<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1" />
    <xsl:template match="/callejero">
        <html>
            <head>
                <title>Monumentos</title>
               
            </head>
            <body>     
                <center>
                    <h1>
                        <xsl:value-of select="@ciudad"/> / 
                        <xsl:value-of select="@provincia"/>:  
                        <xsl:value-of select="@barrio"/> -
                        <xsl:value-of select="@cod_postal"/>
                    </h1>
                </center>
                
                <xsl:call-template name="tablaMonumentos"/>
                <br/>
                <xsl:call-template name="table6x6"/>
                <br/>s
                <xsl:call-template name="tablaPatrocinadores"/>
                
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template name="tablaMonumentos">
        <table border="1" align="center">
            <xsl:apply-templates select="/callejero/monumentos/monumento"/>
        </table>
    </xsl:template>
    
    
    <xsl:template match="/callejero/monumentos/monumento">
        <tr>
            <xsl:choose>
                <xsl:when test="position() mod 3 = 1">
                    <xsl:attribute name="style">background: #dbf7ff;</xsl:attribute>
                </xsl:when>
                <xsl:when test="position() mod 3 = 2">
                    <xsl:attribute name="style">background: #dbf77f;</xsl:attribute>
                </xsl:when>
                <xsl:when test="position() mod 3 = 0">
                    <xsl:attribute name="style">background: #1df777;</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:call-template name="showMonument"></xsl:call-template>
        </tr>
    </xsl:template>
    
    
    <xsl:template name="showMonument">
        <td>
            <xsl:value-of select="@nombre"/>
        </td>
        <td>
            <xsl:variable name="imageId">
                <xsl:value-of select="@imagen"/>
            </xsl:variable>
            
            <xsl:variable name="imageLink">
                <xsl:value-of select="/callejero/Imagenes/imagen[@id = $imageId]"/>
            </xsl:variable>
            
            <img src="{$imageLink}" />
        </td>
        <td>
            <xsl:value-of select="@calle"/>
        </td>
        <td>
            <xsl:variable name="calleName">
                <xsl:value-of select="@calle"/>
            </xsl:variable>
            <xsl:for-each select="/callejero/callejero/calle">
                <xsl:if test="@nombre = $calleName">
                    <xsl:value-of select="@anexas"/>
                </xsl:if>
            </xsl:for-each>
        </td>
        
    </xsl:template>
    
    
    <xsl:template name="table6x6">
        <center>
            <table style="background: url('{/callejero/imagen}') no-repeat;">
                <xsl:call-template name="bucleForFila">
                    <xsl:with-param name="i">1</xsl:with-param>
                </xsl:call-template>
            </table>
        </center>
    </xsl:template>
    
    
    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td width="100px" height="80px">               
            <xsl:for-each select="/callejero/monumentos/monumento">
                <xsl:choose>
                    <xsl:when test="coordY = $x and coordX = $y">
                        <xsl:variable name="imageId">
                            <xsl:value-of select="@imagen"/>
                        </xsl:variable>
                        
                        <xsl:variable name="imageLink">
                            <xsl:value-of select="/callejero/Imagenes/imagen[@id = $imageId]"/>
                        </xsl:variable>
                        
                        <img src="{$imageLink}" />
                    </xsl:when>

                </xsl:choose>
            </xsl:for-each>
        </td>
    </xsl:template>
    
    
    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/> 
        <xsl:if test="$j &lt;= 6">
            <xsl:call-template name="celda">
                <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
                <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
            </xsl:call-template>
            
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 6">
            <tr>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                    <xsl:with-param name="j">1</xsl:with-param>
                </xsl:call-template>
            </tr>
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="tablaPatrocinadores">
        <table border="1" align="center">
            <xsl:apply-templates select="/callejero/patrocinadores/Patrocinador"/>     
        </table>
    </xsl:template>
    
    
    <xsl:template match="/callejero/patrocinadores/Patrocinador">
        <tr>
            <td>
               <xsl:value-of select="@nombre"/>             
            </td>
            <td>
                <xsl:variable name="imageId">
                    <xsl:value-of select="imagen/@id"/>
                </xsl:variable>
                
                <xsl:variable name="imageLink">
                    <xsl:value-of select="/callejero/Imagenes/imagen[@id = $imageId]"/>
                </xsl:variable>
                
                <img src="{$imageLink}" />
            </td>  
            <td>
                <xsl:value-of select="direccion"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>