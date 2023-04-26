<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/primerDia1DAW">
        <html>
            <head>
                <title>Primer día de clase</title>
                
                <xsl:call-template name="css"/>
            </head>
            <body>
                <center>
                    <xsl:call-template name="tablaHorario"/>
                    <xsl:call-template name="tablaAlumnos"/>
                </center>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template name="tablaAlumnos">
        <table border="1" with="90%">
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i">1</xsl:with-param>
            </xsl:call-template>
        </table>
    </xsl:template> 
    
    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>               
            <xsl:for-each select="estructuraAula/bloque">
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:choose>
                        <xsl:when test="@tipo = 'puerta'">
                            <xsl:attribute name="style">background: #<xsl:value-of select="/primerDia1DAW/estructuraAula/color[@tipo = 'puerta']"/>;"</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="@tipo = 'pared'">
                            <xsl:attribute name="style">background: #<xsl:value-of select="/primerDia1DAW/estructuraAula/color[@tipo = 'pared']"/>;"</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="@tipo = 'ventana'">
                            <xsl:attribute name="style">background: #<xsl:value-of select="/primerDia1DAW/estructuraAula/color[@tipo = 'ventana']"/>;"</xsl:attribute>
                        </xsl:when>
                        
                    </xsl:choose>
                    
                    <xsl:value-of select="@tipo"/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>

    
    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/> 
        <xsl:if test="$j &lt;= 8">
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
        <xsl:if test="$i &lt;= 11">
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
    
    
    <xsl:template match="dia">
        <tr>
            <td>
                <xsl:value-of select="@desc"/>
            </td>
            
            <xsl:for-each select="hora">
                <xsl:sort select="@orden"/>
                <td>
                    <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">
                            <xsl:attribute name="style">background: #b2cfff;</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="position() mod 2 = 0">
                            <xsl:attribute name="style">background: #FFFFFF;</xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:value-of select="."/>
                </td>
            </xsl:for-each>
        </tr>
    </xsl:template>
    
    
    <xsl:template name="tablaHorario">
        <table border="1">
            <xsl:for-each select="horario">
                    <xsl:apply-templates select="dia"></xsl:apply-templates>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    
    <xsl:template name="css">
        <style type="text/css">
            body {
            font-family: Arial;
            }
            
            ol, ul
            {
            margin-top: 10px;
            margin-left: 0px;
            }
            
            #menu li
            {
            margin-left: 0px;
            display: inline;
            list-style-type: none;
            padding: 10px 50px;
            }
        </style>
    </xsl:template>
    
</xsl:stylesheet>

