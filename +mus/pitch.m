% MUS.PITCH
%
% Copyright (C) 2014, Olivier Lartillot
% All rights reserved.
% License: New BSD License. See full text of the license in LICENSE.txt in
% the main folder of the MiningSuite distribution.

function varargout = pitch(varargin)
    varargout = sig.operate('mus','pitch',initoptions,@init,@main,...
                            varargin);
end


%%
function options = initoptions
    options = sig.signal.signaloptions(3,.1);
    
        inter.key = 'Inter';
        inter.type = 'Boolean';
        inter.default = 0;
    options.inter = inter;    
    
        sampling.key = 'Sampling';
        sampling.type = 'Numeric';
        sampling.default = 0;
    options.sampling = sampling;    
end


%%
function [x type] = init(x,option,frame)
    if istype(x,'sig.signal')
        x = aud.pitch(x);
    elseif ~istype(x,'mus.Sequence')
        x = mus.score(x);
    end
    type = {'sig.signal'};
end


function out = main(in,option)
    if isa(in,'sig.signal')
        out = in;
    else
        p = zeros(length(in.content),1);
        t = zeros(length(in.content),1);
        for i = 1:length(p)
            p(i) = in.content{i}.parameter.getfield('chro').value;
            t(i) = in.content{i}.parameter.getfield('onset').value;
        end
        if option.inter
            p = diff(p);
            t(end) = [];
            nam = 'Inter-Pitch';
        else
            nam = 'Pitch';
        end
        if option.sampling
            t2 = t(1):option.sampling:t(end);
            p = interp1(t,p,t2,'previous');
            t = t2;
        end
        d = sig.data(p,{'sample'});
        if option.sampling
            d.content = d.content';
            out = {sig.signal(d,'Name',nam,'Srate',1/option.sampling)};
        else
            out = {sig.signal(d,'Name',nam,'Xdata',t,'Srate',0)};
        end
    end
end


function out = routine(d)
    e = d.apply(@convert,{},{'element'});
    out = {e};
end


function y = convert(x)
    y = 60./x;
end