<?xml version="1.0" encoding="ISO-8859-1"?>
<!--
###############################################################################
#                                                                             #
#  IMITATOR : IM - Paramètres et options                                      #
#                                                                             #
###############################################################################-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />

<xsl:template match="/">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
	<html lang="en">
		<xsl:call-template name="header"></xsl:call-template>
		<xsl:call-template name="body"></xsl:call-template>
	</html>
</xsl:template>
<!--
###############################################################################
#  1. Header                                                                  #
###############################################################################-->
<xsl:template name="header">
	<head>
		<meta charset="utf-8"/>
		<meta http-equiv="Content-Type" content="text/html" />
		<title><xsl:value-of select="//title"/></title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
		<link rel="stylesheet" href="../css.css" />
		<link rel="stylesheet" href="css.css" />
	</head>
</xsl:template>
<!--
###############################################################################
#  2. Body                                                                    #
###############################################################################-->
<xsl:template name="body">
<body ondragstart="return false;" ondrop="return false;">
	<div class="container">
	<form class="form-horizontal" role="form">
		<h1><xsl:value-of select="//title"/></h1>
		<div class="form-group im-group">
			<xsl:call-template name="par"></xsl:call-template>
		</div>
		<div class="form-group">
			<div class="col-md-9 im-group">
				<h2>Options</h2>
				<xsl:call-template name="op"></xsl:call-template>
			</div>
			<div class="col-md-4 pull-right">
				<!--a href="javascript:triangle_click()"><img src="../triangle.svg" /></a-->
				<svg height="460" width="350">
					<g id="group-abort">
						<path id="btn-abort" d="m 165 200 l 150 0 l 0 150 l-150 0 Z" class="abortup" />
						<text x="240" y="245">Abort</text>
					</g>
					<g id="group-run">
						<path id="btn-run" d="m 165 200 l 150 100 l-150 100 Z" class="runup" />
						<text x="200" y="277">Run</text>
					</g>
					<g id="group-cancel" onClick="alert('back &#187;&#187;&#187; window.location.assign(\'../..\')')">
						<path id="btn-cancel" d="m 160 200 l -150 100 l 150 100 Z" class="cancelup" />
						<text x="125" y="262">Cancel</text>
					</g>
				</svg>
			</div>
		</div>
	</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="../js.js"></script>
	<script src="js.js"></script>
</body>
</xsl:template>
<!--
###############################################################################
#  2.1 Paramètres                                                             #
###############################################################################-->
<xsl:template name="par">
	<h2><xsl:value-of select="//partitle"/></h2>
	<div class="row col-md-10 col1">
		<xsl:for-each select="//par">
			<div class="form-group">
				<label class="control-label col-sm-1"><xsl:value-of select="."/></label>
				<div class="col-sm-7">
					<xsl:element name="input"> 
						<xsl:attribute name="type">text</xsl:attribute>
						<xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
						<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
						<xsl:attribute name="placeholder">enter <xsl:value-of select="."/> value</xsl:attribute>
					</xsl:element>
				</div>
			</div>
		</xsl:for-each>
	</div>
</xsl:template>
<!--
###############################################################################
#  2.2 Options                                                                #
###############################################################################-->
<xsl:template name="op">
	<xsl:for-each select="//op">
		<div class="form-group">
			<label class="control-label col-sm-4"><xsl:value-of select="."/></label>
			<div class="col-sm-4">
				<xsl:element name="input">
					<xsl:attribute name="class">col-sm-4</xsl:attribute>
					<xsl:attribute name="type">text</xsl:attribute>
					<xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
				</xsl:element>
			</div>
			<xsl:element name="div">
				<xsl:attribute name="class">glyphicon glyphicon-info-sign</xsl:attribute>
				<xsl:attribute name="data-toggle">tooltip</xsl:attribute>
				<xsl:attribute name="title"><xsl:value-of select="@help"/></xsl:attribute>
			</xsl:element>
		</div>
	</xsl:for-each>
	<xsl:for-each select="//ck">
		<div class="form-group">
			<div class="controls">
				<label class="control-label col-sm-4"><xsl:value-of select="."/></label>
			<div class="col-sm-3">
				<xsl:element name="input">
					<xsl:attribute name="type">checkbox</xsl:attribute>
					<xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
					<xsl:if test="./@checked">
						<xsl:attribute name="checked">checked</xsl:attribute>
					</xsl:if>
				</xsl:element>
			</div>
			</div>
			<xsl:element name="div">
				<xsl:attribute name="class">glyphicon glyphicon-info-sign col-sm-offset-1</xsl:attribute>
				<xsl:attribute name="data-toggle">tooltip</xsl:attribute>
				<xsl:attribute name="title"><xsl:value-of select="@help"/></xsl:attribute>
			</xsl:element>
		</div>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>