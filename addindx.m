
clear
clc
frac=0.4374856451; %grain index fraction
Ly= 9.5786; %micron
fidR = fopen('AM2D_Pha.Final.dat', 'r');
fidW = fopen('AM2D_Pha.Finalnew.dat', 'wt');
line_ex = fgetl(fidR);
i = 1;

while ~feof(fidR)
    
    
    if i>5 &&  length(line_ex) ~= 0
         
        c = textscan(line_ex, '%s %s %s'); 
    %     c1=(c{1}(:,:));
        c2=(c{2}(:,:));
        a2=str2num(c2{1});
        c3=(c{3}(:,:));
        a3=str2num(c3{1});
            if  a2 > frac*Ly && a3==-1
               line_ex=erase(line_ex,'-');  
            end            
    end 
    fprintf(fidW,['%s' newline], line_ex);
    line_ex = fgetl(fidR);
    i = i + 1;
end
fclose(fidR);
fclose(fidW);


