////////////////////////////////////////////////////////////////////////////

////// INITIALIZATION OF PATTERNS & PARAMETERS

////////////////////////////////////////////////////////////////////////////

(

// samples
~bufHiHat = Buffer.readChannel(s, "samples/HiHat.wav", channels:1);
~bufGhostSnare = Buffer.readChannel(s, "samples/GhostSnare.wav", channels:1);
~bufSnare = Buffer.readChannel(s, "samples/Snare.wav", channels:1);


////////////////////////////////////////////////////////////////////
/// Patterns initialization
////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// melodic patterns

~patternMel = [[0, 2, 0, 0, 1],
	[0, 5, 0, 4, 0, 3],
	[0, 5, 4, 0, 1],
	[0, 2, 1, 3, 2, 4],
	[4, 0, 3, 4, 2, 1, 4],
	[0, 2, 4, 0, 0, 2, 4, 0, 1, 0],
	[0, 1, 2, 3, 4, 0, 6, 6, 0],
	[3, 2, 1, 0, 6, 0],
	[4, 6, 5, 0, 5, 4, 6, 0],
	[2, 2, 2, 4, 2, 2, 0],
	[5, 6, 0, 6, 5, 4, 0]];
~octaveMel = [[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0],
	[1, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0],
	[0, 1, 0, 0, 0, 0, 0],
	[0, 0, 0, 1, 0, 0, 0, 1, 1, 1],
	[1, 1, 1, 1, 1, 1, 0, 0, 1],
	[1, 1, 1, 1, 0, 1],
	[0, 0, 0, 1, 0, 0, 0, 1],
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 1, 0, 0, 0, 1]];
~durMel = [[ 0.75, 0.25, 0.5, 0.08 , 2.42],
	[0.25, 0.5, 0.25, 0.5, 0.25, 2.25],
	[0.75, 1, 1.25, 0.08, 0.92],
	[0.5, 0.25, 0.5, 0.25, 1.8, 0.7],
	[0.25, 0.5, 0.08, 0.17, 0.5, 0.25, 2.25],
	[0.25, 0.25, 0.25, 0.5, 0.25, 0.25, 0.25, 0.08, 0.17, 1.75],
	[0.5, 0.5, 0.5, 0.25, 0.5, 0.5, 0.75, 0.08, 0.42],
	[0.25, 0.5, 0.5, 0.5, 0.5, 1.75],
	[1/3, 1/3, 1/3, 0.5, 0.25, 1.25, 0.08, 0.92],
	[0.25, 0.5, 0.75, 0.25, 0.5, 0.25, 1.5],
	[0.25, 0.75, 0.25, 0.75, 0.5, 0.75, 0.75]];
~soundMel = [\fm, \sawsynth];


~patternFmbell = [
	[0,4,1],
	[2,5,4],
	[4, 5, 2, 1]];
~durFmbell = [
	[1.25, 2.5, 0.75],
	[2.10, 1.85, 0.05],
	[2.2, 1.4, 2.8, 1.6]];


~patternKal = [
	[0, 6, 5, 4, 3, 2, 1, 0],
	[4, 0, 1, 2, 2, 3, 2, 1, 0],
	[0, 1, 0, 0, 1, 0, 0, 2, 0, 6, 0]];
~octaveKal = [
	[1, 0, 0, 0, 0, 0, 0, 0],
	[0, 1, 1, 1, 1, 1, 1, 1, 1],
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1]];
~durKal = [
	[0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 2.25],
	[0.25, 0.25, 0.25, 0.5, 0.08, 0.17, 0.25, 0.25, 2],
	[0.25, 0.25, 0.75, 0.25, 0.25, 1, 0.25, 0.25, 0.25, 0.25, 0.25]];


~patternGuitar = [
	[0, 1, 2, 4, 0, 6, 0],
	[4, 2, 1, 4, 0, 5, 4],
	[1, 0, 2, 4, 0]];
~octaveGuitar = [
	[0, 0, 0, 0, 1, 0, 1],
	[0, 0, 0, 0, 1, 0, 0],
	[1, 1, 1, 1, 1]];
~durGuitar = [
	[0.25, 0.25, 0.25, 0.25, 0.75, 0.5, 1.75],
	[0.25, 0.25, 0.25, 0.25, 0.5, 0.25, 2.25],
	[0.5, 0.5, 0.5, 0.75, 1.75]];

//////////////////////////////////////////////////////////////////////////////////////
// rhythmic patterns

