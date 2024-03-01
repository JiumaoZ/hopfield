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
k,A,w,B,f = 1.0,0.0,0.0,0.00,0.0
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


N = 401
ww = range(0,5,N)
Le = zeros(N,3)
set_parameter!(ds,:,p)
for (i,wi) in enumerate(ww)
    println("i = ",i," p = ",p)
    set_parameter!(ds,1,wi)
    Le[i,:] .= lyapunovspectrum(ds,5000;Ttr=500,Δt=0.01)
end

plot(ww,Le)
plot!(ww,zeros(N,1))


#=
N = 401
ww = range(0,5,N)
bifp, bifx = [],[] 
for (i,wi) in enumerate(ww)
    println("i = ",i," p = ",p)
    set_parameter!(ds,1,wi)
    tr,t = trajectory(ds,2000;Ttr=500,Δt=0.01)
    x = tr[:,1]
    for j = 2:length(x)-1
        if (x[j] >= x[j-1] && x[j] >= x[j+1]) || (x[j]<=x[j-1] && x[j]<=x[j+1])
            append!(bifp,wi)
            append!(bifx,x[j])
        end
    end
end

scatter(bifp,bifx,markersize=0.25)
=#