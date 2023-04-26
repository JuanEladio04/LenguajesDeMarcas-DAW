<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/juegoTanques">
    <html>
      <head>
        <title>Tanques</title>
        
        <style type="text/css">
          th {
          color: white;
          background: blue;
          }
        </style>
      </head>
      <body>
        <table border="1" align="center" width="75%">
          <tr>
            <th>Jugada</th>
            <th>Tanque</th>
            <th>Jugada</th>
          </tr>

          <xsl:apply-templates select="jugadasDescritas"/>

        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="jugadasDescritas">
    <xsl:for-each select="jugada">
      <xsl:variable name="increment">
        <xsl:value-of select="position()"/>
      </xsl:variable>
      <tr>
        
        <xsl:if test="position() mod 3 = 2">
          <xsl:attribute name="style">background: #b1d5f0;</xsl:attribute>
        </xsl:if>
        
        
        <xsl:choose>
          <xsl:when test="position() mod 3 = 1">
            <xsl:attribute name="style">background: #b1d5f0;</xsl:attribute>
          </xsl:when>
          <xsl:when test="position() mod 3 = 2">
            <xsl:attribute name="style">background: #0000FF;</xsl:attribute>
          </xsl:when>
        </xsl:choose>
        
        <td>
          <xsl:copy-of select="$increment"/>
        </td>
        
        <td>
          <xsl:value-of select="@jugador"/>
          <xsl:call-template name="imagenTanque">
            <xsl:with-param name="numeroJuagdor"><xsl:value-of select="@jugador"/></xsl:with-param>
          </xsl:call-template>
        </td>
        
        <td>
          <xsl:value-of select="@desc"/>
        </td>
        
      </tr>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="imagenTanque">
      <xsl:param name="numeroJuagdor"/>
    <xsl:for-each select="/juegoTanques/tanques/imagenTanque">
      <xsl:if test="$numeroJuagdor = @jugador">
        <img src="{.}" width="50px"></img>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
