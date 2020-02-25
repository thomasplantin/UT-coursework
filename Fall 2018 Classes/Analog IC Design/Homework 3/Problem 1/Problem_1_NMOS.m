%This code is made to open the CSV files created for the NMOS data
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

fid = fopen('NMOS_cdd.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.cdd(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
   fprintf('#%f\n', i);
end
fclose(fid);


fid = fopen('NMOS_cgb.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.cgb(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);

fid = fopen('NMOS_cgd.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.cgd(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);

fid = fopen('NMOS_cgg.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.cgg(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);

fid = fopen('NMOS_cgs.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.cgs(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);

fid = fopen('NMOS_cjd.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.cjd(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);

fid = fopen('NMOS_cjs.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.cjs(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);

fid = fopen('NMOS_css.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.css(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);

fid = fopen('NMOS_gds.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.gds(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);

fid = fopen('NMOS_gm.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.gm(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);

fid = fopen('NMOS_gmb.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.gmb(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);

fid = fopen('NMOS_id.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.id(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);

fid = fopen('NMOS_vth.csv', 'r');
for i = 1:length(L)
    for j = 1:length(VDS)
    % initialize pointers

        textscan(fid, '%[^\n\r]', 4, 'WhiteSpace', '', 'ReturnOnError', false);
        blockData = textscan(fid, format, end_row-start_row+1, 'Delimiter', '','WhiteSpace','', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
        
        for k = 1:length(VSB)
            nch.vth(k,:,j,i) = blockData{1,k+1};

        % update pointers
        end
    end
    fprintf('#%f\n', i);
end
fclose(fid);

save('nmos', 'nch');