~durHiHat = [
 //LYDIAN//
 [0.125,Rest(0.125),0.125,0.125, 0.25,0.25, 0.5, 0.25,0.25, 0.5, 0.25,0.25,1],
 [0.25,0.25, 0.5, 0.25,0.25, 0.5, 0.25,0.25, 0.5, 0.25,0.25, 0.5],

 //IONIAN//
 [0.25,0.25, 0.5, 0.25,0.25,Rest(0.25),0.25,Rest(0.25),0.25, 0.5, 0.5, 0.5],
 [0.25,0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25,0.25, 0.5],

//MIXOLYDIAN//
 [Rest(1),0.25, 0.25, 0.25, 0.25, 0.25, 0.25,0.5,0.25, 0.25, 0.25, 0.25],
 [0.5,0.25,0.25, 0.5, 0.5, 0.25,0.25, 0.5, 0.5, 0.5],

 //DORIAN//
 [0.2,Rest(0.2),0.2,0.2,Rest(0.6),0.2,0.2,Rest(0.2),0.2,Rest(0.2),0.2,0.2,Rest(1.2)],
 [0.2,Rest(0.2),0.2,Rest(0.2),0.2,Rest(0.2),0.2,Rest(0.2),0.2,Rest(0.2),0.2,Rest(0.2),0.2,0.2,Rest(0.2),0.2,0.2,0.2,0.2,Rest(0.2)],

 //AEOLIAN//
 [Rest(0.5), 0.625, 0.375, 0.5, 0.5, 0.625, 0.375, 0.5],
 [Rest(1),0.25,0.25, 0.5,Rest(1),0.25,0.25, 0.5],

 //PHRIGIAN//
 [0.25, Rest(0.25), 0.25, 0.25, Rest(0.25), 0.25, Rest(0.5), 0.25, Rest(0.25), 0.25, 0.25, Rest(0.25), 0.25, Rest(0.5)],
 [1, Rest(0.25), 0.25, Rest(0.5), 0.25, Rest(0.25), 0.25, 0.25, 0.5,0.5],

 //LOCRIAN//
 [1,1,1,1],
 [0.5,0.5,1,0.5,Rest(0.25),0.25,1]

];
~ampHiHat = [

//LYDIAN//
 [0.25,1,0.25,0.25, 1,0.25, 0.5, 0.25,0.25, 1, 0.25,0.25,1],
 [0.25,0.25, 1, 0.25,0.25, 1, 0.25,0.25, 1, 0.25,0.25, 1],

//IONIAN//
 [0.25,0.25, 1, 0.25, 0.25, 0.25, 1, 0.25,0.25, 1],
 [0.25,0.25, 1, 0.25,0.5,0.25,0.5,0.25,0.25,1],

//MIXOLYDIAN//
 [1,1, 0.25, 0.25,1, 0.25, 0.25,1,0.25, 1, 1, 0.25],
 [1,0.25,0.25, 1, 0.5, 0.25,0.25, 1, 0.5, 0.5],

//DORIAN//
 //[1,0,0.5,0,0.25,0.25,0,0.25,0.25,0,0.25,0.25,0,1,0,0.5,0,0.125,0.125,0,0.125,0.125,0,0.125],
 //[0.25,0.25,1,0.5,0.5,0.5,0.5,0.25,0.25,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5],
 [1,0,0.25,0.25,0,1,0.25,0,1,0,0.25,0.25,0],
 [1,0,0.25,0,1,0,0.25,0,1,0,1,0,0.25,0.25,0,1,0.25,1,1,0],

 //AEOLIAN//
 [0, 0.25, 1, 0.1, 0, 0.25, 1, 0.1],
 [1,1,0.25, 0.25,1,1,0.25, 0.25],

 //PHRIGIAN//
 [1, 0, 0.25, 0.25, 0, 0.25, 0, 1, 0, 0.25, 0.25, 0, 0.25, 0],
 [1, 0, 0.25, 0, 0.25, 0, 0.25, 0.25, 1,0.25],

 //LOCRIAN//
 [1,0.25,1,0.25],
 [0.25,1,0.25,1,0,0.25,1]

];



