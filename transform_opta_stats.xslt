<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Match Statistics</title>
                <style>
                    body { font-family: Arial, sans-serif; text-align: center; }
                    table { width: 60%; border-collapse: collapse; margin: 20px auto; }
                    th, td { border: 1px solid black; padding: 8px; text-align: center; }
                    th { background-color: #f2f2f2; }
                    .header { font-size: 24px; font-weight: bold; margin: 20px; }
                </style>
            </head>
            <body>
                <div class="header">
                    Match Statistics: <xsl:value-of select="//matchInfo/description"/>
                </div>

                <table>
                    <tr>
                        <th>Statistic</th>
                        <th><xsl:value-of select="//contestant[@position='home']/@officialName"/></th>
                        <th><xsl:value-of select="//contestant[@position='away']/@officialName"/></th>
                    </tr>

                    <xsl:variable name="homeId" select="//contestant[@position='home']/@id"/>
                    <xsl:variable name="awayId" select="//contestant[@position='away']/@id"/>

                    <!-- Short Code -->
                    <tr>
                        <td>Short Code</td>
                        <td><xsl:value-of select="//contestant[@position='home']/@code"/></td>
                        <td><xsl:value-of select="//contestant[@position='away']/@code"/></td>
                    </tr>

                    <!-- Final Score -->
                    <tr>
                        <td>Final Score</td>
                        <td><xsl:value-of select="//scores/ft/@home"/></td>
                        <td><xsl:value-of select="//scores/ft/@away"/></td>
                    </tr>

                    <!-- totalScoringAtt -->
                    <tr>
                        <td>Shots</td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='totalScoringAtt']">
                                    <xsl:value-of select="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='totalScoringAtt']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='totalScoringAtt']">
                                    <xsl:value-of select="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='totalScoringAtt']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>

                    <!-- ontargetScoringAtt -->
                    <tr>
                        <td>Shots On Target</td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='ontargetScoringAtt']">
                                    <xsl:value-of select="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='ontargetScoringAtt']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='ontargetScoringAtt']">
                                    <xsl:value-of select="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='ontargetScoringAtt']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>

                    <!-- Possession Percentage (Rounded) -->
                    <tr>
                        <td>Possession</td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='possessionPercentage']">
                                    <xsl:value-of select="round(//lineUp[@contestantId=$homeId]/teamStats/stat[@type='possessionPercentage'])"/>%
                                </xsl:when>
                                <xsl:otherwise>0%</xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='possessionPercentage']">
                                    <xsl:value-of select="round(//lineUp[@contestantId=$awayId]/teamStats/stat[@type='possessionPercentage'])"/>%
                                </xsl:when>
                                <xsl:otherwise>0%</xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>

                    <!-- totalOffside -->
                    <tr>
                        <td>Offsides</td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='totalOffside']">
                                    <xsl:value-of select="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='totalOffside']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='totalOffside']">
                                    <xsl:value-of select="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='totalOffside']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>

                    <!-- totalYellowCard -->
                    <tr>
                        <td>Yellow Cards</td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='totalYellowCard']">
                                    <xsl:value-of select="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='totalYellowCard']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='totalYellowCard']">
                                    <xsl:value-of select="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='totalYellowCard']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>

                    <!-- totalRedCard -->
                    <tr>
                        <td>Red Cards</td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='totalRedCard']">
                                    <xsl:value-of select="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='totalRedCard']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='totalRedCard']">
                                    <xsl:value-of select="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='totalRedCard']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>

                    <!-- totalFouls -->
                    <tr>
                        <td>Fouls</td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='fkFoulLost']">
                                    <xsl:value-of select="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='fkFoulLost']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='fkFoulLost']">
                                    <xsl:value-of select="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='fkFoulLost']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>

                    <!-- totalCorners -->
                    <tr>
                        <td>Corners</td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='cornerTaken']">
                                    <xsl:value-of select="//lineUp[@contestantId=$homeId]/teamStats/stat[@type='cornerTaken']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='cornerTaken']">
                                    <xsl:value-of select="//lineUp[@contestantId=$awayId]/teamStats/stat[@type='cornerTaken']"/>
                                </xsl:when>
                                <xsl:otherwise>0</xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>

                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
