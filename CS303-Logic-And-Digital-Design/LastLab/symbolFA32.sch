<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="B" />
        <signal name="A" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="Cin" />
        <signal name="S" />
        <signal name="C" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="Cin" />
        <port polarity="Output" name="S" />
        <port polarity="Output" name="C" />
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="xor2" name="XLXI_1">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_2">
            <blockpin signalname="Cin" name="I0" />
            <blockpin signalname="XLXN_1" name="I1" />
            <blockpin signalname="S" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="Cin" name="I0" />
            <blockpin signalname="XLXN_1" name="I1" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="A" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_5">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="XLXN_6" name="I1" />
            <blockpin signalname="C" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="2128" y="2608" name="XLXI_1" orien="R0" />
        <instance x="3152" y="2592" name="XLXI_2" orien="R0" />
        <instance x="2512" y="3120" name="XLXI_3" orien="R0" />
        <instance x="2544" y="3536" name="XLXI_4" orien="R0" />
        <instance x="3248" y="3312" name="XLXI_5" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="2432" y1="2512" y2="2512" x1="2384" />
            <wire x2="2768" y1="2512" y2="2512" x1="2432" />
            <wire x2="2432" y1="2512" y2="2992" x1="2432" />
            <wire x2="2512" y1="2992" y2="2992" x1="2432" />
            <wire x2="2768" y1="2464" y2="2512" x1="2768" />
            <wire x2="3152" y1="2464" y2="2464" x1="2768" />
        </branch>
        <branch name="B">
            <wire x2="1632" y1="2624" y2="2672" x1="1632" />
            <wire x2="1632" y1="2672" y2="3408" x1="1632" />
            <wire x2="2544" y1="3408" y2="3408" x1="1632" />
            <wire x2="1872" y1="2672" y2="2672" x1="1632" />
            <wire x2="1872" y1="2544" y2="2672" x1="1872" />
            <wire x2="2128" y1="2544" y2="2544" x1="1872" />
        </branch>
        <branch name="A">
            <wire x2="1440" y1="2640" y2="2768" x1="1440" />
            <wire x2="1440" y1="2768" y2="3472" x1="1440" />
            <wire x2="2544" y1="3472" y2="3472" x1="1440" />
            <wire x2="1776" y1="2768" y2="2768" x1="1440" />
            <wire x2="1776" y1="2480" y2="2768" x1="1776" />
            <wire x2="2128" y1="2480" y2="2480" x1="1776" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="2816" y1="3440" y2="3440" x1="2800" />
            <wire x2="3248" y1="3248" y2="3248" x1="2816" />
            <wire x2="2816" y1="3248" y2="3440" x1="2816" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="3008" y1="3024" y2="3024" x1="2768" />
            <wire x2="3008" y1="3024" y2="3184" x1="3008" />
            <wire x2="3248" y1="3184" y2="3184" x1="3008" />
        </branch>
        <branch name="Cin">
            <wire x2="2352" y1="2032" y2="2032" x1="1952" />
            <wire x2="2400" y1="2032" y2="2032" x1="2352" />
            <wire x2="2400" y1="2032" y2="2528" x1="2400" />
            <wire x2="2400" y1="2528" y2="2536" x1="2400" />
            <wire x2="2400" y1="2536" y2="3088" x1="2400" />
            <wire x2="3152" y1="2528" y2="2528" x1="2400" />
            <wire x2="2512" y1="3056" y2="3056" x1="2368" />
            <wire x2="2368" y1="3056" y2="3088" x1="2368" />
            <wire x2="2400" y1="3088" y2="3088" x1="2368" />
        </branch>
        <branch name="S">
            <wire x2="3440" y1="2496" y2="2496" x1="3408" />
        </branch>
        <branch name="C">
            <wire x2="3536" y1="3216" y2="3216" x1="3504" />
        </branch>
        <iomarker fontsize="28" x="1440" y="2640" name="A" orien="R270" />
        <iomarker fontsize="28" x="1632" y="2624" name="B" orien="R270" />
        <iomarker fontsize="28" x="1952" y="2032" name="Cin" orien="R180" />
        <iomarker fontsize="28" x="3440" y="2496" name="S" orien="R0" />
        <iomarker fontsize="28" x="3536" y="3216" name="C" orien="R0" />
    </sheet>
</drawing>