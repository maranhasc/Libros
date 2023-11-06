<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;"> 
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">
<html>
    <head>
        <title>Librería Azarquiel</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    </head>
    <body>
        <div class="container shadow">
            <div class="jumbotron p-3 m-0 bg-secondary text-white">
                <h1 class="display-3"><img src="img/logo64.png" alt="" /> Librería Azarquiel</h1>
                <hr class="my-2" />
                <p>Tus libros de confianza...</p>
            </div>
            <h1 class="bg-secondary text-white my-2 rounded">Books:</h1>
            <div class="row justify-content-center">
                <xsl:for-each select="library/book">
                    <div class="col-lg-6 col-xl-4 my-2 d-flex">                  
                        <div class="card flex-fill bg-light">
                            <div class="card-body">
                                <a href="#{edition/isbn}"><h5 class="card-title"><xsl:value-of select="title" /></h5></a>
                                <h6 class="card-text"><xsl:value-of select="author"/></h6>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
            <h1 class="bg-secondary text-white my-2 rounded">Book Detail:</h1>
            <div class="row justify-content-center">
                <xsl:for-each select="library/book">
                    <div class="col-12 my-2 d-flex">
                        <div class="card flex-fill">
                            <div class="row">
                                <a name="{edition/isbn}" />
                                <div class="col-6">
                                    <img class="card-img-top" src="img/{edition/isbn}.jpg" alt="" />
                                </div>
                                <div class="col-6">
                                    <div class="card-body">
                                    <h2 class="card-title bg-primary text-white"><xsl:value-of select="title"/></h2>
                                    <h2 class="card-title"><xsl:value-of select="title[@language='es']" /></h2>
                                    <h3 class="card-title">Autor: <span class="bg-danger text-white"><xsl:value-of select="author"/></span></h3>
                                    <xsl:if test="comment/@rating != ''">
                                        <p><img src="img/stars-{comment/@rating}.gif" alt="" /></p>
                                    </xsl:if>  
                                    <h4 class="bg-primary text-white">Ediciones</h4>
                                    <xsl:for-each select="edition">
                                        <hr class="bg-primary" />
                                        <div class="bg-light p-1 rounded">
                                            <p><xsl:value-of select="edition"/></p>
                                            <p class="text-right">ISBN: <xsl:value-of select="isbn"/></p>
                                        </div>
                                    </xsl:for-each>
                                    </div>
                                </div>
                            </div>
                            
                            
                        </div>
                    </div>
                </xsl:for-each>
            </div>
            <h1 class="bg-secondary text-white my-2 rounded text-center p-3">XSL - S1DAM</h1>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    </body>
    
    </html>

</xsl:template>
</xsl:stylesheet>