~durGhostSnare = [
 //LYDIAN//
 [Rest(1.25),0.25,0.25,0.25,Rest(0.25),0.25,Rest(0.25),0.25,Rest(1)],
 [Rest(1),Rest(0.25),0.25,0.25,0.25,Rest(0.25),0.25,0.25,Rest(0.25),Rest(0.25),0.25,0.25,0.25],

//IONIAN//
 [Rest(1.75),0.25,Rest(0.25),0.25,0.25,Rest(1.25)],
 [Rest(4)],

//MIXOLYDIAN//
 [Rest(1.25),0.25,0.25,0.25,Rest(1.25),0.25,0.25,0.25],
 [Rest(0.25),0.25,Rest(0.25),0.25,Rest(1.25),0.25,Rest(0.25),0.25,Rest(1)],

//DORIAN//
 //[Rest(0.125),0.125,0.125,Rest(0.125),0.125,0.125,Rest(0.625),0.125,Rest(0.25),0.125,0.125,Rest(0.125),0.125,0.125,Rest(0.125),0.125,0.125,0.125,0.125,Rest(0.375),0.125,Rest(0.25),0.125,Rest(0.125)],
 //[Rest(0.875),0.125,Rest(0.125),0.125,Rest(0.125),0.125,Rest(0.875),0.125,Rest(0.125),0.125,0.25,Rest(0.125),0.125,Rest(0.125),0.125,Rest(0.5)],
 [Rest(0.2),0.2,Rest(0.4),0.2,Rest(0.2),0.2,Rest(0.4),0.2,Rest(0.2),0.2,Rest(0.4),0.2,Rest(0.2),0.2,0.2,0.2,0.2],
 [Rest(0.2),0.2,Rest(0.6),Rest(1),Rest(0.2),0.2,Rest(0.6),Rest(0.8),0.2],

 //AEOLIAN//
 [Rest(4)],
 [Rest(4)],

 //PHRIGIAN//
 [Rest(0.25), 0.25, Rest(1), 0.25, 0.25, Rest(0.25), 0.25, Rest(1), 0.25, 0.25],
 [0.25, Rest(1.25), 0.25, 0.25, Rest(0.25), 0.25, Rest(1.125),0.125, 0.125, 0.125],

 //LOCRIAN//
 [Rest(3.25),0.25,Rest(0.5)],
 [Rest(1.75),0.25,Rest(1.25),0.25,Rest(0.25),0.25]

];
~ampGhostSnare = [

//LYDIAN//
 [1,0.1,0.1,0.1,1,0.1,1,0.25,1],
 [0,0,0.1,0.1,0.1,0,0.1,0.1,0,0,0.1,0.1,0.1],

//IONIAN//
 [1,0.1,1,0.1,0.1,1],
 [1],

//MIXOLYDIAN//
 [1,0.1,0.1,0.1,1,0.1,0.1,0.1],
 [0,0.1,0,0.1,0,0.1,0,0.1,0],

//DORIAN//
 //[0,0.1,0.2,0,0.1,0.2,0,0.2,0,0.1,0.2,0,0.1,0.2,0,0.1,0.1,0.2,0.2,0,0.1,0,0.2,0],
 //[0,0.1,0,0.1,0,0.1,0,0.1,0,0.1,0.5,0,0.1,0,0.1,0],
 [0,0.1,0,0.1,0,0.1,0,0.1,0,0.1,0,0.1,0,0.1,0.5,0.1,0.1],
 [0,0.1,0,0,0,0.1,0,0,0.1],

 //AEOLIAN//
 [1],
 [1],

 //PHRIGIAN//
 [0, 0.1, 0, 0.1, 0.1, 0, 0.1, 0, 0.1, 0.1],
 [0.1, 0, 0.1, 0.1, 0, 0.1, 0,0.1, 0.1, 0.1],

 //LOCRIAN//
 [0,0.1,0],
 [0,0.1,0,0.1,0,0.1]

];



~durSnare = [
 //LYDIAN//
 [Rest(1), 1, Rest(1), 1],
 [Rest(1), 1, Rest(1), 1],

 //IONIAN//
 [Rest(1), 1, Rest(1), 1],
 [Rest(1), 1, Rest(1), 1],

 //MIXOLYDIAN//
 [Rest(1), 1, Rest(1), 1],
 [Rest(1), 1, Rest(1), 1],

 //DORIAN//
 [Rest(1), 1, Rest(1), 1],
 [Rest(1), 1, Rest(1), 1],

 //AEOLIAN//
 [Rest(1), 1, Rest(1), 1],
 [Rest(1), 1, Rest(1), 1],

 //PHRIGIAN//
 [Rest(1), 1, Rest(1), 1],
 [Rest(1), 1, Rest(1), 1],

 //LOCRIAN//
 [Rest(2),1,Rest(1)],
 [Rest(2),1,Rest(1)]

];




~durKick = [
//LYDIAN//
 [0.5,0.5,Rest(0.25),0.25,Rest(0.5),0.5,Rest(0.25),0.25,Rest(1)],
 [0.5,0.5, Rest(1), 0.75,0.25, Rest(1)],

//IONIAN//
 [0.25,Rest(0.5),0.25, Rest(1), 1, Rest(1)],
 [0.5,0.5, Rest(1.25),0.25,Rest(0.25),0.25, Rest(1)],

//MIXOLYDIAN//
 [Rest(1.25),0.25,Rest(0.5),0.5,0.5,Rest(1)],
 [1.25,0.25,Rest(0.5),0.25,0.25,Rest(1.5)],

//DORIAN//
 [0.2,Rest(0.2),0.2,Rest(0.4),Rest(0.4),0.2,Rest(0.4),0.2,Rest(0.2),0.2,Rest(0.4),Rest(0.4),0.2,Rest(0.4)],
 [0.2,Rest(0.2),0.2,0.2,Rest(0.2),Rest(0.6),0.2,Rest(0.2),0.2,Rest(0.2),0.2,0.2,Rest(0.2),Rest(0.4),0.2,Rest(0.4)],

 //AEOLIAN//
 [1, Rest(1), 1, Rest(1)],
 [Rest(2),0.25,0.25,Rest(1.5)],

//PHRIGIAN//
 [1, Rest(0.25), 0.75, 1, Rest(0.25), 0.75],
 [Rest(0.25),0.25,0.25,Rest(0.5),0.25,Rest(0.5),0.25,0.25,Rest(1.5)],

//LOCRIAN//
 [1,Rest(3)],
 [0.25,0.25,Rest(0.25),0.25,Rest(3)]

 ];


////////////////////////////////////////////////////////////////////
/// Parameters initialization
////////////////////////////////////////////////////////////////////

~scale = \ionian;
~bpm = 60;
TempoClock.default.tempo = ~bpm/60;

~master = 1;
~volMel = 1;
~volFmbell = 1;
~volKal = 1;
~volGuitar = 1;
~volBell = 1;
~volPadBass = 1;
~volPadChords = 1;
~volHiHat = 1;
~volGhostSnare = 1;
~volSnare = 1;
~volKick = 1;

