<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_3" />
        <signal name="XLXN_9" />
        <signal name="XLXN_1" />
        <signal name="G0" />
        <signal name="XLXN_4" />
        <signal name="C1" />
        <signal name="C2" />
        <signal name="C3" />
        <signal name="Cin" />
        <signal name="P0" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="G1" />
        <signal name="XLXN_33" />
        <signal name="XLXN_34" />
        <signal name="P1" />
        <signal name="XLXN_36" />
        <signal name="XLXN_37" />
        <signal name="G2" />
        <signal name="XLXN_41" />
        <signal name="XLXN_42" />
        <signal name="XLXN_43" />
        <signal name="XLXN_44" />
        <signal name="P2" />
        <port polarity="Input" name="G0" />
        <port polarity="Output" name="C1" />
        <port polarity="Output" name="C2" />
        <port polarity="Output" name="C3" />
        <port polarity="Input" name="Cin" />
        <port polarity="Input" name="P0" />
        <port polarity="Input" name="G1" />
        <port polarity="Input" name="P1" />
        <port polarity="Input" name="G2" />
        <port polarity="Input" name="P2" />
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
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="and4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="144" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
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
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="P0" name="I0" />
            <blockpin signalname="Cin" name="I1" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_3">
            <blockpin signalname="P1" name="I0" />
            <blockpin signalname="P0" name="I1" />
            <blockpin signalname="Cin" name="I2" />
            <blockpin signalname="XLXN_37" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="P1" name="I0" />
            <blockpin signalname="G0" name="I1" />
            <blockpin signalname="XLXN_36" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="P2" name="I0" />
            <blockpin signalname="G1" name="I1" />
            <blockpin signalname="XLXN_41" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_4">
            <blockpin signalname="P2" name="I0" />
            <blockpin signalname="P1" name="I1" />
            <blockpin signalname="G0" name="I2" />
            <blockpin signalname="XLXN_42" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_6">
            <blockpin signalname="P2" name="I0" />
            <blockpin signalname="P1" name="I1" />
            <blockpin signalname="P0" name="I2" />
            <blockpin signalname="Cin" name="I3" />
            <blockpin signalname="XLXN_43" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_8">
            <blockpin signalname="G0" name="I0" />
            <blockpin signalname="XLXN_4" name="I1" />
            <blockpin signalname="C1" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_9">
            <blockpin signalname="G1" name="I0" />
            <blockpin signalname="XLXN_36" name="I1" />
            <blockpin signalname="XLXN_37" name="I2" />
            <blockpin signalname="C2" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_10">
            <blockpin signalname="G2" name="I0" />
            <blockpin signalname="XLXN_41" name="I1" />
            <blockpin signalname="XLXN_42" name="I2" />
            <blockpin signalname="XLXN_43" name="I3" />
            <blockpin signalname="C3" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="2944" y="2800" name="XLXI_1" orien="R0" />
        <instance x="2928" y="2000" name="XLXI_3" orien="R0" />
        <instance x="2912" y="2352" name="XLXI_2" orien="R0" />
        <instance x="2944" y="1488" name="XLXI_5" orien="R0" />
        <instance x="2928" y="1104" name="XLXI_4" orien="R0" />
        <instance x="2976" y="640" name="XLXI_6" orien="R0" />
        <instance x="3504" y="2848" name="XLXI_8" orien="R0" />
        <instance x="3632" y="2384" name="XLXI_9" orien="R0" />
        <instance x="4160" y="1136" name="XLXI_10" orien="R0" />
        <iomarker fontsize="28" x="1952" y="2960" name="G0" orien="R180" />
        <branch name="G0">
            <wire x2="2656" y1="2960" y2="2960" x1="1952" />
            <wire x2="3488" y1="2960" y2="2960" x1="2656" />
            <wire x2="2928" y1="912" y2="912" x1="2656" />
            <wire x2="2656" y1="912" y2="2224" x1="2656" />
            <wire x2="2656" y1="2224" y2="2960" x1="2656" />
            <wire x2="2912" y1="2224" y2="2224" x1="2656" />
            <wire x2="3504" y1="2784" y2="2784" x1="3488" />
            <wire x2="3488" y1="2784" y2="2960" x1="3488" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="3344" y1="2704" y2="2704" x1="3200" />
            <wire x2="3344" y1="2704" y2="2720" x1="3344" />
            <wire x2="3504" y1="2720" y2="2720" x1="3344" />
        </branch>
        <branch name="C1">
            <wire x2="3792" y1="2752" y2="2752" x1="3760" />
        </branch>
        <iomarker fontsize="28" x="3792" y="2752" name="C1" orien="R0" />
        <branch name="C2">
            <wire x2="3920" y1="2256" y2="2256" x1="3888" />
        </branch>
        <iomarker fontsize="28" x="3920" y="2256" name="C2" orien="R0" />
        <branch name="C3">
            <wire x2="4448" y1="976" y2="976" x1="4416" />
        </branch>
        <iomarker fontsize="28" x="4448" y="976" name="C3" orien="R0" />
        <branch name="Cin">
            <wire x2="2784" y1="3136" y2="3136" x1="1952" />
            <wire x2="2976" y1="384" y2="384" x1="2784" />
            <wire x2="2784" y1="384" y2="1808" x1="2784" />
            <wire x2="2928" y1="1808" y2="1808" x1="2784" />
            <wire x2="2784" y1="1808" y2="2672" x1="2784" />
            <wire x2="2784" y1="2672" y2="3136" x1="2784" />
            <wire x2="2944" y1="2672" y2="2672" x1="2784" />
        </branch>
        <branch name="P0">
            <wire x2="2048" y1="2736" y2="2736" x1="1936" />
            <wire x2="2944" y1="2736" y2="2736" x1="2048" />
            <wire x2="2976" y1="448" y2="448" x1="2048" />
            <wire x2="2048" y1="448" y2="1872" x1="2048" />
            <wire x2="2048" y1="1872" y2="2736" x1="2048" />
            <wire x2="2928" y1="1872" y2="1872" x1="2048" />
        </branch>
        <iomarker fontsize="28" x="1936" y="2736" name="P0" orien="R180" />
        <branch name="G1">
            <wire x2="2416" y1="2496" y2="2496" x1="1872" />
            <wire x2="2464" y1="2496" y2="2496" x1="2416" />
            <wire x2="2560" y1="2496" y2="2496" x1="2464" />
            <wire x2="2560" y1="2496" y2="2528" x1="2560" />
            <wire x2="3632" y1="2528" y2="2528" x1="2560" />
            <wire x2="2944" y1="1360" y2="1360" x1="2464" />
            <wire x2="2464" y1="1360" y2="2496" x1="2464" />
            <wire x2="3632" y1="2320" y2="2528" x1="3632" />
        </branch>
        <iomarker fontsize="28" x="1872" y="2496" name="G1" orien="R180" />
        <branch name="P1">
            <wire x2="2144" y1="2288" y2="2288" x1="1920" />
            <wire x2="2912" y1="2288" y2="2288" x1="2144" />
            <wire x2="2976" y1="512" y2="512" x1="2144" />
            <wire x2="2144" y1="512" y2="976" x1="2144" />
            <wire x2="2144" y1="976" y2="1936" x1="2144" />
            <wire x2="2928" y1="1936" y2="1936" x1="2144" />
            <wire x2="2144" y1="1936" y2="2288" x1="2144" />
            <wire x2="2928" y1="976" y2="976" x1="2144" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="3632" y1="2256" y2="2256" x1="3168" />
        </branch>
        <branch name="XLXN_37">
            <wire x2="3632" y1="1872" y2="1872" x1="3184" />
            <wire x2="3632" y1="1872" y2="2192" x1="3632" />
        </branch>
        <branch name="G2">
            <wire x2="3072" y1="1552" y2="1552" x1="1840" />
            <wire x2="4160" y1="1552" y2="1552" x1="3072" />
            <wire x2="4160" y1="1072" y2="1184" x1="4160" />
            <wire x2="4160" y1="1184" y2="1552" x1="4160" />
        </branch>
        <branch name="XLXN_41">
            <wire x2="3680" y1="1392" y2="1392" x1="3200" />
            <wire x2="3680" y1="1008" y2="1392" x1="3680" />
            <wire x2="4160" y1="1008" y2="1008" x1="3680" />
        </branch>
        <branch name="XLXN_42">
            <wire x2="3664" y1="976" y2="976" x1="3184" />
            <wire x2="3664" y1="944" y2="976" x1="3664" />
            <wire x2="4160" y1="944" y2="944" x1="3664" />
        </branch>
        <branch name="XLXN_43">
            <wire x2="4160" y1="480" y2="480" x1="3232" />
            <wire x2="4160" y1="480" y2="880" x1="4160" />
        </branch>
        <iomarker fontsize="28" x="1840" y="1552" name="G2" orien="R180" />
        <branch name="P2">
            <wire x2="2304" y1="1424" y2="1424" x1="1824" />
            <wire x2="2944" y1="1424" y2="1424" x1="2304" />
            <wire x2="2976" y1="576" y2="576" x1="2304" />
            <wire x2="2304" y1="576" y2="1040" x1="2304" />
            <wire x2="2304" y1="1040" y2="1424" x1="2304" />
            <wire x2="2928" y1="1040" y2="1040" x1="2304" />
        </branch>
        <iomarker fontsize="28" x="1824" y="1424" name="P2" orien="R180" />
        <iomarker fontsize="28" x="1952" y="3136" name="Cin" orien="R180" />
        <iomarker fontsize="28" x="1920" y="2288" name="P1" orien="R180" />
    </sheet>
</drawing>