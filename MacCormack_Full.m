function [ U ] = MacCormack_Full( U,M,N,CFL,n )

% Central Nodes
for i = 2:M
    for j = 2:N
        ip = (j-1)*(M+1)+i;
        ie = ip+1;
        iw = ip-1;
        in = ip+M+1;
        is = ip-M-1;
        Uh(ip) = U(ip,n)-CFL*((U(ie,n)-U(ip,n))+(U(in,n)-U(ip,n)));
    end
end

% Up B.C.
for i = 2:M
    ip = N*(M+1)+i;
    ie = ip+1;
    iw = ip-1;
    in = (M+1)+i;
    is = ip-M-1;
    Uh(ip) = U(ip,n)-CFL*((U(ie,n)-U(ip,n))+(U(in,n)-U(ip,n)));
end

% Right B.C.
for j = 2:N
    ip = j*(M+1);
    ie = (j-1)*(M+1)+2;
    iw = ip-1;
    in = ip+M+1;
    is = ip-M-1;
    Uh(ip) = U(ip,n)-CFL*((U(ie,n)-U(ip,n))+(U(in,n)-U(ip,n)));
end

% Down B.C.
for i = 2:M
    ip = i;
    ie = ip+1;
    iw = ip-1;
    in = ip+M+1;
    is = (N-1)*(M+1)+i;
    Uh(ip) = U(ip,n)-CFL*((U(ie,n)-U(ip,n))+(U(in,n)-U(ip,n)));
end

% Left B.C.
for j = 2:N
    ip = (j-1)*(M+1)+1;
    ie = ip+1;
    iw = j*(M+1)-1;
    in = ip+M+1;
    is = ip-M-1;
    Uh(ip) = U(ip,n)-CFL*((U(ie,n)-U(ip,n))+(U(in,n)-U(ip,n)));
end

% Left & Down Corner
i = 1;
j = 1;
ip = (j-1)*(M+1)+i;
ie = ip+1;
iw = j*(M+1)-1;
in = ip+M+1;
is = (N-1)*(M+1)+i;
Uh(ip) = U(ip,n)-CFL*((U(ie,n)-U(ip,n))+(U(in,n)-U(ip,n)));

% Right & Down Corner
i = M+1;
j = 1;
ip = (j-1)*(M+1)+i;
ie = (j-1)*(M+1)+2;
iw = ip-1;
in = ip+M+1;
is = (N-1)*(M+1)+i;
Uh(ip) = U(ip,n)-CFL*((U(ie,n)-U(ip,n))+(U(in,n)-U(ip,n)));

% Left & Up Corner
i = 1;
j = N+1;
ip = (j-1)*(M+1)+i;
ie = ip+1;
iw = j*(M+1)-1;
in = (M+1)+i;
is = ip-M-1;
Uh(ip) = U(ip,n)-CFL*((U(ie,n)-U(ip,n))+(U(in,n)-U(ip,n)));

% Right & Up Corner
i = M+1;
j = N+1;
ip = (j-1)*(M+1)+i;
ie = (j-1)*(M+1)+2;
iw = ip-1;
in = (M+1)+i;
is = ip-M-1;
Uh(ip) = U(ip,n)-CFL*((U(ie,n)-U(ip,n))+(U(in,n)-U(ip,n)));

% Central Nodes
for i = 2:M
    for j = 2:N
        ip = (j-1)*(M+1)+i;
        ie = ip+1;
        iw = ip-1;
        in = ip+M+1;
        is = ip-M-1;
        U(ip,n+1) = 0.5*(U(ip,n)+Uh(ip))-0.5*CFL*((Uh(ip)-Uh(iw))+(Uh(ip)-Uh(is)));
    end
end

% Up B.C.
for i = 2:M
    ip = N*(M+1)+i;
    ie = ip+1;
    iw = ip-1;
    in = (M+1)+i;
    is = ip-M-1;
    U(ip,n+1) = 0.5*(U(ip,n)+Uh(ip))-0.5*CFL*((Uh(ip)-Uh(iw))+(Uh(ip)-Uh(is)));
end

% Right B.C.
for j = 2:N
    ip = j*(M+1);
    ie = (j-1)*(M+1)+2;
    iw = ip-1;
    in = ip+M+1;
    is = ip-M-1;
    U(ip,n+1) = 0.5*(U(ip,n)+Uh(ip))-0.5*CFL*((Uh(ip)-Uh(iw))+(Uh(ip)-Uh(is)));
end

% Down B.C.
for i = 2:M
    ip = i;
    ie = ip+1;
    iw = ip-1;
    in = ip+M+1;
    is = (N-1)*(M+1)+i;
    U(ip,n+1) = 0.5*(U(ip,n)+Uh(ip))-0.5*CFL*((Uh(ip)-Uh(iw))+(Uh(ip)-Uh(is)));
end

% Left B.C.
for j = 2:N
    ip = (j-1)*(M+1)+1;
    ie = ip+1;
    iw = j*(M+1)-1;
    in = ip+M+1;
    is = ip-M-1;
    U(ip,n+1) = 0.5*(U(ip,n)+Uh(ip))-0.5*CFL*((Uh(ip)-Uh(iw))+(Uh(ip)-Uh(is)));
end

% Left & Down Corner
i = 1;
j = 1;
ip = (j-1)*(M+1)+i;
ie = ip+1;
iw = j*(M+1)-1;
in = ip+M+1;
is = (N-1)*(M+1)+i;
U(ip,n+1) = 0.5*(U(ip,n)+Uh(ip))-0.5*CFL*((Uh(ip)-Uh(iw))+(Uh(ip)-Uh(is)));

% Right & Down Corner
i = M+1;
j = 1;
ip = (j-1)*(M+1)+i;
ie = (j-1)*(M+1)+2;
iw = ip-1;
in = ip+M+1;
is = (N-1)*(M+1)+i;
U(ip,n+1) = 0.5*(U(ip,n)+Uh(ip))-0.5*CFL*((Uh(ip)-Uh(iw))+(Uh(ip)-Uh(is)));

% Left & Up Corner
i = 1;
j = N+1;
ip = (j-1)*(M+1)+i;
ie = ip+1;
iw = j*(M+1)-1;
in = (M+1)+i;
is = ip-M-1;
U(ip,n+1) = 0.5*(U(ip,n)+Uh(ip))-0.5*CFL*((Uh(ip)-Uh(iw))+(Uh(ip)-Uh(is)));

% Right & Up Corner
i = M+1;
j = N+1;
ip = (j-1)*(M+1)+i;
ie = (j-1)*(M+1)+2;
iw = ip-1;
in = (M+1)+i;
is = ip-M-1;
U(ip,n+1) = 0.5*(U(ip,n)+Uh(ip))-0.5*CFL*((Uh(ip)-Uh(iw))+(Uh(ip)-Uh(is)));


end

