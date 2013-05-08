<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:template match="/survey">
      <html>
         <head>
            <title>
               QUESTIONÁRIO: 
               <xsl:for-each select="metadata">
                  <xsl:value-of select="title"/>
               </xsl:for-each>
            </title>
         </head>
         <body>
            <xsl:for-each select="metadata">
               <h1><xsl:value-of select="title"/></h1>
               <h2><xsl:value-of select="description"/></h2>
            </xsl:for-each>
            <hr />
            <xsl:for-each select="issues/question">
               <xsl:choose>
                  <xsl:when test="@type = 'text'">
                     <xsl:element name="label">
                        <xsl:attribute name="for">
                           <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:value-of select="label"/> 
                     </xsl:element>
                     <xsl:element name="input">
                        <xsl:attribute name="type">text</xsl:attribute>
                        <xsl:attribute name="name">
                           <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:attribute name="id">
                           <xsl:value-of select="@id"/>
                        </xsl:attribute>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <hr/>
                     <h3>Tipo <xsl:value-of select="@type"/> ainda não definido</h3>
                     <hr/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:for-each>
         </body>
      </html>
   </xsl:template>

</xsl:stylesheet>