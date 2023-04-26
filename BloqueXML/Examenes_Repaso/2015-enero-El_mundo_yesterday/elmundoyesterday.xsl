<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/periodico">
        <html>
            <head>
                <title>El Mundo Yesterday</title>
                
                <xsl:call-template name="css"/>
            </head>
            <body>
                
                <xsl:call-template name="imageLogo"/>
                
                <xsl:call-template name="menuList"/>
                
                <div style="width: 700px; float: left;">
                    <xsl:apply-templates select="noticias"/>
                </div>
                
                <xsl:apply-templates select="publicidad"/>
                
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="publicidad">
        <div style="width: 295px; float: right;">
            <xsl:for-each select="anuncio">
                
                <xsl:variable name="orden">
                    <xsl:value-of select="@orden"/>
                </xsl:variable>
                
                <xsl:variable name="linkImage">
                    <xsl:value-of select="@imagen"/>
                </xsl:variable>
                
                <xsl:variable name="counter">
                    
                </xsl:variable>
                
                <xsl:sort select="@orden"/>
                
                <div class="divPublicidad">
                    <img src="{$linkImage}" width="280px"/>
                </div>
                
            </xsl:for-each>
        </div>
    </xsl:template>
    
    
    <xsl:template match="noticias">
           <xsl:for-each select="noticia">
               <div>
                   <xsl:variable name="tipoNoticia">
                       <xsl:value-of select="@dobleAncho"/>
                   </xsl:variable>
                   
                   <xsl:variable name="linkImage">
                       <xsl:value-of select="@imagen"/>
                   </xsl:variable>
                   
                   <xsl:choose>
                       <xsl:when test="$tipoNoticia = 's'">
                           <xsl:attribute name="class">noticiaDobleAncho</xsl:attribute>
                       </xsl:when>
                       <xsl:when test="$tipoNoticia = 'n'">
                           <xsl:attribute name="class">noticia</xsl:attribute>
                       </xsl:when>
                   </xsl:choose>
                   
                   <h2>
                       <xsl:value-of select="titular"/>
                   </h2>
                   <h4>
                       <xsl:value-of select="subtitular"/>
                   </h4>
                   <br/>
                   <img src="{$linkImage}"/>
                   <br/>
                   <span class="fechaNoticia">
                       Publicado el
                       <xsl:value-of select="@fecha"/>
                   </span>
                   <span class="comentariosNoticia">
                       <xsl:value-of select="@comentarios"/> comentarios
                   </span>
               </div>
           </xsl:for-each>
    </xsl:template>
    
    
    <xsl:template name="menuList">
        <div id="menu" style="width: 1000px; margin: 0px; padding: 0px;">
            <ul>
                <xsl:for-each select="menu">       
   
                        <xsl:apply-templates select="enlace"/>
                        
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    
    
    <xsl:template match="enlace">
        <li>
            <xsl:choose>
                <xsl:when test="position() mod 2 = 1">
                    <xsl:attribute name="style">background: #DDE640;</xsl:attribute>
                </xsl:when>
                <xsl:when test="position() mod 2 = 0">
                    <xsl:attribute name="style">background: orange;</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            
            <xsl:variable name="link">
                <xsl:value-of select="@href"/>
            </xsl:variable>
            
            <a href="{$link}">
                <xsl:value-of select="."/>
            </a>
        </li>
    </xsl:template>
    
    
    <xsl:template name="imageLogo">
        <div style="width: 1000px;">
            <xsl:variable name="image">
                <xsl:value-of select="@logo"/>
            </xsl:variable>
            
            <img src="{$image}"/>
        </div>
    </xsl:template>
    
    
    <xsl:template name="css">
        <style type="text/css">
            body {
            font-family: Arial;
            font-size: 12px;
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
            
            .noticia {
            /* border: #000 solid 1px; */
            padding: 10px 5px;
            float: left; 
            width: 338px;
            }
            
            .noticia img {
            width: 338px;
            }
            
            .noticiaDobleAncho {
            /* border: #000 solid 1px; */
            padding: 10px 5px;
            float: left; 
            width: 690px;
            }
            
            .noticiaDobleAncho img {
            width: 690px;
            }
            
            .fechaNoticia {
            color: #A3A34B;
            }
            
            .comentariosNoticia {
            color: #A3A34B;
            padding-left: 20px;
            }
            
            .divPublicidad {
            /* border: #000 solid 1px; */
            padding: 10px 5px;
            float: right; 
            width: 280px;                    
            }
            
            .divPublicidad img {
            width: 200px;
            }
        </style>
    </xsl:template>
    
</xsl:stylesheet>

