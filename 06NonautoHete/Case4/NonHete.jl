using Plots,CSV,DynamicalSystems,DataFrames, OrdinaryDiffEq
#=
# verify Chen Chengjie
@inline @inbounds function relu(x)
    if x > 0.0
        return x
    else
        return 0.0
    end
end

@inline @inbounds function net(u,p,t)
    A,w = p
    dx1 = -u[1]-3*relu(u[2])+A*sin(w*t)+2
    dx2 = -u[2]+10*relu(u[1])+3*relu(u[2])-10
    return SVector(dx1,dx2)
end
=#

@inline @inbounds function G(x)
    return exp(-(x^2.0)/1.0)
end

@inline @inbounds function net(u,p,t)
    k,A,w,B,f = p
    dx1 = -u[1]+0.5*tanh(u[1])-3.5*G(u[2])+k*(u[3]-u[3]^3/6)*(u[1]-u[2])+A*sin(w*t)
    dx2 = -u[2]+5*tanh(u[1])+1.5*G(u[2])+k*(u[3]-u[3]^3/6)*(u[2]-u[1])+B*sin(f*t)
    dx3 = 1.0*(u[1]-u[2])-1.0*(u[3])
    return SVector(dx1,dx2,dx3)
end

u0 = [0.1,0.1,0.1]
k,A,w,B,f = 1.0,1.0,1.5,1.00,1.5
p = [k,A,w,B,f]
ds = ContinuousDynamicalSystem(net,u0,p;diffeq=(alg=Tsit5(),reltol=1e-9,abstol=1e-9))
#=
tr,t = trajectory(ds,500;Ttr=200,Δt=0.01)
p1 = plot(tr[:,1],tr[:,2])
p2 = plot(t,tr[:,3])
p2 = plot!(t,B*sin.(f*t))
p2 = plot!(t,A*sin.(w*t))
les = lyapunovspectrum(ds,500;Ttr=200,Δt=0.001)
println(les)
plot(p1,p2)
=#

#=
N = 401
ww = range(0,2.0,N)
Le = zeros(N,3)
set_parameter!(ds,:,[1.0,0.0,0.0,1.00,1.5])
for (i,wi) in enumerate(ww)
    println("i = ",i," p = ",p)
    set_parameter!(ds,5,wi)
    Le[i,:] .= lyapunovspectrum(ds,5000;Ttr=500,Δt=0.01)
end

plot(ww,Le)
plot!(ww,zeros(N,1))
=#
N = 3
Aa1 = range(0.5,1.5,N)
ww1 = range(0.5,2,N)
Aa2 = range(0.5,2.5,N)
ww2 = range(0.5,2,N)
kk = range(0,5,N)

ka1 = zeros(N,N)
kw1 = zeros(N,N)
a1w1 = zeros(N,N)
ka2 = zeros(N,N)
kw2 = zeros(N,N)
a2w2 = zeros(N,N)
println("=======================================================")
set_parameter!(ds,:,[1.0,1.0,1.5,1.00,1.5])
for (ki,k1) in enumerate(kk)
    set_parameter!(ds,1,k1)
    println("current is calculating ka1 ki= ",ki)
    for (ii,a1) in enumerate(Aa1)
        set_parameter!(ds,2,a1)
        ka1[ki,ii] = maximum(lyapunov(ds,2000;Ttr=500,Δt=0.01))
    end
end

CSV.write("ka1.csv",DataFrame(ka1,:auto),header=false)
println("=======================================================")
set_parameter!(ds,:,[1.0,1.0,1.5,1.00,1.5])
for (ki,k1) in enumerate(kk)
    set_parameter!(ds,1,k1)
    println("current is calculating kw1 ki= ",ki)
    for (ii,a1) in enumerate(ww1)
        set_parameter!(ds,3,a1)
        kw1[ki,ii] = maximum(lyapunov(ds,2000;Ttr=500,Δt=0.01))
    end
end
CSV.write("kw1.csv",DataFrame(kw1,:auto),header=false)
println("=======================================================")
set_parameter!(ds,:,[1.0,1.0,1.5,1.00,1.5])
for (ki,k1) in enumerate(Aa1)
    set_parameter!(ds,2,k1)
    println("current is calculating a1w1 ki= ",ki)
    for (ii,a1) in enumerate(ww1)
        set_parameter!(ds,3,a1)
        a1w1[ki,ii] = maximum(lyapunov(ds,2000;Ttr=500,Δt=0.01))
    end
end
CSV.write("a1w1.csv",DataFrame(a1w1,:auto),header=false)

println("=======================================================")
set_parameter!(ds,:,[1.0,1.0,1.5,1.00,1.5])
for (ki,k1) in enumerate(kk)
    set_parameter!(ds,1,k1)
    println("current is calculating ka2 ki= ",ki)
    for (ii,a1) in enumerate(Aa2)
        set_parameter!(ds,4,a1)
        ka2[ki,ii] = maximum(lyapunov(ds,2000;Ttr=500,Δt=0.01))
    end
end

CSV.write("ka2.csv",DataFrame(ka2,:auto),header=false)
println("=======================================================")
set_parameter!(ds,:,[1.0,1.0,1.5,1.00,1.5])
for (ki,k1) in enumerate(kk)
    set_parameter!(ds,1,k1)
    println("current is calculating kw2 ki= ",ki)
    for (ii,a1) in enumerate(ww2)
        set_parameter!(ds,5,a1)
        kw2[ki,ii] = maximum(lyapunov(ds,2000;Ttr=500,Δt=0.01))
    end
end
CSV.write("kw2.csv",DataFrame(kw2,:auto),header=false)
println("=======================================================")
set_parameter!(ds,:,[1.0,1.0,1.5,1.00,1.5])
for (ki,k1) in enumerate(Aa2)
    set_parameter!(ds,4,k1)
    println("current is calculating a2w2 ki= ",ki)
    for (ii,a1) in enumerate(ww2)
        set_parameter!(ds,5,a1)
        a2w2[ki,ii] = maximum(lyapunov(ds,2000;Ttr=500,Δt=0.01))
    end
end
CSV.write("a2w2.csv",DataFrame(a2w2,:auto),header=false)
println("=======================================================")
println("=======================================================")
println("================all results are saved==================")
println("=======================================================")
println("=======================================================")