~lpf = 20000;
~hpf = 0;
~hpfbass = 0;

~dw = 0;
~dwDrums = 0;

~personaltemp = 24;
~realtemp = 0;
~realhum = 0;
~realrain = 0;
~reallight = 0;
~realwind = 0;

~ard_temp = 0;
~ard_hum = 0;
~ard_wind = 0;
~ard_rain = 0;
~ard_light = 0;

~ptemp = 0.8;
~phum = 0.5;
~plight = 0.3;
~pwind = 0.4;
~prain = 1.2;
~ptime = 1;
~date = Date.localtime.format("%H%M").asInteger;

~ptot = ~ptemp+~phum+~plight+~pwind+~prain;

~mood = 0;





////////////////////////////////////////////////////////////////////////////

////// SYNTHDEFS

////////////////////////////////////////////////////////////////////////////




SynthDef.new(\fm, {
	| freq = 200, mRatio = 1, cRatio = 1, modAmp = 20, atk = 0.01, rel = 1, c0 = 1, c1 = (-1), amp = 1, pan = 0, out= 0 , oct = 0, vol = 1, lpf = 20000, hpf = 0, dw = 0.33, room = 1, damp = 0.5 |
	var car, mod, env, sig;

	env = Env([0,1,0],[atk,rel],[c0,c1]).kr(2);
	mod = SinOsc.ar(freq*(2**oct)*mRatio,mul:modAmp);
	car = SinOsc.ar(freq*(2**oct)*cRatio + mod)*env*amp*vol;
	car = Pan2.ar(car, pan);
	sig = HPF.ar(LPF.ar(car, lpf), hpf);
	Out.ar(out, FreeVerb.ar(sig, dw, room, damp));
}).add;


SynthDef(\bell, {
	| freq = 556, findex = 0, frate = 2, dur = 5, pos = 0, amp = 0.25, out = 0, vol = 1, lpf = 20000, hpf = 0 |
	var sigA, sigB, sigC, sig, env, fmod;

	env = EnvGen.ar(Env.triangle(5), doneAction:2);
	fmod = findex * SinOsc.kr(frate, mul:0.5, add:0.5) * Line.kr(0, 1, 7);
	sigA = Pulse.ar(freq + fmod, LFNoise2.kr(1).range(0.2, 0.8) );
	sigB = VarSaw.ar(freq + fmod);
	sigC = WhiteNoise.ar() * 0.125;
	sig = SelectX.ar(LFNoise2.kr(2).range(0, 2), [sigA, sigB, sigC]);
	sig = LPF.ar(sig, freq*4 );
	sig = HPF.ar(LPF.ar(sig*env, lpf), hpf);
	Out.ar(out, Pan2.ar(sig*amp*vol, pos));
}).add;


SynthDef(\sawsynth, {
	| freq = 440, amp = 0.1, att = 0.1, rel = 2, lofreq = 1000, hifreq = 3000, oct = 0, vol = 1, lpf = 20000, hpf = 0, dw = 0.33, room = 1, damp = 0.5 |
    var env, snd, sig;

    env = Env.perc(
		attackTime: att,
		releaseTime: rel,
	).kr(doneAction: 2);
	snd = Saw.ar(freq: freq *(2**oct)* [0.99, 1, 1.001, 1.008], mul: env);
	snd = LPF.ar(snd, LFNoise2.kr(1).range(lofreq, hifreq));
    snd = Splay.ar(snd)*amp*vol;
	sig = HPF.ar(LPF.ar(snd, lpf), hpf);
	Out.ar(0, FreeVerb.ar(sig, dw, room, damp));
}).add;


SynthDef(\pad, {
	| freq = 440, s = 3, amp = 1, sus = 4, vol = 1, lpf = 20000, hpf = 0 |
	var freqs, gen, fmod, rqmod, modspeed, snd, env, sig;

	freqs = { freq * LFNoise2.kr(freq:1,mul:0.01,add:1) }!24;
	gen = LFSaw.ar(freq:freqs) * 0.1;
	fmod = 1;
	rqmod = LFNoise2.kr(freq:1/8).range(0.1,1.0);
	modspeed = 1/s;
	snd = RLPF.ar(in:gen, freq:SinOsc.kr(modspeed).range(freqs*0.8, freqs*1.2) * fmod, rq:rqmod);
	env =  EnvGen.ar(Env.triangle(sus), doneAction:2);
	sig = HPF.ar(LPF.ar(env*Splay.ar(snd)*amp*vol, lpf), hpf);
	Out.ar(0, sig);
}).add;


