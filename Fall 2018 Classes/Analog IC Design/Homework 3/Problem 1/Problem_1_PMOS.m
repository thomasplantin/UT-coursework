%This code is made to open the CSV files created for the PMOS data
%extracted in problem 1 of homework 3.

%Clear the command window
clc;

%L range
L_small = [0.18E-6:20E-9:.5E-6];
L_large = [.6E-6:.1E-6:2E-6];


%Vector variables
VGS = [0:0.025:1.8];
VDS = [0:0.025:1.8];
L = [L_small L_large];
VSB = [0:0.1:1];

%Template specs
start_row = 5;
end_row = length(VGS) + start_row - 1;

format = '%f';
for i = 1:length(VSB)+1
    format = [format, '%18s'];
end

%Importing CSVs

fprintf('STARTING \n\n');

fid = fopen('PMOS_cdd.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.cdd(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
   fprintf('#%f\n', i);
end
fclose(fid);

fprintf('#1 cdd done.\n');

fid = fopen('PMOS_cgb.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.cgb(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);
fprintf('#2 cgb done.\n');

fid = fopen('PMOS_cgd.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.cgd(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);
fprintf('#3 cgd done.\n');

fid = fopen('PMOS_cgg.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.cgg(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);
fprintf('#4 cgg done.\n');

fid = fopen('PMOS_cgs.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.cgs(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);
fprintf('#5 cgs done.\n');

fid = fopen('PMOS_cjd.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.cjd(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);
fprintf('#6 cjd done.\n');

fid = fopen('PMOS_cjs.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.cjs(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);
fprintf('#7 cjs done.\n');

fid = fopen('PMOS_css.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.css(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);
fprintf('#8 css done.\n');

fid = fopen('PMOS_gds.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.gds(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);
fprintf('#9 gds done.\n');

fid = fopen('PMOS_gm.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.gm(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);
fprintf('#10 gm done.\n');

fid = fopen('PMOS_gmb.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.gmb(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);
fprintf('#11 gmb done.\n');

fid = fopen('PMOS_id.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.id(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);
fprintf('#12 id done.\n');

fid = fopen('PMOS_vth.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            pch.vth(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);
fprintf('#13 vth done. ALL DONE.\n');

save('pmos', 'pch');