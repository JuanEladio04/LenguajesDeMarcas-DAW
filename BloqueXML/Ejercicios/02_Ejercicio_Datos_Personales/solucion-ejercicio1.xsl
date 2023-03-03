<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/alumno">
    <html>
      <head>
        <title>Solucion</title>
      </head>
      <body>
          <h1>
            Datos personales:
          </h1>
        <p>
          Nombre: <xsl:value-of select="nombre"/>
        </p>
        <p>
          Dirección: 
        </p>
        <p>
          <xsl:apply-templates select="direccion"/>
        </p>
        <p>
          <xsl:value-of select="telefono"/>
        </p>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="direccion">
      Calle <xsl:value-of select="calle"/>
      numero <xsl:value-of select="numero"/> 
      en la ciudad de <xsl:value-of select="ciudad"/>
      en la provincia de <xsl:value-of select="provincia"/>
  </xsl:template>
  
</xsl:stylesheet>
