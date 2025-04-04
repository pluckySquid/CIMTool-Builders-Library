<?xml version="1.0" encoding="UTF-8"?>
<!--
This builder is released under a BSD-3 license as part of the CIMantic Graphs library developed by PNNL.

This software was created under a project sponsored by the U.S. Department of Energy’s Office of Electricity, 
an agency of the United States Government. Neither the United States Government nor the United States Department 
of Energy, nor Battelle, nor any of their employees, nor any jurisdiction or organization that has cooperated 
in the development of these materials, makes any warranty, express or implied, or assumes any legal liability 
or responsibility for the accuracy, completeness, or usefulness or any information, apparatus, product, software, 
or process disclosed, or represents that its use would not infringe privately owned rights.

Reference herein to any specific commercial product, process, or service by trade name, trademark, manufacturer, 
or otherwise does not necessarily constitute or imply its endorsement, recommendation, or favoring by the United 
States Government or any agency thereof, or Battelle Memorial Institute. The views and opinions of authors expressed 
herein do not necessarily state or reflect those of the United States Government or any agency thereof.

PACIFIC NORTHWEST NATIONAL LABORATORY operated by BATTELLE for the UNITED STATES DEPARTMENT OF ENERGY 
under Contract DE-AC05-76RL01830
-->
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:a="http://langdale.com.au/2005/Message#"
    xmlns:sawsdl="http://www.w3.org/ns/sawsdl"
    xmlns="http://langdale.com.au/2009/Indent">

    <xsl:output indent="yes" method="xml" encoding="utf-8" />
    <xsl:param name="version"/>
    <xsl:param name="baseURI"/>
    <xsl:param name="ontologyURI"/>
    <xsl:param name="envelope">Profile</xsl:param>
    <xsl:param name="package">au.com.langdale.cimtool.generated</xsl:param>

    <!-- Template for __init__.py file -->
    <xsl:template match="a:Catalog">
        <document>
            <!-- Header text with library imports -->
            <list begin="'''" indent="    " end="'''">
                <item>Annotated CIMantic Graphs data profile init file for
                <xsl:value-of select="$envelope" />
            </item>
                <item>Generated by CIMTool http://cimtool.org</item>
            </list>
            <!-- Import objects using profile name -->
            <item> from cimgraph.data_profile.<xsl:value-of select="$envelope" />.<xsl:value-of select="$envelope" /> import ( </item>
            <list begin="" indent="    " end="">
                <item>Identity,</item>
            </list>
            <!-- List all CIM classes to be imported, in alphabetical order -->
            <xsl:for-each select="a:Root|a:ComplexType|a:EnumeratedType|a:CompoundType|a:SimpleType">
                <xsl:sort select="name" data-type="text" order="ascending"/>
                <list begin="" indent="    " end="">
                    <xsl:value-of select="@name" />
                    <xsl:if test="position()!=last()">, </xsl:if>
                </list>
            </xsl:for-each>
            <item>)</item>

            <!-- List all CIM classes to be imported, in alphabetical order -->
            <item> __all__ = [ </item>
            <list begin="" indent="    " end="">
                <item>'Identity',</item>
            </list>
            <xsl:for-each select="a:Root|a:ComplexType|a:EnumeratedType|a:CompoundType|a:SimpleType">
                <xsl:sort select="name" data-type="text" order="ascending"/>
                <list begin="" indent="    " end="">
                    '<xsl:value-of select="@name" />'
                    <xsl:if test="position()!=last()">, </xsl:if>
                </list>
            </xsl:for-each>
            <item>]</item>
        </document>
    </xsl:template>
</xsl:stylesheet>