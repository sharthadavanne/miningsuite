function varargout = signal(varargin)


if isa(varargin{1},'sig.data')
    [options post] = sig.options(sig.signal.signaloptions,varargin,...
                                'sig.signal');
    varargout = {sig.signal(varargin{1},options.name,...
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
    varargout = sig.operate('sig','signal',sig.signal.signaloptions,...
                                           sig.signal.initmethod,...
                                           sig.signal.mainmethod,...
                                           varargin);
end