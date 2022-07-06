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
        <instance x="3136" y="2656" name="XLXI_1" orien="R0" />
        <instance x="4160" y="2640" name="XLXI_2" orien="R0" />
        <instance x="3520" y="3168" name="XLXI_3" orien="R0" />
        <instance x="3552" y="3584" name="XLXI_4" orien="R0" />
        <instance x="4256" y="3360" name="XLXI_5" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="3440" y1="2560" y2="2560" x1="3392" />
            <wire x2="3776" y1="2560" y2="2560" x1="3440" />
            <wire x2="3440" y1="2560" y2="3040" x1="3440" />
            <wire x2="3520" y1="3040" y2="3040" x1="3440" />
            <wire x2="3776" y1="2512" y2="2560" x1="3776" />
            <wire x2="4160" y1="2512" y2="2512" x1="3776" />
        </branch>
        <branch name="B">
            <wire x2="2640" y1="2672" y2="2720" x1="2640" />
            <wire x2="2640" y1="2720" y2="3456" x1="2640" />
            <wire x2="3552" y1="3456" y2="3456" x1="2640" />
            <wire x2="2880" y1="2720" y2="2720" x1="2640" />
            <wire x2="2880" y1="2592" y2="2720" x1="2880" />
            <wire x2="3136" y1="2592" y2="2592" x1="2880" />
        </branch>
        <branch name="A">
            <wire x2="2448" y1="2688" y2="2816" x1="2448" />
            <wire x2="2448" y1="2816" y2="3520" x1="2448" />
            <wire x2="3552" y1="3520" y2="3520" x1="2448" />
            <wire x2="2784" y1="2816" y2="2816" x1="2448" />
            <wire x2="2784" y1="2528" y2="2816" x1="2784" />
            <wire x2="3136" y1="2528" y2="2528" x1="2784" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="3824" y1="3488" y2="3488" x1="3808" />
            <wire x2="4256" y1="3296" y2="3296" x1="3824" />
            <wire x2="3824" y1="3296" y2="3488" x1="3824" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="4016" y1="3072" y2="3072" x1="3776" />
            <wire x2="4016" y1="3072" y2="3232" x1="4016" />
            <wire x2="4256" y1="3232" y2="3232" x1="4016" />
        </branch>
        <branch name="Cin">
            <wire x2="3360" y1="2080" y2="2080" x1="2960" />
            <wire x2="3408" y1="2080" y2="2080" x1="3360" />
            <wire x2="3408" y1="2080" y2="2576" x1="3408" />
            <wire x2="3408" y1="2576" y2="2592" x1="3408" />
            <wire x2="3408" y1="2592" y2="3136" x1="3408" />
            <wire x2="4160" y1="2576" y2="2576" x1="3408" />
            <wire x2="3520" y1="3104" y2="3104" x1="3376" />
            <wire x2="3376" y1="3104" y2="3136" x1="3376" />
            <wire x2="3408" y1="3136" y2="3136" x1="3376" />
        </branch>
        <branch name="S">
            <wire x2="4448" y1="2544" y2="2544" x1="4416" />
        </branch>
        <branch name="C">
            <wire x2="4544" y1="3264" y2="3264" x1="4512" />
        </branch>
        <iomarker fontsize="28" x="2448" y="2688" name="A" orien="R270" />
        <iomarker fontsize="28" x="2640" y="2672" name="B" orien="R270" />
        <iomarker fontsize="28" x="2960" y="2080" name="Cin" orien="R180" />
        <iomarker fontsize="28" x="4448" y="2544" name="S" orien="R0" />
        <iomarker fontsize="28" x="4544" y="3264" name="C" orien="R0" />
    </sheet>
</drawing>