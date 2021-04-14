<?xml version='1.0'?> <!-- As XML file -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Thin layer on MathBook XML -->
<xsl:import href="/home/rob/mathbook/mathbook/xsl/mathbook-html.xsl" />

<!-- Intend output for rendering by pdflatex -->
<xsl:output method="text" />

<!-- WITHOUT trailing slash -->
<xsl:variable name="fcla-base-url" select="'http://linear.ups.edu/fcla'"/>

<!-- References to FCLA preserve acronyms -->
<!-- TODO make links to knowls in FCLA website -->
<xsl:template match="acroref">
	<xsl:apply-templates select="." mode="fcla-name" />
	<xsl:text> </xsl:text>
	<a class="xref" data-knowl="{$fcla-base-url}/knowl/{@type}-{@acro}.html">
		<xsl:value-of select="@acro" />
    </a>
</xsl:template>

<xsl:template match="acroref[@type='chapter' or @type='section']">
	<xsl:apply-templates select="." mode="fcla-name" />
	<xsl:text> </xsl:text>
	<a href="{$fcla-base-url}/{@type}-{@acro}.html" target="_blank">
		<xsl:value-of select="@acro" />
    </a>
</xsl:template>

<xsl:template match="acroref" mode="fcla-name" >
	<xsl:choose>
		<xsl:when test="@type='theorem'">Theorem</xsl:when>
		<xsl:when test="@type='definition'">Definition</xsl:when>
		<xsl:when test="@type='theorem'">Theorem</xsl:when>
		<xsl:when test="@type='example'">Example</xsl:when>
		<xsl:when test="@type='property'">Property</xsl:when>
		<xsl:when test="@type='exercise'">Exercise</xsl:when>
		<xsl:when test="@type='solution'">Solution</xsl:when>
		<xsl:when test="@type='technique'">Proof Technique</xsl:when>
		<xsl:when test="@type='sage'">Sage</xsl:when>
		<xsl:when test="@type='diagram'">Diagram</xsl:when>
		<xsl:when test="@type='archetype'">Archetype</xsl:when>
		<xsl:when test="@type='subsection'">Subsection</xsl:when>
		<xsl:when test="@type='section'">Section</xsl:when>
		<xsl:when test="@type='chapter'">Chapter</xsl:when>
		<xsl:otherwise>Report me:  (FCLA type without translation)</xsl:otherwise>
	</xsl:choose>
</xsl:template>



</xsl:stylesheet>