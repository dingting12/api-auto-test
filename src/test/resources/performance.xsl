<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" encoding="US-ASCII"
                doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" />

    <!-- Defined parameters (overrideable) -->
    <xsl:param    name="showData" select="'Y'"/>

    <xsl:template match="/testResults">
        <html>
            <head>
                <title>Performance Test Results (Jmeter/XSLT)</title>
                <style type="text/css">
                    body {
                    font:normal 68% verdana,arial,helvetica;
                    color:#000000;
                    }
                    table tr td, table tr th {
                    font-size: 68%;
                    }
                    table.details tr th{
                    font-weight: bold;
                    text-align:left;
                    background:#a6caf0;
                    white-space: nowrap;
                    }
                    table.details tr td{
                    background:#eeeee0;
                    white-space: nowrap;
                    }
                    h1 {
                    margin: 0px 0px 5px; font: 165% verdana,arial,helvetica
                    }
                    h2 {
                    margin-top: 1em; margin-bottom: 0.5em; font: bold 125% verdana,arial,helvetica
                    }
                    h3 {
                    margin-bottom: 0.5em; font: bold 115% verdana,arial,helvetica
                    }
                    .Failure {
                    font-weight:bold; color:red;
                    }


                    img
                    {
                    border-width: 0px;
                    }

                    .expand_link
                    {
                    position=absolute;
                    right: 0px;
                    width: 27px;
                    top: 1px;
                    height: 27px;
                    }

                    .page_details
                    {
                    display: none;
                    }

                    .page_details_expanded
                    {
                    display: block;
                    display/* hide this definition from  IE5/6 */: table-row;
                    }


                </style>
                <script language="JavaScript"><![CDATA[
                           function expand(details_id)
			   {
			      
			      document.getElementById(details_id).className = "page_details_expanded";
			   }
			   
			   function collapse(details_id)
			   {
			      
			      document.getElementById(details_id).className = "page_details";
			   }
			   
			   function change(details_id)
			   {
			      if(document.getElementById(details_id+"_image").src.match("expand"))
			      {
			         document.getElementById(details_id+"_image").src = "collapse.jpg";
			         expand(details_id);
			      }
			      else
			      {
			         document.getElementById(details_id+"_image").src = "expand.jpg";
			         collapse(details_id);
			      } 
                           }
			]]></script>
            </head>
            <body>

                <xsl:call-template name="pageHeader" />

                <xsl:call-template name="summary" />
                <hr size="1" width="95%" align="left" />

                <xsl:call-template name="pagelist" />
                <hr size="1" width="95%" align="left" />

                <xsl:call-template name="detail" />

            </body>
        </html>
    </xsl:template>

    <xsl:template name="pageHeader">
    <h1>Performance Test Results (Jmeter/XSLT)</h1>
        <h3>LinkoopDB Version:2.0.0</h3>
        <h4>资源配置说明：</h4>
    <body>
        服务器个数：7台 <br />
        manager-memory=24G <br />
        executor-memory=20G <br />
        executor-cores=6  <br />
        num-executors=12  <br />
    </body>
    <table width="100%">
        <tr>
            <td align="right">Designed for use with <a href="http://jakarta.apache.org/jmeter">JMeter</a> and <a href="http://ant.apache.org">Ant</a>.</td>
        </tr>
    </table>
    <hr size="1" />
