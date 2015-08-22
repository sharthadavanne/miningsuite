# aud.filterbank: Filterbank decomposition based on auditory modelling #

This operations is a specialisation of the general signal processing operator [sig.filterbank](SigFilterbank.md) focused on auditory models. The filterbank decomposition models an actual process of human perception, corresponding to the distribution of frequencies into critical bands in the cochlea.

## Flowchart interconnections ##

Same as in [sig.filterbank](SigFilterbank.md).

## Filterbank selection ##

Two basic types of filterbanks are proposed:

### `'Gammatone'` ###

`aud.filterbank(…,'Gammatone')` carries out a Gammatone filterbank decomposition (Patterson et al, 1992). It is known to simulate well the response of the basilar membrane. It is based on a Equivalent Rectangular Bandwidth (ERB) filterbank, meaning that the width of each band is determined by a particular psychoacoustical law. For Gammatone filterbanks, `sig.filterbank` calls the Auditory Toolbox routines MakeERBFilters and ERBfilterbank. This is the default choice when calling `aud.filterbank`.

![https://miningsuite.googlecode.com/svn/wiki/SigFilterbank_gammatone.png](https://miningsuite.googlecode.com/svn/wiki/SigFilterbank_gammatone.png)
_Ten ERB filters between 100 and 8000Hz (Slaney, 1998)_

**`aud.filterbank(...,'Lowest',`_f_`)` indicates the lowest frequency _f_, in Hz. Default value: 50 Hz.**

### `'2Channels'` ###

`aud.filterbank(…,'2Channels'`) performs a computational simplification of the filterbank using just two channels, one for low-frequencies, below 1000 Hz, and one for high-frequencies, over 1000 Hz (Tolonen and Karjalainen, 2000). On the high-frequency channel is performed an envelope extraction using a half-wave rectification and the same low-pass filter used for the low-frequency channel. This filterbank is mainly used for multi-pitch extraction (cf. AudPitch).

## Further options ##

**`aud.filterbank(…,'NbChannels',`_N_`)` specifies the number of channels in the bank. By default: _N_ = 10. This option is useless for `'2Channels'`.** `aud.filterbank(…,'Channel',`_c_`)` – or `sig.filterbank(…,'Channels',`_c_`)` – only output the channels whose ranks are indicated in the array _c_ (default: _c_ = (1:_N_) )

## Preselected filterbanks ##

`sig.filterbank(…,`_p_`)` specifies predefined filterbanks, all implemented using elliptic filters, by default of order 4:
**_p_ = `'Mel'`: Mel scale (cf. `aud.spectrum(…,'Mel')`).** _p_ = `'Bark'`: Bark scale (cf. `aud.spectrum(…,'Bark')`).
**_p_ = `'Scheirer'` proposed in (Scheirer, 1998) corresponds to `'Manual',[-Inf 200 400 800 1600 3200 Inf]`** _p_ = `'Klapuri'` proposed in (Klapuri, 1999) corresponds to `'Manual',44*[2.^ ([ 0:2, ( 9+(0:17) )/3 ]) ]`

## Example ##

```
aud.filterbank('ragtime')
```
![https://miningsuite.googlecode.com/svn/wiki/SigFilterbank_ex1.png](https://miningsuite.googlecode.com/svn/wiki/SigFilterbank_ex1.png)

If the number of channels exceeds 20, the audio waveform decomposition is represented as a single image bitmap, where each line of pixel represents each successive channel:
```
aud.filterbank('ragtime','NbChannels',40)
```
![https://miningsuite.googlecode.com/svn/wiki/SigFilterbank_ex2.png](https://miningsuite.googlecode.com/svn/wiki/SigFilterbank_ex2.png)