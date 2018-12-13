<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="no" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
                doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/dir">
        <html lang="en">
            <head>
                <meta name="Author" content="shanhe.me"/>
                <title>JMeter Test Results</title>
                <style type="text/css"><![CDATA[

                * { margin: 0; padding: 0 }
                html, body { width: 100%; height: 100%; background: #b4b4b4; font-size: 12px }
                table { border: none; border-collapse: collapse; table-layout: fixed }
                td { vertical-align: baseline; font-size: 14px }

				table#summary tr th { color: #ffffff; font-weight: bold; text-align:center; background:#2674a6; white-space: nowrap; }
				table#summary tr td { background:#eeeee0; white-space: nowrap; line-height: 18px }
				.failure { font-weight:bold; color:red;	}
            ]]></style>
            </head>
            <body>
                <div id="summary-panel">
                    <xsl:call-template name="summaryTable"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="summaryTable">
        <table id="summary" align="center" class="details" border="0" cellpadding="5" cellspacing="2" width="100%">
            <tr valign="top">
                <th>Group</th>
                <th># Samples</th>
                <th>Failures</th>
                <th>Success Rate</th>
                <th>Average Time</th>
                <th>Min Time</th>
                <th>Max Time</th>
            </tr>
            <xsl:variable name="dirname" select="@name"/>
            <xsl:for-each select="*">
                <xsl:variable name="filename" select="@name"/>
                <xsl:variable name="groupname" select="substring-before($filename, '.')"/>
                <xsl:variable name="jtl">
                    ../../../target/report/jtl/<xsl:value-of select="$filename"/>
                </xsl:variable>
                <xsl:variable name="doc" select="document($jtl)"></xsl:variable>

                <xsl:call-template name="summaryRow">
                    <xsl:with-param name="doc" select="$doc"/>
                    <xsl:with-param name="group" select="$groupname"/>
                </xsl:call-template>
            </xsl:for-each>
        </table>
    </xsl:template>

    <xsl:template name="summaryRow">
        <xsl:param name="doc"/>
        <xsl:param name="group"/>
        <tr valign="top">
            <xsl:variable name="allCount" select="count($doc/testResults/*)"/>
            <xsl:variable name="allFailureCount" select="count($doc/testResults/*[attribute::s='false'])"/>
            <xsl:variable name="allSuccessCount" select="count($doc/testResults/*[attribute::s='true'])"/>
            <xsl:variable name="allSuccessPercent" select="$allSuccessCount div $allCount"/>
            <xsl:variable name="allTotalTime" select="sum($doc/testResults/*/@t)"/>
            <xsl:variable name="allAverageTime" select="$allTotalTime div $allCount"/>
            <xsl:variable name="allMinTime">
                <xsl:call-template name="min">
                    <xsl:with-param name="nodes" select="$doc/testResults/*/@t"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="allMaxTime">
                <xsl:call-template name="max">
                    <xsl:with-param name="nodes" select="$doc/testResults/*/@t"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="$allFailureCount &gt; 0">failure</xsl:when>
                </xsl:choose>
            </xsl:attribute>
            <td align="center">
                <xsl:choose>
                    <xsl:when test="$allFailureCount &gt; 0">
                        <a target="_blank">
                            <xsl:attribute name="href"><xsl:value-of select="$group"/>.html</xsl:attribute>
                            <xsl:value-of select="$group"/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$group"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td align="center">
                <xsl:value-of select="$allCount"/>
            </td>
            <td align="center">
                <xsl:value-of select="$allFailureCount"/>
            </td>
            <td align="center">
                <xsl:call-template name="display-percent">
                    <xsl:with-param name="value" select="$allSuccessPercent"/>
                </xsl:call-template>
            </td>
            <td align="center">
                <xsl:call-template name="display-time">
                    <xsl:with-param name="value" select="$allAverageTime"/>
                </xsl:call-template>
            </td>
            <td align="center">
                <xsl:call-template name="display-time">
                    <xsl:with-param name="value" select="$allMinTime"/>
                </xsl:call-template>
            </td>
            <td align="center">
                <xsl:call-template name="display-time">
                    <xsl:with-param name="value" select="$allMaxTime"/>
                </xsl:call-template>
            </td>
        </tr>
    </xsl:template>

    <xsl:template name="min">
        <xsl:param name="nodes" select="/.."/>
        <xsl:choose>
            <xsl:when test="not($nodes)">NaN</xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="$nodes">
                    <xsl:sort data-type="number"/>
                    <xsl:if test="position() = 1">
                        <xsl:value-of select="number(.)"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="max">
        <xsl:param name="nodes" select="/.."/>
        <xsl:choose>
            <xsl:when test="not($nodes)">NaN</xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="$nodes">
                    <xsl:sort data-type="number" order="descending"/>
                    <xsl:if test="position() = 1">
                        <xsl:value-of select="number(.)"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="display-percent">
        <xsl:param name="value"/>
        <xsl:value-of select="format-number($value,'0.00%')"/>
    </xsl:template>

    <xsl:template name="display-time">
        <xsl:param name="value"/>
        <xsl:value-of select="format-number($value,'0 ms')"/>
    </xsl:template>
</xsl:stylesheet>