SynthDef(\fmbell, {
	| out = 0, amp = 0.1, gate = 1, pan = 0, freq = 200, vol = 1, lpf = 20000, hpf = 0 |
	var sig, sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;

	freq = freq * EnvGen.kr(Env([1,1.002,0.998,1],[0.1,0.8]), 1);
	sig1 = SinOsc.ar(freq * 2.6706 + 0.13) * 2 + 1;
	sig2 = SinOsc.ar(freq * 0.9998 * sig1);
	sig3 = SinOsc.ar(freq * 2.6629 * sig1 + 2.04);
	sig4 = LFCub.ar(freq * 0.9991 * sig1 + 2.14);
	sig5 = SinOsc.ar(freq * 2.6656 * sig1 - 2);
	sig6 = SinOsc.ar(freq * 1 * sig1 + 1.84);

	sig = [sig1, sig2, sig3, sig4, sig5, sig6] * DC.ar([0,0.5,0.5, 0.5,0.5,0.5]);
	sig = sig * EnvGen.ar(\adsr.kr( Env.adsr(0.01,0,1,2.1,1,-1) ),gate,doneAction:2);
	sig = Pan2.ar(sig, pan + [ 0, -0.5, -0.5, 0.5, 0.5, 0]).sum;
	sig = HPF.ar(LPF.ar(sig, lpf), hpf);
	Out.ar(out, sig * amp * vol);
}).add;


