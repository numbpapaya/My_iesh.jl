#path to data

#read velocity file
filename = "C:\\Users\\Belal\\.julia\\dev\\My_iesh.jl\\data\\surface_Au111.dat"

f = open(filename)
data = readlines(f)
close(f)
const global N = Int64(parse(Float64, data[1]))
const global g = parse(Float64, data[2])
const global a = sqrt(2) * g
cell_temp = zeros(Float64, 3)
cell_temp[1] = parse(Float64, data[3])
cell_temp[2] = parse(Float64, data[4])
cell_temp[3] = sqrt(6) * parse(Float64, data[2])* Float64(100)
const global cell = SVector{3, Float64}(copy(cell_temp))

x_au_temp = zeros(Float64, (Integer(N), 3))

for i in 5:length(data)
    data_strip = strip(data[i])
    data_split = split(data_strip)
    str_to_float = parse.(Float64, data_split)
    x_au_temp[i-4, :] = str_to_float
end
#x_no_temp = vcat(x_no, x_temp)
const global x_au0 = copy(x_au_temp)


filename = "C:\\Users\\Belal\\.julia\\dev\\My_iesh.jl\\data\\gold_velocities.dat" #units in meter per second
f = open(filename)
data = readlines(f)
close(f)


v_au_temp = zeros(Float64, (Integer(N), 3))

for i in 1:length(data)
    data_strip = strip(data[i])
    data_split = split(data_strip)
    str_to_float = parse.(Float64, data_split)
    v_au_temp[i, :] = str_to_float
end
#x_no_temp = vcat(x_no, x_temp)
const global v_au0 = copy(v_au_temp)*1e-5 #convert to angstrom/femtosecond
