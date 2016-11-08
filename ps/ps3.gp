poly1(x) = {
    return (x*x*x - 2);
}

poly2(x) = {
    return (x*x*x - 3*x - 1);
}

f() = {
    kUpperBound = 10000;
    values1 = List(kUpperBound);
    values2 = List(kUpperBound);
    for (x = 1, kUpperBound,
        listput(values1, poly1(x));
        listput(values2, poly2(x));
    );
    local(pc, sc1, sc2);
    for (n = 2, kUpperBound,
        if (isprime(n),
            pc = pc + 1;
            for (i = 1, kUpperBound,
                if (values1[i] % n == 0,
                    sc1 = sc1 + 1;
                    i = kUpperBound
                );
            );
            for (i = 1, kUpperBound,
                if (values2[i] % n == 0,
                    sc2 = sc2 + 1;
                    i = kUpperBound
                );
            );
        );
    );
    
    print (sc1, " / ", pc, " = ", real(sc1 / pc));
    print (sc2, " / ", pc, " = ", real(sc2 / pc));
}