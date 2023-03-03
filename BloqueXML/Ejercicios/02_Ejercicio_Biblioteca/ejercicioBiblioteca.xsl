<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="biblioteca">
        <html>
            <head>
                <title>Biblioteca</title>
            </head>
            <body>
                <h1>
                    BIBLIOTECA
                </h1>
                <table border="1">
                    <xsl:apply-templates select="libro"/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="/biblioteca/libro">
        <tr>
            <td>
                Título: <xsl:value-of select="titulo"/>
            </td>
            <td>
                Autor: <xsl:value-of select="autor"/>
            </td>
            <td>
                Fecha de Publicación: 
                <xsl:for-each select="fechaPublicacion">
                    <xsl:value-of select="@año"/>
                </xsl:for-each>
            </td>
        </tr>
    </xsl:template>
    

</xsl:stylesheet>