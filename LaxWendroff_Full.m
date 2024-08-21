function [ U ] = LaxWendroff_Full( U,M,N,CFL,n )


% Central Nodes
for i = 2:M
    for j = 2:N
        ip = (j-1)*(M+1)+i;
        ie = ip+1;
        iw = ip-1;
        in = ip+M+1;
        is = ip-M-1;
        [ FX ] = LaxWendroff_X( ip,ie,iw,U,CFL,n );
        [ FY ] = LaxWendroff_Y( ip,in,is,U,CFL,n );
        U(ip,n+1) = U(ip,n)-(FX+FY);
    end
end

% Up B.C.
for i = 2:M
    ip = N*(M+1)+i;
    ie = ip+1;
    iw = ip-1;
    in = (M+1)+i;
    is = ip-M-1;
    [ FX ] = LaxWendroff_X( ip,ie,iw,U,CFL,n );
    [ FY ] = LaxWendroff_Y( ip,in,is,U,CFL,n );
    U(ip,n+1) = U(ip,n)-(FX+FY);
end

% Right B.C.
for j = 2:N
    ip = j*(M+1);
    ie = (j-1)*(M+1)+2;
    iw = ip-1;
    in = ip+M+1;
    is = ip-M-1;
    [ FX ] = LaxWendroff_X( ip,ie,iw,U,CFL,n );
    [ FY ] = LaxWendroff_Y( ip,in,is,U,CFL,n );
    U(ip,n+1) = U(ip,n)-(FX+FY);
end

% Down B.C.
for i = 2:M
    ip = i;
    ie = ip+1;
    iw = ip-1;
    in = ip+M+1;
    is = (N-1)*(M+1)+i;
    [ FX ] = LaxWendroff_X( ip,ie,iw,U,CFL,n );
    [ FY ] = LaxWendroff_Y( ip,in,is,U,CFL,n );
    U(ip,n+1) = U(ip,n)-(FX+FY);
end

% Left B.C.
for j = 2:N
    ip = (j-1)*(M+1)+1;
    ie = ip+1;
    iw = j*(M+1)-1;
    in = ip+M+1;
    is = ip-M-1;
    [ FX ] = LaxWendroff_X( ip,ie,iw,U,CFL,n );
    [ FY ] = LaxWendroff_Y( ip,in,is,U,CFL,n );
    U(ip,n+1) = U(ip,n)-(FX+FY);
end

% Left & Down Corner
i = 1;
j = 1;
ip = (j-1)*(M+1)+i;
ie = ip+1;
iw = j*(M+1)-1;
in = ip+M+1;
is = (N-1)*(M+1)+i;
[ FX ] = LaxWendroff_X( ip,ie,iw,U,CFL,n );
[ FY ] = LaxWendroff_Y( ip,in,is,U,CFL,n );
U(ip,n+1) = U(ip,n)-(FX+FY);

% Right & Down Corner
i = M+1;
j = 1;
ip = (j-1)*(M+1)+i;
ie = (j-1)*(M+1)+2;
iw = ip-1;
in = ip+M+1;
is = (N-1)*(M+1)+i;
[ FX ] = LaxWendroff_X( ip,ie,iw,U,CFL,n );
[ FY ] = LaxWendroff_Y( ip,in,is,U,CFL,n );
U(ip,n+1) = U(ip,n)-(FX+FY);

% Left & Up Corner
i = 1;
j = N+1;
ip = (j-1)*(M+1)+i;
ie = ip+1;
iw = j*(M+1)-1;
in = (M+1)+i;
is = ip-M-1;
[ FX ] = LaxWendroff_X( ip,ie,iw,U,CFL,n );
[ FY ] = LaxWendroff_Y( ip,in,is,U,CFL,n );
U(ip,n+1) = U(ip,n)-(FX+FY);

% Right & Up Corner
i = M+1;
j = N+1;
ip = (j-1)*(M+1)+i;
ie = (j-1)*(M+1)+2;
iw = ip-1;
in = (M+1)+i;
is = ip-M-1;
[ FX ] = LaxWendroff_X( ip,ie,iw,U,CFL,n );
[ FY ] = LaxWendroff_Y( ip,in,is,U,CFL,n );
U(ip,n+1) = U(ip,n)-(FX+FY);

end

