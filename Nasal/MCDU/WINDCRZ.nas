# A3XX mCDU by Joshua Davidson (Octal450), Jonathan Redpath, and Matthew Maring (mattmaring)

# Copyright (c) 2020 Matthew Maring (mattmaring)

var windCRZPage = {
	title: [nil, nil, nil],
	fontMatrix: [[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0]],
	arrowsMatrix: [[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0]],
	arrowsColour: [["ack", "ack", "ack", "ack", "ack", "ack"],["ack", "ack", "ack", "ack", "ack", "ack"]],
	L1: [nil, nil, "ack"], # content, title, colour
	L2: [nil, nil, "ack"],
	L3: [nil, nil, "ack"],
	L4: [nil, nil, "ack"],
	L5: [nil, nil, "ack"],
	L6: [nil, nil, "ack"],
	C1: [nil, nil, "ack"],
	C2: [nil, nil, "ack"],
	C3: [nil, nil, "ack"],
	C4: [nil, nil, "ack"],
	C5: [nil, nil, "ack"],
	C6: [nil, nil, "ack"],
	R1: [nil, nil, "ack"],
	R2: [nil, nil, "ack"],
	R3: [nil, nil, "ack"],
	R4: [nil, nil, "ack"],
	R5: [nil, nil, "ack"],
	R6: [nil, nil, "ack"],
	scroll: 0,
	vector: [],
	index: nil,
	computer: nil,
	new: func(computer, waypoint) {
		var wcp = {parents:[windCRZPage]};
		wcp.computer = computer;
		wcp.waypoint = waypoint;
		wcp._setupPageWithData();
		wcp.updateTmpy();
		return wcp;
	},
	del: func() {
		return nil;
	},
	_setupPageWithData: func() {
		me.title = ["CRZ WIND", " AT ", me.waypoint.wp_name];
		me.titleColour = "wht";
		# me.L1 = [" [   ]", "INB CRS", "blu"];
# 		me.L2 = [" R", " TURN", "blu"];
# 		if (pts.Instrumentation.Altimeter.indicatedFt.getValue() >= 14000) {
# 			me.L2 = [" 1.5/----", "TIME/DIST", "blu"];
# 		} else {
# 			me.L2 = [" 1.0/----", "TIME/DIST", "blu"];
# 		}
# 		me.L6 = [" RETURN", nil, "wht"];
# 		me.C4 = ["LAST EXIT", nil, "wht"];
# 		me.C5 = ["----  ---.-", "UTC    FUEL", "wht"];
# 		me.R1 = ["COMPUTED ", nil, "wht"];
# 		me.R2 = ["DATABASE ", nil, "wht"];
		me.arrowsMatrix = [[0, 0, 0, 0, 0, 1], [1, 1, 0, 0, 0, 0]];
		me.arrowsColour = [["ack", "ack", "ack", "ack", "ack", "wht"], ["wht", "wht", "ack", "ack", "ack", "ack"]];
		me.fontMatrix = [[1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]];
		canvas_mcdu.pageSwitch[me.computer].setBoolValue(0);
	},
	makeTmpy: func() {
		if (!fmgc.flightPlanController.temporaryFlag[me.computer]) {
			fmgc.flightPlanController.createTemporaryFlightPlan(me.computer);
		}
	},
	updateTmpy: func() {
		if (fmgc.flightPlanController.temporaryFlag[me.computer]) {
			me.L1[2] = "yel";
			me.L2[2] = "yel";
			me.L6 = [" F-PLN", " TMPY", "yel"];
			me.R6 = ["INSERT* ", " TMPY", "yel"];
			me.arrowsColour[0][5] = "yel";
			me.titleColour = "yel";
			canvas_mcdu.pageSwitch[me.computer].setBoolValue(0);
		} else {
			me.L1[2] = "blu";
			me.L2[2] = "blu";
			me.L6 = [" RETURN", nil, "wht"];
			me.R6 = [nil, nil, "ack"];
			me.arrowsColour[0][5] = "wht";
			me.titleColour = "wht";
			canvas_mcdu.pageSwitch[me.computer].setBoolValue(0);
		}
	}
};