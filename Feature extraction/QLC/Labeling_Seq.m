clc;
clear all;

% Specify the input file paths
positiveFile = 'clathrinIND_Positive.txt'; % Replace with your positive FASTA file path
negativeFile = 'vesicularIND_Negative.txt'; % Replace with your negative FASTA file path

% Read the positive sequences
positiveData = fastaread(positiveFile);
numPositive = length(positiveData);
positiveSequences = {positiveData.Sequence}';
positiveHeaders = {positiveData.Header}';
positiveLabels = zeros(numPositive, 1); % Label as 0 for positive

% Read the negative sequences
negativeData = fastaread(negativeFile);
numNegative = length(negativeData);
negativeSequences = {negativeData.Sequence}';
negativeHeaders = {negativeData.Header}';
negativeLabels = ones(numNegative, 1); % Label as 1 for negative

% Combine sequences, headers, and labels
allSequences = [positiveSequences; negativeSequences];
allHeaders = [positiveHeaders; negativeHeaders];
allLabels = [positiveLabels; negativeLabels];

% Save to a new FASTA file manually
outputFile = 'labeled_sequences_Orig_independent.fasta'; % Change the output file name if needed
fileID = fopen(outputFile, 'w');

for i = 1:length(allSequences)
    fprintf(fileID, '>%d\n%s\n', allLabels(i), allSequences{i});
end

fclose(fileID);

% Display completion message
disp(['Labeled FASTA file has been saved to ', outputFile]);