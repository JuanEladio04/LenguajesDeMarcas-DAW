<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/navidad">
    <html>
      <head>
        <title>Menú de navidad</title>
      </head>
      <body>
        <h1>
          Almuerzo
        </h1>
        <xsl:for-each select="almuerzo">
          <p>
            Primer plato: <xsl:value-of select="primerPlato"/>
          </p>
          <p>
            Segundo plato: <xsl:value-of select="segundoPlato"/>
          </p>
          <p>
            Postre: <xsl:value-of select="postre"/>
          </p>
          <p>
            Bebida: <xsl:value-of select="bebida"/>
          </p>
          
        <xsl:apply-templates select="sobremesa"/>

        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="sobremesa">
    <ul>
      <p><xsl:value-of select="primeraCopa"/></p>
      <p><xsl:value-of select="segundaCopa"/></p>
      <p><xsl:value-of select="terceraCopa"/></p>
    </ul>
  </xsl:template>
</xsl:stylesheet>


