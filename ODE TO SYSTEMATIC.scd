

// ''ODE TO SYSTEMATIC PATIENCE'' by JIM TSAKIRIDIS



//s.options.device = "ASIO : ASIO4ALL v2";
//s.boot


// A)SynthDefs :

(
SynthDef(\violin, {
	| midinote=60, gate=1, amp=1, pos = 0 |
	var env = EnvGen.kr(Env.asr(0.5, 1, 0.4), gate, doneAction:2);
	var sig = VarSaw.ar(
		midinote.midicps,
		width:LFNoise2.kr(1).range(0.2, 0.8)*SinOsc.kr(5, Rand(0.0, 1.0)).range(0.7,0.8))*0.5;
	sig = sig * env * amp;
	Out.ar(55, Pan2.ar(sig, (MouseX.kr(-1, 1))
))}).add;
)



(
SynthDef(\violin2, {
	| midinote=60, gate=1, amp=0.1, pos = 0 |
	var env = EnvGen.kr(Env.asr(0.8, 1, 0.4), gate, doneAction:2);
	var sig = VarSaw.ar(
		midinote.midicps,
		width:LFNoise2.kr(1).range(0.2, 0.8)*SinOsc.kr(5, Rand(0.0, 1.0)).range(0.7,0.8))*0.5;
	sig = sig * env * amp;

	Out.ar(1, Pan2.ar(sig, (MouseX.kr(1, -1))
))}).add;
)



(
SynthDef(\sawSynth, { arg freq = 440, amp = 1, att = 0.1, rel = 2, lofreq = 1000, hifreq = 19000;
	var env, snd;
	env = Env.perc(
		attackTime: att,
		releaseTime: rel,
		level: amp
	).kr(doneAction: 2);
	snd = Saw.ar(freq: freq * [0.99, 1, 1.001, 1.008], mul: env);
	snd = LPF.ar(
		in: snd,
		freq: LFNoise2.kr(1).range(lofreq, hifreq)
	);
	snd = Splay.ar(snd);
	Out.ar(55, snd);
	Out.ar(00, BLowPass.ar(snd, (MouseY.kr(300, 19000))))
}).add;
)


(
SynthDef(\prophet5pwmstrings,{|out= 0 freq = 440 amp = 0.1 gate=1 lforate = 10 lfowidth= 0.5 cutoff= 3000 rq=0.3 pan = 0|

	var lfo, pulse, filter, env;

	lfo = LFTri.kr(lforate*[0,0.01],Rand(0,2.0)!2);

	pulse = Pulse.ar(freq*[1],lfo*lfowidth+0.1);

	filter = RLPF.ar(pulse,cutoff,rq);

	env = EnvGen.ar(Env.adsr(0.8,0.0,1.0,0.8),gate,doneAction:2);

	Out.ar(55,Pan2.ar(Mix(filter)*env*amp*0.2, (MouseX.kr(1, -1))))

}).add;
)






// B) Pbinds :

((
	t = TempoClock(120/60);
	a = Pbind(\instrument, \violin,
		j = [6, 7, 9, 7, 6, 4, 2, 2, 4, 6, 6, 4, 4, 6, 6, 7, 9, 9, 7, 6, 4, 2, 2, 4, 6, 4, 2, 2, 4, 6, 2, 4, 6, 7, 6, 2, 4, 6, 7, 6, 4, 2, 4, -3, 6, 7, 9, 9, 7, 6, 4, 2, 2, 4, 6, 4, 2, 2];
		\note, Pseq(j, inf),
		\dur, Pseq([2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 3/2, 1/2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3/2, 1/2, 2, 2, 1, 1, 1, 1/2, 1/2, 1, 1, 1, 1/2, 1/2, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3/2, 1/2, 2], inf),
		\amp, Pseq([0.2, 0.3, 0.3, 0.3, 0.3, 0.3, 0.5, 0.5, 0.3, 0.3, 0.4, 0.4, 0.4, 0.2, 0.2, 0.3, 0.3, 0.4, 0.3, 0.3, 0.2, 0.5, 0.5, 0.3, 0.3, 0.5, 0.4, 0.4, 0.5, 0.4, 0.4, 0.5, 0.2, 0.2, 0.3, 0.3, 0.4, 0.3, 0.3, 0.4, 0.4, 0.5, 0.5, 0.6, 0.5, 0.3, 0.3, 0.4, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.4, 0.4, 0.4], inf),
		\legato, 0.9)
))


