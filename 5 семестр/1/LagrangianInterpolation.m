function resultValue = LagrangianInterpolation ( interpolationPoints, functionValues, point )

n = length( interpolationPoints );
pn = 0;

for ii = 1:n
    lk = 1;
    
    for jj = 1:n
        if ii == jj
            continue;
        end
        
        temp = ( point - interpolationPoints(jj) ) / ( interpolationPoints( ii ) - interpolationPoints(jj) );
        lk = lk * temp;
    end
    
    pn = pn + functionValues( ii ) * lk;
end

resultValue = pn;

end