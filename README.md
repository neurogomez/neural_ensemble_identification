
# Feldman Lab - Identifying Neural Ensembles
*Goal*: identify neural ensembles in S1 from calcium imaging data
*Method*: TBD
- try PCA + clustering to identify prinicple ensemble defining neurons 
- try Yuste Lab's CRF method

## Data Set
Han Chin's longitudinal 2P calcium imaging data

__Data Summary__

![Data Summary](documents/dat_summary.png)

- 2 mice: 4 FOVs each
- frame rate is 7.4811 Hz
- FOV is 512x512 pixels
- blank trials are spontaneous activity 

__Data Structure__
The .mat files are stored in the folder 'data': available at https://drive.google.com/drive/folders/1O0PwG1FuS7czanlooS2ZPNizAnqvUCWR?usp=sharing

'calcium_data.mat' contains a 1x8 cell with structures for each FOV
 - field_i.(ROIj).(movie_k).dff = dF/F trace
 - field_i.(ROIj).(movie_k).deNoise_dff = dF/F trace de-noised using CaImAn algorithm
 - field_i.(ROIj).(movie_k).spike = inferred spikes

'stimuli_info.mat' contains a 1x8 cell with the structures for each FOV
 - FOV_i.movie_j.Label = stimulus identification: 018 = single whisker stimulation; 9 = all 9 whisker stimulation; 10 = blank (no stimulation/nothing happened); 11,12 = tone stimulation
 - FOV_i.movie_j.Time = frame number of stimulus onset

__Instructions__
- clone repo and create 'data' folder in root containing 'calcium_data.mat' and 'stimuli_info.mat'
- data can be downloaded from https://drive.google.com/drive/folders/1O0PwG1FuS7czanlooS2ZPNizAnqvUCWR?usp=sharing
- run 'main.m'

### Week 2: Sept 28 - Oct 2
*Plan*:
- ~~create get_info() fxn to extract trial information data~~
- determine method for getting spikes from dF/f
- write function to extract individual trial traces from movies
- write function to determine spikes and bin time - binarize firing  
- write function to organize data into population arrary
- determine method to try first for ensemble identification