((
	t = TempoClock(120/60);
	b = Pbind(\instrument, \violin2,
		j = [6, 7, 9, 7, 6, 4, 2, 2, 4, 6, 6, 4, 4, 6, 6, 7, 9, 9, 7, 6, 4, 2, 2, 4, 6, 4, 2, 2, 4, 6, 2, 4, 6, 7, 6, 2, 4, 6, 7, 6, 4, 2, 4, -3, 6, 7, 9, 9, 7, 6, 4, 2, 2, 4, 6, 4, 2, 2];
		\note, Pseq(j + 12, inf),
		\dur, Pseq([2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 3/2, 1/2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3/2, 1/2, 2, 2, 1, 1, 1, 1/2, 1/2, 1, 1, 1, 1/2, 1/2, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3/2, 1/2, 2], inf),
		\amp, Pseq([0.2, 0.3, 0.3, 0.3, 0.3, 0.3, 0.5, 0.5, 0.3, 0.3, 0.4, 0.4, 0.4, 0.2, 0.2, 0.3, 0.3, 0.4, 0.3, 0.3, 0.2, 0.5, 0.5, 0.3, 0.3, 0.5, 0.4, 0.4, 0.5, 0.4, 0.4, 0.5, 0.2, 0.2, 0.3, 0.3, 0.4, 0.3, 0.3, 0.4, 0.4, 0.5, 0.5, 0.6, 0.5, 0.3, 0.3, 0.4, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.4, 0.4, 0.4], inf),
		\legato, 0.9)
))




((
	t = TempoClock(120/60);
	c = Pbind(\instrument, \sawSynth,
		\note, Pseq([[-10, -3, 2, 6], [-13, 2, 7], [-10, -3, 7], [-15, 2, 6], [-3, 1, 4], [-6, -3, 2, 6], [-6, 0, 9], [-1, 2, 7], [2, 7, 11], [-3, 2, 7, 9], [-5, 1, 9], [-6, -3, 2], [-15, -5, 1, 4, 9], [-15, -3, 1, 4, 9], [-15, -3, 1, 4, 9], [-2, 4, 6], [-6, -1, 2],
			[-4, -1, 4], [-3, 1, 4], [-10, -3, 0, 6], [-1, 2, 7], [-3, 2, 6, 9],
			[-3, 1, 4, 9], [-10, -6, -3, 2], [-10, -3, 2, 6], [-15, 4, 9], [-10, -3, 2, 7], [-15, -3, 2, 6], [-5, 1, 4], [-10, -3, 2, 6], [-6, 2, 9], [-3, 4, 9], [1, 4, 9], [2, 6, 9], [-3, 1, 4, 9], [-6, -3, 2], [-15, -3, 1, 4, 9], [-15, -3, 1, 4, 9], [-15, -3, 1, 4, 9], [-2, 4, 6], [-6, -1, 2],
			[-8, -4, -1, 4], [-8, -3, 1, 4], [-10, -3, 0, 6], [-3, 1, 4], [2, 6, 9],
			[-3, 1, 4, 9], [-10, -6, -3, 2]], inf),
		\dur, Pseq([4, 4, 4, 2, 2, 2, 2, 3, 1, 4, 2, 2, 4, 4, 3, 1, 1, 2, 1, 4, 4, 4, 2, 2, 4, 4, 4, 2, 2, 2, 2, 3, 1, 4, 2, 2, 4, 4, 2, 2, 1, 2, 1, 4, 4, 4, 2, 2], inf),
		\legato, 0.3,
		\strum, 0.05
	)
))




((
	t = TempoClock(120/60);
	d = Pbind(\instrument, \prophet5pwmstrings,
		l = [-22, -10, -11, -13, -15, -22, -10, -15, -22, -27, -27, -27, -18, -25, -20, -18, -22, -22, -22, -15, -22, -22, -15, -22, -27, -22, -22, -15, -15, -10, -15, -22, -27, -15, -27, -26, -25, -20, -27, -22, -22, -27, -15, -22, -27, -22];
		\note, Pseq(l, inf),
		\dur, Pseq([8, 2, 1, 1, 4, 8, 4, 2, 2, 4, 4, 3, 1, 1, 2, 1, 4, 4, 4, 2, 2, 4, 4, 4, 4, 2, 2, 3, 1, 4, 2, 2, 4, 4, 2, 2, 1, 1, 1, 3, 2, 3, 1, 4, 2, 2], inf),
		\amp, Pseq([0.2, 0.2, 0.2, 0.3, 0.3, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4], inf),
		\legato, 0.9)
))





// C) Master Effects :

{Out.ar(0, FreeVerb.ar(In.ar(1, 1), mix:0.35, room:1))}.play;

{Out.ar(0, FreeVerb.ar(In.ar(55, 2), mix:0.32, room:0.9))}.play;

(
i = {Out.ar(00, BLowPass.ar(in: In.ar(55, 2), freq: MouseY.kr(300, 19000), rq: 0.1))}.play;
{Out.ar(0, In.ar(1, 1) * MouseY.kr(0, 2))}.play;
)



// Master Volume :

(
v = s.volume;
v.setVolumeRange(-7, -7);
)

// Loop :


~loop1 = Buffer.read(s, "C:/Users/TSAK/Desktop/JOY24.wav");





// Player :

(
t = TempoClock(120/60);
a.play(t);
c.play(t);
b.play(t);
d.play(t);
)


{PlayBuf.ar(2, ~loop1, loop: inf)}.play;









