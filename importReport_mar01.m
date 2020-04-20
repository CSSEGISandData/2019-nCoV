function outData = importReport_mar01(filename, dataLines)
%IMPORTFILE1 Import data from a text file
%  UNTITLED = IMPORTFILE1(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the data as a table.
%
%  UNTITLED = IMPORTFILE1(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  Untitled = importfile1("\\fs-56-ah\vmgr$\home06\clapierr\Documents\Demo\CovidVis\csse_covid_19_data\csse_covid_19_daily_reports\03-29-2020.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 29-Mar-2020 23:52:55

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 8);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Province_State", "Country_Region", "Last_Update", "Confirmed", "Deaths", "Recovered", "Lat", "Lon"];
opts.VariableTypes = ["categorical", "categorical", "datetime", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Province_State", "Country_Region"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "Last_Update", "InputFormat", 'yyyy-MM-dd''T''HH:mm:ss');

% Import the data
outData = readtable(filename, opts);

end