</xsl:template>

    <xsl:template name="summary">
        <h2>Summary</h2>
        <table class="details" border="0" cellpadding="5" cellspacing="2" width="95%">
            <tr valign="top">
                <th>SQL Count</th>
                <th>Failures</th>
                <th>Success Rate</th>
                <th>TPCDS Test Time</th>
                <th>Total Time</th>
            </tr>
            <tr valign="top">
                <xsl:variable name="allCount" select="count(/testResults/*)" />
                <xsl:variable name="allFailureCount" select="count(/testResults/*[attribute::s='false'])" />
                <xsl:variable name="allSuccessCount" select="count(/testResults/*[attribute::s='true'])" />
                <xsl:variable name="allSuccessPercent" select="$allSuccessCount div $allCount" />
                <xsl:variable name="allTpcdsTestTime" select="sum(/testResults/*/@t)" />
                <xsl:variable name="allTotalTime" select="sum(/testResults/*/@t)" />
                <xsl:variable name="allTotalTimeWithHour" select="$allTotalTime div 3600000 "/>
                <xsl:variable name="allTpcdsTestTimeWithHour" select="$allTpcdsTestTime div 3600000 "/>

                <xsl:variable name="sumTime" select="0" />
                <xsl:variable name="b" select="0" />
                <xsl:for-each select="*">
                    <xsl:if test="starts-with(@lb,'q')">
                        <tr>
                            <xsl:variable name="sumTime" select="@t + $sumTime" />
                        </tr>
                    </xsl:if>
                </xsl:for-each>

                <xsl:attribute name="class">
                    <xsl:choose>
                        <xsl:when test="$allFailureCount &gt; 0">Failure</xsl:when>
                    </xsl:choose>
                </xsl:attribute>
                <td>
                    <xsl:value-of select="$allCount" />
                </td>
                <td>
                    <xsl:value-of select="$allFailureCount" />
                </td>
                <td>
                    <xsl:call-template name="display-percent">
                        <xsl:with-param name="value" select="$allSuccessPercent" />
                    </xsl:call-template>
                </td>

                <td>
                    <xsl:call-template name="display-time">
                        <xsl:with-param name="value" select="$sumTime" />
                    </xsl:call-template>
                </td>
                <td>
                    <xsl:call-template name="display-time">
                        <xsl:with-param name="value" select="$allTotalTime" />
                    </xsl:call-template>
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template name="pagelist">
        <h2>Pages</h2>
        <table class="details" border="0" cellpadding="5" cellspacing="2" width="95%">
            <tr valign="top">
                <th>Test SQL</th>
                <th>Success</th>
                <th>Time</th>
                <th>ErrorMessage</th>
            </tr>
            <xsl:for-each select="*">
                <xsl:variable name="sql" select="@lb"/>
                <xsl:variable name="success" select="@s" />
                <xsl:variable name="time" select="@t" />
                <xsl:variable name="timeWithSecond" select="@t div 1000" />
                <xsl:variable name="rm" select="@rm" />
                <tr valign="top">
<!--                <xsl:attribute name="class">
                        <xsl:choose>
                            <xsl:when test="$failureCount &gt; 0">Failure</xsl:when>
                        </xsl:choose>
                    </xsl:attribute>-->
                    <td>
                        <xsl:value-of select="$sql" />
                    </td>
                    <td>
                        <xsl:value-of select="$success" />
                    </td>

                    <td>
                        <xsl:call-template name="display-time">
                            <xsl:with-param name="value" select="$time" />
                        </xsl:call-template>
                    </td>
                    <td>
                        <xsl:value-of select="$rm" />
                    </td>
                    <!--<td>-->
                        <!--<xsl:if test="$failureCount > 0">-->
                            <!--<a><xsl:attribute name="href">#<xsl:value-of select="$label" /></xsl:attribute>-->
                                <!--<xsl:value-of select="$label" />-->
                            <!--</a>-->
                        <!--</xsl:if>-->
                        <!--<xsl:if test="0 >= $failureCount">-->
                            <!--<xsl:value-of select="$label" />-->
                        <!--</xsl:if>-->
                    <!--</td>-->
                    <!--<td>-->
                        <!--<xsl:value-of select="$count" />-->
                    <!--</td>-->
                    <!--<td>-->
                        <!--<xsl:value-of select="$failureCount" />-->
                    <!--</td>-->
                    <!--<td>-->
                        <!--<xsl:call-template name="display-percent">-->
                            <!--<xsl:with-param name="value" select="$successPercent" />-->
                        <!--</xsl:call-template>-->
                    <!--</td>-->
                    <!--<td>-->
                        <!--<xsl:call-template name="display-time">-->
                            <!--<xsl:with-param name="value" select="$averageTime" />-->
                        <!--</xsl:call-template>-->
                    <!--</td>-->
                    <!--<td>-->
                        <!--<xsl:call-template name="display-time">-->
                            <!--<xsl:with-param name="value" select="$minTime" />-->
                        <!--</xsl:call-template>-->
                    <!--</td>-->
                    <!--<td>-->
                        <!--<xsl:call-template name="display-time">-->
                            <!--<xsl:with-param name="value" select="$maxTime" />-->
                        <!--</xsl:call-template>-->
                    <!--</td>-->
                  <!--  <td align="center">
                        <a href="">
                            <xsl:attribute name="href"><xsl:text/>javascript:change('page_details_<xsl:value-of select="position()" />')</xsl:attribute>
                            <img src="expand.jpg" alt="expand/collapse"><xsl:attribute name="id"><xsl:text/>page_details_<xsl:value-of select="position()" />_image</xsl:attribute></img>
                        </a>
                    </td>-->
                </tr>

