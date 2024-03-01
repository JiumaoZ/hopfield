# Dynamics of stiumli-based memristor coupled heterogeneous activation Hopfield neural network and its application

## model&#x20;

$$
\left \{
\begin{array}{l}
\dot{x_1} = -x_1+0.5tanh(x_1)-3.5G(x_2)+k(\varphi-\varphi ^3/6)(x_1-x_2)+A_1sin(\omega_1t) \\
\dot{x_2} = -x_2+5tanh(x_1)+1.5G(x_2)+k(\varphi-\varphi ^3/6)(x_2-x_1)+A_2sin(\omega_2t) \\
\dot{\varphi} = x_1-x_2-\varphi
\end{array}
\right .


$$

where G(x)\=exp(-x^2)

## section 1. parameter based dynamics

ini \= \[0.1,0.1,0.1]

### A. memristor coupling influence without external stimuli

$k=0, A_1=0, A_2=0,\omega_1=0,\omega_2=0$

![](<Dynamics of stimuli-based memristor-coupled hetergeneous activation Hopfield neural network and its application _md_files/ac98c720-7239-11ee-931a-93ec168e6d9d.jpeg?v=1&type=image>)

LEs \= \[0.0015,0.00018,-0.9515] --> stable point

$k=1, A_1=0, A_2=0,\omega_1=0,\omega_2=0$

![](<Dynamics of stimuli-based memristor-coupled hetergeneous activation Hopfield neural network and its application _md_files/7e8c4ec0-723d-11ee-931a-93ec168e6d9d.jpeg?v=1&type=image>)

LEs \= 0.0075,-0.8062,-0.7627 --> limit cycle

![](<Dynamics of stimuli-based memristor-coupled hetergeneous activation Hopfield neural network and its application _md_files/e9dc45d0-723e-11ee-931a-93ec168e6d9d.jpeg?v=1&type=image>)

### externel stimuli on neuron 1

![](<Dynamics of stimuli-based memristor-coupled hetergeneous activation Hopfield neural network and its application _md_files/58ff5a60-723f-11ee-931a-93ec168e6d9d.jpeg?v=1&type=image>)

![](<Dynamics of stimuli-based memristor-coupled hetergeneous activation Hopfield neural network and its application _md_files/875ae050-723f-11ee-931a-93ec168e6d9d.jpeg?v=1&type=image>)

![](<Dynamics of stimuli-based memristor-coupled hetergeneous activation Hopfield neural network and its application _md_files/a2847580-723f-11ee-931a-93ec168e6d9d.jpeg?v=1&type=image>)