SynthDef(\kalimba, {
    |out = 0, freq = 440, amp = 1, mix = 0.05, relMin = 2.5, relMax = 3.5, oct = 0, vol = 1, lpf = 20000, hpf = 0, dw = 0.33, room = 1, damp = 0.5 |
    var snd, sig;

	snd = SinOsc.ar(freq * (2**oct)) * EnvGen.ar(Env.perc(0.005, Rand(relMin, relMax), 1, -8), doneAction: 2);
    snd = ((snd * (1 - mix)) + (DynKlank.ar(`[
        [240*ExpRand(0.9, 1.1), 2020*ExpRand(0.9, 1.1), 3151*ExpRand(0.9, 1.1)],
        [-7, 0, 3].dbamp,
        [0.8, 0.05, 0.07]
	], PinkNoise.ar * EnvGen.ar(Env.perc(0.001, 0.01))) * mix));
	sig = HPF.ar(LPF.ar(snd, lpf), hpf);
	Out.ar(out, Pan2.ar(FreeVerb.ar(sig, dw, room, damp), 0)*amp*vol*(~master));
}).add;


SynthDef(\hihat, {
	| out, bufnum, amp = 1, rate = 1, vol = 1, lpf = 20000, hpf = 0, dw = 0.33, room = 0.5, damp = 0.5 |
    var sig, env;

	sig = PlayBuf.ar(1, bufnum,
        rate: rate * BufRateScale.kr(bufnum));
    env = EnvGen.kr(Env.linen(0.01, 0.25, 0.05),
        doneAction: Done.freeSelf);
	sig = HPF.ar(LPF.ar(sig, lpf), hpf);
	sig = FreeVerb.ar(sig, dw, room, damp);
    Out.ar(out, (sig * env * amp * vol).dup);
}).add;


SynthDef(\ghostsnare, {
	| out, bufnum, amp = 1, rate = 1, vol = 1, lpf = 20000, hpf = 0, dw = 0.33, room = 0.5, damp = 0.5 |
    var sig, env;

	sig = PlayBuf.ar(1, bufnum,
        rate: rate * BufRateScale.kr(bufnum));
    env = EnvGen.kr(Env.linen(0.01, 0.5, 0.05),
        doneAction: Done.freeSelf);
	sig = HPF.ar(LPF.ar(sig, lpf), hpf);
	sig = FreeVerb.ar(sig, dw, room, damp);
    Out.ar(out, (sig * env * amp * vol).dup);
}).add;


SynthDef(\snare, {
	| out, bufnum, amp = 1, rate = 1, vol = 1, lpf = 20000, hpf = 0, dw = 0.33, room = 0.5, damp = 0.5 |
    var sig, env;

	sig = PlayBuf.ar(1, bufnum,
        rate: rate * BufRateScale.kr(bufnum));
    env = EnvGen.kr(Env.linen(0.01, 0.5, 0.05),
        doneAction: Done.freeSelf);
	sig = HPF.ar(LPF.ar(sig, lpf), hpf);
	sig = FreeVerb.ar(sig, dw, room, damp);
    Out.ar(out, (sig * env * amp * vol).dup);
}).add;


SynthDef(\kick, {
    |out = 0, pan = 0, amp = 0.3, vol = 1, lpf = 20000, hpf = 0, dw = 0.33, room = 0.5, damp = 0.5 |
    var body, bodyFreq, bodyAmp;
    var pop, popFreq, popAmp;
    var click, clickAmp;
    var snd;

    bodyFreq = EnvGen.ar(Env([261, 120, 51], [0.035, 0.08], curve: \exp));
    bodyAmp = EnvGen.ar(Env.linen(0.005, 0.1, 0.3), doneAction: 2);
    body = SinOsc.ar(bodyFreq) * bodyAmp;
    popFreq = XLine.kr(750, 261, 0.02);
    popAmp = EnvGen.ar(Env.linen(0.001, 0.02, 0.001)) * 0.15;
    pop = SinOsc.ar(popFreq) * popAmp;
    clickAmp = EnvGen.ar(Env.perc(0.001, 0.01)) * 0.15;
    click = LPF.ar(Formant.ar(910, 4760, 2110), 3140) * clickAmp;

    snd = body + pop + click;
    snd = snd.tanh;
	snd = HPF.ar(LPF.ar(snd, lpf), hpf);
	snd = FreeVerb.ar(snd, dw, room, damp);

    Out.ar(out, Pan2.ar(snd, pan, amp)*vol);
}).add;


SynthDef(\guitar, {
	| out = 0, freq = 440, pan = 0, sustain = 0.5, amp = 0.5, vol = 1, lpf = 20000, hpf = 0, oct = 0, dw = 0.33, room = 1, damp = 0.5 |
	var pluck, period, string;

	freq = (freq*(2**oct)/2) * (0.007*SinOsc.ar(Line.ar(0, 4, 2))+1);
	pluck = PinkNoise.ar(Decay.kr(Impulse.kr(0.005), 0.05));
	period = freq.reciprocal;
	string = CombL.ar(pluck, period, period, sustain*6);
	string = LeakDC.ar(LPF.ar(Pan2.ar(string, pan), 7000));
	string = HPF.ar(LPF.ar(string, lpf), hpf);
	DetectSilence.ar(string, doneAction:2);
	Out.ar(out, FreeVerb.ar(string * amp * vol, dw, room, damp))
}).add;

)



////////////////////////////////////////////////////////////////////////////

////// ARDUINO

////////////////////////////////////////////////////////////////////////////

(
OSCdef('OSCreceiver',
	{
		arg msg;

		~master = msg[1]/100;
		~personaltemp = msg[2];
}, "/values", recvPort: 13000)
)


SerialPort.devices;
~port = SerialPort.new("COM3", 9600);
(
(

////////////////////////////////////////////////////////////////////
///  Routine for data acquisition and parameters manipulation
////////////////////////////////////////////////////////////////////

~charArray = [];
~getValues = Routine.new(
	{ var ascii;

		///////////////////////////////////////////////////////////
		/// Acquisition and normalization

		{ascii = ~port.read.asAscii;
			if(ascii.isDecDigit,{
				~charArray = ~charArray.add(ascii);
			});
			if(ascii == $a,{
				~realtemp = ~charArray.collect(_.digit).convertDigits;
				("volume = " + ~master).postln;
				("Scale = " + ~scale).postln;
				("Temperatura =" + ~realtemp + "/" + ~personaltemp).postln;
				~ard_temp = abs(~personaltemp - ~realtemp) / 15;
				if(~ard_temp > 1, {~ard_temp = 1});
				~charArray = [ ];
			});
			if(ascii == $b,{
				~realhum = ~charArray.collect(_.digit).convertDigits;
				("Humidity =" + ~realhum).postln;
				~ard_hum = abs(50 - ~realhum) / 50;
				if(~ard_hum > 1, {~ard_hum = 1});
				~charArray = [ ];
			});
			if(ascii == $c,{
				~realrain = ~charArray.collect(_.digit).convertDigits;
				("Rain =" + ~realrain).postln;
				~ard_rain = abs(600 - ~realrain) / 400;
				if(~ard_rain > 1, {~ard_rain = 1});
				~charArray = [ ];
			});
			if(ascii == $d,{
				~reallight = ~charArray.collect(_.digit).convertDigits;
				("Light =" + ~reallight).postln;
				~ard_light = abs(1010 - ~reallight) / 200;
				if(~ard_light > 1, {~ard_light = 1});
				~charArray = [ ];
				~date = Date.localtime.format("%H%M").asInteger;
				("Date =" + ~date).postln;
				if((~date >= 2000) || ((~date >= 0) && (~date < 800)), {~ptime = 0;}, {~ptime = 1;});
			});
			if(ascii == $e,{
				~realwind = ~charArray.collect(_.digit).convertDigits;
				("Wind =" + ~realwind).postln;
				~ard_wind = (~realwind) / 10;
				if(~ard_wind > 1, {~ard_wind = 1});
				~charArray = [ ];

				~host = NetAddr("localhost", 12000);
				~host.sendMsg("/ueue", ~scale, ~realtemp.asString, ~realhum.asString, ~realrain.asString, ~reallight.asString, ~realwind.asString, ~date.asString);
				~host = s.addr;

				// mood computation
				~mood = ((~ptemp*~ard_temp) + (~phum*~ard_hum) + (~prain*~ard_rain) + (~plight*(~ard_light*~ptime)) + (~pwind*~ard_wind)) / (~ptot - (~plight*(1-(~ptime))));
			});



			// scale
			~scale = case
			{~mood < (1/7)} {\lydian}
			{(~mood >= (1/7)) && (~mood < (2/7))} {\ionian}
			{(~mood >= (2/7)) && (~mood < (3/7))} {\mixolydian}
			{(~mood >= (3/7)) && (~mood < (4/7))} {\dorian}
			{(~mood >= (4/7)) && (~mood < (5/7))} {\aeolian}
			{(~mood >= (5/7)) && (~mood < (6/7))} {\phrygian}
			{~mood >= (6/7)} {\locrian};


			// bpm
			~bpm = 60 + (40*~ard_wind); //range[60,100]
			TempoClock.default.tempo = ~bpm/60;


			// instruments
			if((~ptime == 1), {
				case
			{~ard_light < (1/7)} {~volMel = 1; ~volFmbell = 1; ~volKal = 1; ~volGuitar = 1; ~volBell = 1; ~volHiHat = 1; ~volGhostSnare = 1; ~volSnare = 1; ~volKick = 1;}
			{~ard_light > (1/7) && ~ard_light < (2/7)} {~volMel = 1; ~volFmbell = 0; ~volKal = 1; ~volGuitar = 1; ~volBell = 1; ~volHiHat = 1; ~volGhostSnare = 1; ~volSnare = 1; ~volKick = 1;}
			{~ard_light > (2/7) && ~ard_light < (3/7)} {~volMel = 1; ~volFmbell = 0; ~volKal = 0; ~volGuitar = 1; ~volBell = 1; ~volHiHat = 1; ~volGhostSnare = 1; ~volSnare = 1; ~volKick = 1;}
			{~ard_light > (3/7) && ~ard_light < (4/7)} {~volMel = 1; ~volFmbell = 0; ~volKal = 0; ~volGuitar = 0; ~volBell = 1; ~volHiHat = 1; ~volGhostSnare = 1; ~volSnare = 1; ~volKick = 1;}
			{~ard_light > (4/7) && ~ard_light < (5/7)} {~volMel = 1; ~volFmbell = 0; ~volKal = 0; ~volGuitar = 0; ~volBell = 0; ~volHiHat = 1; ~volGhostSnare = 1; ~volSnare = 1; ~volKick = 1;}
			{~ard_light > (5/7) && ~ard_light < (6/7)} {~volMel = 1; ~volFmbell = 0; ~volKal = 0; ~volGuitar = 0; ~volBell = 0; ~volHiHat = 0.5; ~volGhostSnare = 0.5; ~volSnare = 0.5; ~volKick = 0.5;}
			{~ard_light > (6/7)} {~volMel = 0; ~volFmbell = 0; ~volKal = 0; ~volGuitar = 0; ~volBell = 0; ~volHiHat = 0.5; ~volGhostSnare = 0.5; ~volSnare = 0.5; ~volKick = 0.5;};
			},
			{
				~volMel = 0; ~volFmbell = 0; ~volKal = 0; ~volGuitar = 0; ~volBell = 0; ~volHiHat = 0; ~volGhostSnare = 0; ~volSnare = 0; ~volKick = 0;
			});


			// LPF/HPF
			~tempfilt = (~personaltemp - ~realtemp) / 15;

			case
			{~tempfilt < 0} {
				if((~tempfilt < (-1)), {~tempfilt = (-1)});
				~hpf = 0;
				~hpfbass = 0;
				~lpf = 1200 + (18800*(1-log10((9*(abs(~tempfilt)))+1)));

			}
			{~tempfilt >= 0} {
				if((~tempfilt > 1), {~tempfilt = 1});
				~lpf = 20000;
				~hpfbass = 100 * ((2**(~tempfilt))-1);
				~hpf = 1200 * ((2**(~tempfilt))-1);
			};




			// reverb
			~humdw = case
			{~realhum < 45} {0}
			{~realhum >= 45} {(~realhum - 45) / 55};
			~dw = 0.5*~humdw; ~dwDrums = 0.3*~humdw;
	}.loop;}
).play;)
)



////////////////////////////////////////////////////////////////////////////

////// ROUTINE

////////////////////////////////////////////////////////////////////////////


(

//////////////////////////////////////////////////////////////////////////////
/// Melodic section
//////////////////////////////////////////////////////////////////////////////

Routine{
	loop{
		var rand = ~patternMel.size.rand;
		var playPat = ~patternMel[rand];
		var playDur = ~durMel[rand];
		var octave = ~octaveMel[rand];
		var loopdur = 0;
		var melodynow = ~soundMel.choose;

		for(0, playDur.size-1, {arg i; loopdur = loopdur + playDur[i]});
			Pbind(
			\instrument, melodynow,
			\freq, Pseq(440 * (2**(Scale.at(~scale).degrees[playPat]/12)), 1),
		    \dur, Pseq(playDur, 1),
			\oct, Pseq(octave, 1),
			\amp, 0.2,
			\vol, ~volMel*(~master),
			\lpf, ~lpf,
			\hpf, ~hpf,
			\dw, ~dw,
			).play;
		loopdur.wait;
		[0, 0, 4].choose.wait;
	}
}.play;

Routine{
	loop{
		var rand = ~patternFmbell.size.rand;
		var playPat = ~patternFmbell[rand];
		var playDur = ~durFmbell[rand];
		var loopdur = 0;

		[8, 9, 10, 11, 12].choose.wait;
		for(0, playDur.size-1, {arg i; loopdur = loopdur + playDur[i]});
			Pbind(
			\instrument, \fmbell,
			\freq, Pseq(220 * (2**(Scale.at(~scale).degrees[playPat]/12)), 1),
		    \dur, Pseq(playDur, 1),
			\octave, 4,
			\sustain, 0.1,
			\amp, 0.035,
			\vol, ~volFmbell*(~master),
			\lpf, ~lpf,
			\hpf, ~hpf
			).play;
		loopdur.value.wait;
	}
}.play;


Routine{
	loop{
		var rand = ~patternKal.size.rand;
		var playPat = ~patternKal[rand];
		var playDur = ~durKal[rand];
		var octave = ~octaveKal[rand];
		var loopdur = 0;

		[8, 9, 10, 11, 12].choose.wait;
		for(0, playDur.size-1, {arg i; loopdur = loopdur + playDur[i]});
			Pbind(
			\instrument, \kalimba,
			\freq, Pseq(880 * (2**(Scale.at(~scale).degrees[playPat]/12)), 1),
		    \dur, Pseq(playDur, 1),
			\oct, Pseq(octave, 1),
			\amp, 0.05,
			\vol, ~volKal*(~master),
			\lpf, ~lpf,
			\hpf, ~hpf,
			\dw, ~dw
			).play;
		loopdur.value.wait;
	}
}.play;


Routine{
	loop{
		var rand = ~patternGuitar.size.rand;
		var playPat = ~patternGuitar[rand];
		var playDur = ~durGuitar[rand];
		var octave = ~octaveGuitar[rand];
		var loopdur = 0;

		[4, 6, 8, 10].choose.wait;
		for(0, playDur.size-1, {arg i; loopdur = loopdur + playDur[i]});
			Pbind(
			\instrument, \guitar,
			\freq, Pseq(440 * (2**(Scale.at(~scale).degrees[playPat]/12)), 1),
		    \dur, Pseq(playDur, 1),
			\oct, Pseq(octave, 1),
			\amp, 0.3,
			\vol, ~volGuitar*(~master),
			\lpf, ~lpf,
			\hpf, ~hpf,
			\dw, ~dw
			).play;
		loopdur.wait;
	}
}.play;


//////////////////////////////////////////////////////////////////////////////
/// Harmonic section
//////////////////////////////////////////////////////////////////////////////

Routine {
	loop {
		Synth(\bell,
			[\freq, 220 * (2**(Scale.at(~scale).degrees.choose/12)),
				\amp, 0.1,
				\vol, ~volBell*(~master),
				\lpf, ~lpf,
				\hpf, ~hpf]);
		[1, 2, 4].choose.wait;
	}
}.play;



Routine {
	loop {
	    var gates = Array.fill(7, {2.rand});
		var sus = [4, 8].choose;
		Synth(\pad,
			[\freq, 55 * (2**(Scale.at(~scale).degrees[[0, 3, 4].choose]/12)),
				\sus, sus+1,
				\amp, 1.5,
				\lpf, ~lpf,
				\hpf, ~hpfbass,
				\vol, ~volPadBass*(~master)]);
		gates.do { |gate, i|
			if(gate == 1, {
				Synth(\pad,
					[\freq, 440 * (2**(Scale.at(~scale).degrees[i]/12)),
						\amp, 0.4,
						\vol, ~volPadChords*(~master),
						\lpf, ~lpf,
						\hpf, ~hpf,
						\sus, sus+1]);
			});
		};
		sus.value.wait;
	}
}.play;


//////////////////////////////////////////////////////////////////////////////
/// Rythmic section
//////////////////////////////////////////////////////////////////////////////

Routine{
	loop{
		var rand = case
		{~scale == \lydian} {[0, 1].choose}
		{~scale == \ionian} {[2, 3].choose}
		{~scale == \mixolydian} {[4, 5].choose}
		{~scale == \dorian} {[6, 7, 8].choose}
		{~scale == \aeolian} {[9, 10].choose}
		{~scale == \phrygian} {[11, 12].choose}
		{~scale == \locrian} {[13, 14].choose};
		var playDurHiHat = ~durHiHat[rand];
		var playDurGhostSnare = ~durGhostSnare[rand];
		var playDurSnare = ~durSnare[rand];
		var playDurKick = ~durKick[rand];
		var ampHiHat = ~ampHiHat[rand];
		var ampGhostSnare = ~ampGhostSnare[rand];
		var loopdur = 0;
		for(0, playDurHiHat.size-1, {arg i; loopdur = loopdur + playDurHiHat[i]});
		Ppar([
			Pbind(
				\instrument, \hihat,
				\dur, Pseq(playDurHiHat, 1),
				\bufnum, ~bufHiHat,
				\amp, Pseq(ampHiHat*0.2, 1),
				\lpf, ~lpf,
				\hpf, ~hpf,
				\vol, ~volHiHat*(~master),
				\dw, ~dwDrums
			),
			Pbind(
				\instrument, \ghostsnare,
				\dur, Pseq(playDurGhostSnare, 1),
				\bufnum, ~bufGhostSnare,
				\amp, Pseq(ampGhostSnare*0.25, 1),
				\lpf, ~lpf,
				\hpf, ~hpf,
				\vol, ~volGhostSnare*(~master),
				\dw, ~dwDrums
			),
			Pbind(
				\instrument, \snare,
				\dur, Pseq(playDurSnare, 1),
				\bufnum, ~bufSnare,
				\amp, 0.2,
				\lpf, ~lpf,
				\hpf, ~hpf,
				\vol, ~volSnare*(~master),
				\dw, ~dwDrums
			),
			Pbind(
				\instrument, \kick,
				\dur, Pseq(playDurKick, 1),
				\lpf, ~lpf,
				\hpf, ~hpfbass,
				\vol, ~volKick*(~master),
				\dw, ~dwDrums
			)
		], 1).play;
		loopdur.value.wait;
	}
}.play;

)













