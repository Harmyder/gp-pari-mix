ps = List();

/* fills ps with all primes till 1000 */
fill_primes(s) = 
{
    local(step, n, d);
    listput(ps, 2);
    forstep (n=3,s,2,
        local(is_prime);
        is_prime=true;
        forstep (d=3,sqrt(n),2,
            if (n % d == 0, is_prime=false; break)
        );
        if (is_prime == true, listput(ps, n))
    );
}

/* 18.781 ps3.4.c */
check_n_print(perm) =
{
    local(npq, p);
    npq = ps[perm[1]]*ps[perm[2]]*ps[perm[3]];
    p = ps[perm[1]];
    q = ps[perm[2]];
    r = ps[perm[3]];
    if (((npq - 1) % (p - 1) == 0) && ((npq - 1) % (q - 1) == 0) && ((npq - 1) % (r - 1) == 0),
        print(ps[perm[1]], " ", ps[perm[2]], " ", ps[perm[3]], " = ", npq)
    );
}

perms = List();
perm = List();

/* fills perms with all permutation*/
get_perms(n, k) =
{
    if (n == k,
        forstep(j = n, 1, -1, listput(perm, j));
        listput(perms, perm);
        forstep(j = n, 1, -1, listpop(perm)),
        if (k == 0, listput(perms, perm),
                listput(perm, n);
                get_perms(n - 1, k - 1);
                listpop(perm);
                get_perms(n - 1, k)
        )
    )
}

run() =
{
    fill_primes(1000);
    get_perms(30, 3);
    for(i=1,#perms,check_n_print(perms[i]));
}
