clc;
clear all;
feature_QLC=[];


[data, sequence] = fastaread('NP_training_dec.txt');
Total_Seq_train=size(sequence,2);

for i=1:(Total_Seq_train)
    i
    SEQ=sequence(i);
	FF=mctd(SEQ);
    SEQ=cell2mat(SEQ);
    feature_QLC(i,:)=FF;
end
NPs_QLC_Training=[feature_QLC];
save NPs_QLC_Training NPs_QLC_Training;
csvwrite('NPs_QLC_Training.csv',NPs_QLC_Training);
