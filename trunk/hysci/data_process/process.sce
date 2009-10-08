//
// Collect and Average Data Values
//
//
dataset = [
  "density"
  "gamma"
  "ma"
  "pressure"
  "temperature"
  "molecular_weight"
];

formats = [
  'f10.4'
  'f10.4'
  'f10.4'
  'f15.4'
  'f10.4'
  'f10.4'
];

dataindex = 6;

a = zeros(361, 2);
x = zeros(361, 2);
y = zeros(361, 12);



subdirs = [
  "1.5"
  "2.5"
  "3.5"
  "4.5"
  "5.5"
  "6.5"
  "7.5"
  "10"
  "15"
  "20"
  "25"
  "30"
];



// load('1.5\\density.dat', 'a');

len = size(subdirs, 1);
// len = size(subdirs, 'r');

for k = 1:6
  
  dataindex = k;

  for i = 1:len
  
    filename = strcat([subdirs(i), "\\", dataset(dataindex), ".dat"]);

    //disp(filename);

    datfile = file('open', filename, 'unknown');

    a = read(datfile, 361, 2);

    file('close', datfile);

    y(:,i) = a(:,2);

  end

  // 
  // Format
  //     ...
  tformat=  strcat(["(361(12(", formats(dataindex) ,")))"]);
  write(strcat([dataset(dataindex), '_t.dat']), y, tformat);
  
  //
  for n = 1:361
    x(n,1) = a(n,1);
    x(n,2) = mean(y(n,:));
  end

  //
  // Format : 
  //     pos   dat  
  textformat = strcat(["(361(f6.4,", formats(dataindex) ,"))"]);

//  write(strcat([dataset(dataindex), '.dat']), x, '(361(f6.4, f12.4))');
  write(strcat([dataset(dataindex), '.dat']), x, textformat);
end

