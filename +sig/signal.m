function varargout = signal(varargin)


if isa(varargin{1},'sig.data')
    [options post] = sig.options(sig.Signal.signaloptions,varargin,...
                                'sig.signal');
    varargout = {sig.Signal(varargin{1},options.name,...
                                        options.unit,...
                                        options.xname,...
                                        options.xunit,...
                                        options.xsampling,...
                                        options.xstart,...
                                        options.srate,...
                                        options.sstart,...
                                        options.ssize,...
                                        options.frate)};
else
    varargout = sig.operate('sig','signal',sig.Signal.signaloptions,...
                                           sig.Signal.initmethod,...
                                           sig.Signal.mainmethod,...
                                           varargin);
end