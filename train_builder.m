

function y = fil(x)
%FIL Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 8.6 and the DSP System Toolbox 9.1.
% Generated on: 27-Jun-2022 13:53:14

persistent Hd;

if isempty(Hd)
    
    Fpass = 0.1;  % Passband Frequency ?????? ???? ???? /
    Fstop = 0.9;  % Stopband Frequency ?????? ???? ???? /
    Apass = 0.1;  % Passband Ripple (dB) ??? ???? ???? (dB) /
    Astop = 0.9;  % Stopband Attenuation (dB) ???? ????? ???? ???? (dB) 
    
    h = fdesign.lowpass('fp,fst,ap,ast', Fpass, Fstop, Apass, Astop, 'Linear');
    
    Hd = design(h, 'kaiserwin');
    
    
    
    set(Hd,'PersistentMemory',true);
    
end


X=-4:0.001:100;
a0=0.5;
train=a0;
T=8;
for n=1:3000
    train=train+(sin(n*pi/2)/(n*pi/2))*cos(((2*pi*n*X)/T));
end
plot(X,train);
fvtool(Hd,train);
y = filter(Hd,train);
plot(y);