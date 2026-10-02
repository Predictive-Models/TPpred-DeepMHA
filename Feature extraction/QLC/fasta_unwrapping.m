% Specify the input FASTA file
inputFile = 'input.fasta'; % Replace with your FASTA file path
outputFile = 'unwrapped_sequences.fasta'; % Output FASTA file path

% Read the sequences from the input FASTA file
fastaData = fastaread(inputFile);

% Open the output file for writing
fileID = fopen(outputFile, 'w');

% Loop through each sequence and write to the output file
for i = 1:length(fastaData)
    % Write the header
    fprintf(fileID, '>%s\n', fastaData(i).Header);
    % Write the sequence as a single line
    fprintf(fileID, '%s\n', fastaData(i).Sequence);
end

% Close the file
fclose(fileID);

% Display completion message
disp(['Unwrapped FASTA file has been saved to ', outputFile]);