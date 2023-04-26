<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1" />
    <xsl:template match="/cine">
        <html>
            <head>
                <title>Batman vs Superman</title>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="@nombre" />
                    <br />
                    <xsl:call-template name="imagen" />

                    <xsl:call-template name="titulo" />

                    <center>
                        <xsl:call-template name="horarios"/>
                    </center>

                </h1>


            </body>
        </html>
    </xsl:template>


    <xsl:template name="imagen">
        <xsl:variable name="imageLink">
            <xsl:value-of select="/cine/titulo/imagen" />
        </xsl:variable>

        <img
            src="{$imageLink}" />
    </xsl:template>


    <xsl:template name="titulo">
        <h2>
            <xsl:value-of select="titulo/@nombre" />
        </h2>
        <h3>
            <xsl:value-of select="titulo/@estreno" />
        </h3>
    </xsl:template>


    <xsl:template name="horarios">

        <table border="1" width="50%" align="center">
            <xsl:for-each select="/cine/sesiones/sesion">
                <tr>
                    <th>
                        <xsl:choose>
                            <xsl:when test="position() mod 2 = 1">
                                <xsl:attribute name="style">background: #dbf7ff;</xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
        Sesion <xsl:value-of select="position()" /> : <xsl:value-of select="@hora" />
                    <table
                            border="1" width="50%" align="center">
                            <xsl:call-template name="bucleForFila">
                                <xsl:with-param name="i">1</xsl:with-param>
                                <xsl:with-param name="position">
                                    <xsl:value-of select="position()"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </table>
                    </th>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>


    <xsl:template name="celda">
        <xsl:param name="x" />
        <xsl:param name="y" />
        <xsl:param name="position" />
        
        <td>
            <xsl:for-each select="/cine/sesiones/sesion">
                <xsl:if test="ocupado/@asiento = $x and ocupado/@fila = $y">
                    <xsl:variable name="position2">
                        <xsl:value-of select="position()"/>
                    </xsl:variable>
                    <xsl:value-of select="$position2"/>
                    /
                    <xsl:value-of select="$position"/>
                    <xsl:variable name="imageLink" select="/cine/imagenes/imagen[@id = 'ocupado']"/>
                    <img src="{$imageLink}"/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>


    <xsl:template name="bucleForColumna">
        <xsl:param name="position" />
    <xsl:param name="i" />
    <xsl:param name="j" />
    <xsl:if
            test="$j &lt;= 4">
            <xsl:call-template name="celda">
                <xsl:with-param name="position">
                    <xsl:value-of select="$position" />
                </xsl:with-param>
                <xsl:with-param name="x">
                    <xsl:value-of select="$j" />
                </xsl:with-param>
                <xsl:with-param name="y">
                    <xsl:value-of select="$i" />
                </xsl:with-param>
            </xsl:call-template>


        <xsl:call-template
                name="bucleForColumna">
                <xsl:with-param name="i">
                    <xsl:value-of select="$i" />
                </xsl:with-param>
                <xsl:with-param name="j">
                    <xsl:value-of select="$j + 1" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


    <xsl:template name="bucleForFila">
        <xsl:param name="i" />
    <xsl:param name="position"></xsl:param>
    <xsl:if test="$i &lt;= 4">
            <tr>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="position">
                        <xsl:value-of select="$position" />
                    </xsl:with-param>
                    <xsl:with-param name="i">
                        <xsl:value-of select="$i" />
                    </xsl:with-param>
                    <xsl:with-param name="j">1</xsl:with-param>
                </xsl:call-template>
            </tr>
        <xsl:call-template
                name="bucleForFila">
                <xsl:with-param name="i">
                    <xsl:value-of select="$i + 1" />
                </xsl:with-param>
                <xsl:with-param name="position">
                    <xsl:value-of select="$position" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>