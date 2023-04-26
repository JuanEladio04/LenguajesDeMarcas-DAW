<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="juegoTanques/jugadasGraficas">
    <html>
      <head>
        <title>Tanques Gráfico</title>
        
        <style type="text/css">
          th {
          color: white;
          background: blue;
          }
        </style>
      </head>
      <body>

          <xsl:call-template name="tablas"/>
        
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="jugadasGraficas" name="tablas">
      <xsl:for-each select="jugadaGrafica">
          <table border="1">
              
          </table>
      </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="creaTablas">
    
  </xsl:template>
  
</xsl:stylesheet>