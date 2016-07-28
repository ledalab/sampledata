function test_import(subtest)
    import_tests('biotrace_text.txt',@getBiotraceData, 6303);
    import_tests('biotrace_text_gb.txt',@getBiotraceData, 3967);
    import_tests('
end


function import_tests(filename,fun,nSamples,nEvents)
    [t,c,e] = fun(filename);
    assert(size(c,1)==size(t,1));
    if nargin() > 2
        assert(size(c,1) == nSamples)
        assert(size(t,1) == nSamples)
    end
    if nargin() >3
        assert(size(e,2) == nEvents)
    end
    disp(sprintf('Test %s with %s: Ok.',func2str(fun),filename));
end