<!--                <tr class="page_details">
                    <xsl:attribute name="id"><xsl:text/>page_details_<xsl:value-of select="position()" /></xsl:attribute>
                    <td colspan="8" bgcolor="#FF0000">
                        <div align="center">
                            <b>Details for Page "<xsl:value-of select="$label" />"</b>
                            <table bordercolor="#000000" border="1"  cellpadding="0" cellspacing="0" width="95%">
                                <tr>
                                    <th>Thread</th>
                                    <th>Iteration</th>
                                    <th>Time</th>
                                    <th>Success</th>
                                    &lt;!&ndash;
                                    itterations = position() - thread stuff
                                    time="312"
                                    timeStamp="1053622047640"
                                    responseMessage="OK"
                                    threadName="Thread Group-1"
                                    dataType="text"
                                    label="/CansysAandA/processAuthentication.do"
                                    success="true"
                                    &ndash;&gt;
                                </tr>

                                <xsl:for-each select="../sampleResult[@label = $label and @threadName != $label]">
                                    <tr>
                                        <td><xsl:value-of select="@threadName" /></td>
                                        <td><xsl:value-of select="position()" /></td>
                                        <td><xsl:value-of select="@time" />ms</td>
                                        <td><xsl:value-of select="@success" /></td>
                                    </tr>
                                </xsl:for-each>

                            </table>
                        </div>
                    </td>
                </tr>-->

            </xsl:for-each>
        </table>
    </xsl:template>

    <xsl:template name="detail">
        <xsl:variable name="allFailureCount" select="count(/testResults/sampleResult[attribute::success='false'])" />

        <xsl:if test="$allFailureCount > 0">
            <h2>Failure Detail</h2>

            <xsl:for-each select="/testResults/sampleResult[not(@label = preceding::*/@label)]">

                <xsl:variable name="failureCount" select="count(../sampleResult[@label = current()/@label][attribute::success='false'])" />

                <xsl:if test="$failureCount > 0">
                    <h3><xsl:value-of select="@label" /><a><xsl:attribute name="name"><xsl:value-of select="@label" /></xsl:attribute></a></h3>

                    <table class="details" border="0" cellpadding="5" cellspacing="2" width="95%">
                        <tr valign="top">
                            <th>Response</th>
                            <th>Failure Message</th>
                            <xsl:if test="$showData = 'y'">
                                <th>Response Data</th>
                            </xsl:if>
                        </tr>

                        <xsl:for-each select="/testResults/sampleResult[@label = current()/@label][attribute::success='false']">
                            <tr>
                                <td><xsl:value-of select="@responseCode" /> - <xsl:value-of select="@responseMessage" /></td>
                                <td><xsl:value-of select="assertionResult/@failureMessage" /></td>
                                <xsl:if test="$showData = 'y'">
                                    <td><xsl:value-of select="./binary" /></td>
                                </xsl:if>
                            </tr>
                        </xsl:for-each>

                    </table>
                </xsl:if>

            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template name="min">
        <xsl:param name="nodes" select="/.." />
        <xsl:choose>
            <xsl:when test="not($nodes)">NaN</xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="$nodes">
                    <xsl:sort data-type="number" />
                    <xsl:if test="position() = 1">
                        <xsl:value-of select="number(.)" />
                    </xsl:if>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="max">
        <xsl:param name="nodes" select="/.." />
        <xsl:choose>
            <xsl:when test="not($nodes)">NaN</xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="$nodes">
                    <xsl:sort data-type="number" order="descending" />
                    <xsl:if test="position() = 1">
                        <xsl:value-of select="number(.)" />
                    </xsl:if>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="display-percent">
        <xsl:param name="value" />
        <xsl:value-of select="format-number($value,'0.00%')" />
    </xsl:template>

    <xsl:template name="display-time">
        <xsl:param name="value" />
        <xsl:value-of select="format-number($value,'0 ms')" />
    </xsl:template>

    <xsl:template name="display-second">
        <xsl:param name="value" />
        <xsl:value-of select="format-number($value,'0 s')" />
    </xsl:template>

    <xsl:template name="display-hour">
        <xsl:param name="value" />
        <xsl:value-of select="format-number($value,'0 h')" />
    </xsl:template>

</xsl:stylesheet>