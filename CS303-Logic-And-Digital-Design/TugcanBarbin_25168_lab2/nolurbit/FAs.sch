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
        <instance x="3040" y="2096" name="XLXI_1" orien="R0" />
        <instance x="4064" y="2080" name="XLXI_2" orien="R0" />
        <instance x="3424" y="2608" name="XLXI_3" orien="R0" />
        <instance x="3456" y="3024" name="XLXI_4" orien="R0" />
        <instance x="4160" y="2800" name="XLXI_5" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="3344" y1="2000" y2="2000" x1="3296" />
            <wire x2="3680" y1="2000" y2="2000" x1="3344" />
            <wire x2="3344" y1="2000" y2="2480" x1="3344" />
            <wire x2="3424" y1="2480" y2="2480" x1="3344" />
            <wire x2="3680" y1="1952" y2="2000" x1="3680" />
            <wire x2="4064" y1="1952" y2="1952" x1="3680" />
        </branch>
        <branch name="B">
            <wire x2="2544" y1="2112" y2="2160" x1="2544" />
            <wire x2="2544" y1="2160" y2="2896" x1="2544" />
            <wire x2="3456" y1="2896" y2="2896" x1="2544" />
            <wire x2="2784" y1="2160" y2="2160" x1="2544" />
            <wire x2="2784" y1="2032" y2="2160" x1="2784" />
            <wire x2="3040" y1="2032" y2="2032" x1="2784" />
        </branch>
        <branch name="A">
            <wire x2="2352" y1="2128" y2="2256" x1="2352" />
            <wire x2="2352" y1="2256" y2="2960" x1="2352" />
            <wire x2="3456" y1="2960" y2="2960" x1="2352" />
            <wire x2="2688" y1="2256" y2="2256" x1="2352" />
            <wire x2="2688" y1="1968" y2="2256" x1="2688" />
            <wire x2="3040" y1="1968" y2="1968" x1="2688" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="3728" y1="2928" y2="2928" x1="3712" />
            <wire x2="4160" y1="2736" y2="2736" x1="3728" />
            <wire x2="3728" y1="2736" y2="2928" x1="3728" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="3920" y1="2512" y2="2512" x1="3680" />
            <wire x2="3920" y1="2512" y2="2672" x1="3920" />
            <wire x2="4160" y1="2672" y2="2672" x1="3920" />
        </branch>
        <branch name="Cin">
            <wire x2="3264" y1="1520" y2="1520" x1="2864" />
            <wire x2="3312" y1="1520" y2="1520" x1="3264" />
            <wire x2="3312" y1="1520" y2="2016" x1="3312" />
            <wire x2="3312" y1="2016" y2="2032" x1="3312" />
            <wire x2="3312" y1="2032" y2="2576" x1="3312" />
            <wire x2="4064" y1="2016" y2="2016" x1="3312" />
            <wire x2="3424" y1="2544" y2="2544" x1="3280" />
            <wire x2="3280" y1="2544" y2="2576" x1="3280" />
            <wire x2="3312" y1="2576" y2="2576" x1="3280" />
        </branch>
        <branch name="S">
            <wire x2="4352" y1="1984" y2="1984" x1="4320" />
        </branch>
        <branch name="C">
            <wire x2="4448" y1="2704" y2="2704" x1="4416" />
        </branch>
        <iomarker fontsize="28" x="2352" y="2128" name="A" orien="R270" />
        <iomarker fontsize="28" x="2544" y="2112" name="B" orien="R270" />
        <iomarker fontsize="28" x="2864" y="1520" name="Cin" orien="R180" />
        <iomarker fontsize="28" x="4352" y="1984" name="S" orien="R0" />
        <iomarker fontsize="28" x="4448" y="2704" name="C" orien="R0" />
    </sheet>
</drawing>