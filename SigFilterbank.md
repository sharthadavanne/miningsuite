# sig.filterbank: Filterbank decomposition #

It is often interesting to decompose the audio signal into a series of audio signals of different frequency register, from low frequency channels to high frequency channels. This enables thus to study each of these channels separately. The decomposition is performed by a bank of filters, each one selecting a particular range of frequency values.

## Flowchart interconnections ##

sig.filterbank accepts as input data type either:

  * `sig.signal` objects, where the audio waveform can be segmented (using `sig.segment`),
  * file name(s), `'Folder'` or `'Folders'` keywords, etc.

## Filterbank specification ##

`sig.filterbank(…,'CutOff',`_f_`)` specifies a set of non-overlapping low-pass, band-pass and high- pass eliptic filters (Scheirer, 1998). The series of cut-off frequencies _f_ has to be specified as next parameter. **This parameter needs to be specified.**

  * If this series of frequencies begins with `-Inf`, the first filter is low-pass.
  * If this series of frequencies ends with `Inf`, the last filter is high-pass.

`sig.filterbank(…,'Order',`_o_`)` specifies the order of the filters. The default is set to _o_ = 4 (Scheirer, 1998)

`sig.filterbank(…,'Hop',`_h_`)` specifies the degree of spectral overlapping between successive channels.
  * If _h_ = 1 (default value), the filters are non-overlapping.
  * If _h_ = 2, the filters are half-overlapping.
  * If _h_ = 3, the spectral hop factor between successive filters is a third of the whole frequency region, etc.

## Auditory model ##

Auditory modelling of filterbank decomposition is available in [aud.filterbank](AudFilterbank.md).