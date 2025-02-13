clear all;
clc;
global id = 0;


% check the access to the integrator class and properties
try
  integrator_test = integrator();
  xk = integrator_test.xk;
catch e
  msg = strcat("\033[31m[Setup failed]\033[0m\n\nThis error is usually thrown in the following conditions:\n- the class integrator does not exists or has no working constructor without argument\n- the access of the properties to the integrator class has not been changed to public\n\nFor more information about the cause of this error, see the trace at the end of this message. See also the readme file on github for more information about the setup of this test suite. If the problem is persistent, feel free to contact the author via github or discord.\n\n", e.message);
  error(msg);
end


function s = to_string(obj)
  switch typeinfo(obj)
    case "scalar"
      s = num2str(obj)
    case "matrix"
      s = mat2str(obj)
    case "string"
      s = obj
    otherwise
      error(sprintf("Unknonw type %s", typeinfo(obj)))
  endswitch
endfunction

function print_success(msg = "")
  global id;
  printf("(%02d) \033[32m[Success]\033[0m\n", id);
  % printf("(%02d) \033[32m[Success]\033[0m \033[2m%s\033[0m\n", id, msg);
endfunction

function print_failure(expected, actual, msg = "")
  global id;
  printf("(%02d) \033[33m[Failure]\033[0m expected: %s, actual: %s\n>>>> \033[33m%s\033[0m\n", id, to_string(expected), to_string(actual), msg);
endfunction

function print_error(msg = "")
  global id;
  printf("(%02d) \033[31m[Error]\033[0m   %s\n", id, msg);
endfunction

function assert(expected, actual, msg = "", equality_method = @(a,b) a == b)
  global id;
  if equality_method(expected, actual)
    print_success(msg);
  else
    print_failure(expected, actual, msg);
  endif
endfunction

function print_section(class_name, method_name)
  printf("\n---[ %s.%s ]---\n\n", class_name, method_name);
endfunction


print_section("integrator", "integrator")


try
  msg = "Make sure that the property integrator.method is set to \"trapezes\" when the constructor is called with no argument.";
  itg = integrator();
  expected = "trapezes";
  actual = itg.method;
  assert(expected, actual, msg, @strcmp);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.dx is set to 0.1 when the constructor is called with no argument.";
  itg = integrator();
  expected = 0.1;
  actual = itg.dx;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.wk is set to [1/2, 1/2] when the constructor is called with no argument.";
  itg = integrator();
  expected = [1/2, 1/2];
  actual = itg.wk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.xk is set to [0, 1] when the constructor is called with no argument.";
  itg = integrator();
  expected = [0, 1];
  actual = itg.xk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.method is correctly set to \"left\" when the constructor is called with (\"method\", \"left\") as arguments.";
  itg = integrator("method", "left");
  expected = "left";
  actual = itg.method;
  assert(expected, actual, msg, @strcmp);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.wk is set to [1] when the constructor is called with (\"method\", \"left\") as arguments.";
  itg = integrator("method", "left");
  expected = [1];
  actual = itg.wk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.xk is set to [0] when the constructor is called with (\"method\", \"left\") as arguments.";
  itg = integrator("method", "left");
  expected = [0];
  actual = itg.xk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.method is correctly set to \"right\" when the constructor is called with (\"method\", \"right\") as arguments.";
  itg = integrator("method", "right");
  expected = "right";
  actual = itg.method;
  assert(expected, actual, msg, @strcmp);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.wk is set to [1] when the constructor is called with (\"method\", \"right\") as arguments.";
  itg = integrator("method", "right");
  expected = [1];
  actual = itg.wk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.xk is set to [1] when the constructor is called with (\"method\", \"right\") as arguments.";
  itg = integrator("method", "right");
  expected = [1];
  actual = itg.xk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.method is correctly set to \"middle\" when the constructor is called with (\"method\", \"middle\") as arguments.";
  itg = integrator("method", "middle");
  expected = "middle";
  actual = itg.method;
  assert(expected, actual, msg, @strcmp);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.wk is set to [1] when the constructor is called with (\"method\", \"middle\") as arguments.";
  itg = integrator("method", "middle");
  expected = [1];
  actual = itg.wk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.xk is set to [1/2] when the constructor is called with (\"method\", \"middle\") as arguments.";
  itg = integrator("method", "middle");
  expected = [1/2];
  actual = itg.xk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.method is correctly set to \"trapezes\" when the constructor is called with (\"method\", \"trapezes\") as arguments.";
  itg = integrator("method", "trapezes");
  expected = "trapezes";
  actual = itg.method;
  assert(expected, actual, msg, @strcmp);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.wk is set to [1/2, 1/2] when the constructor is called with (\"method\", \"trapezes\") as arguments.";
  itg = integrator("method", "trapezes");
  expected = [1/2, 1/2];
  actual = itg.wk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.xk is set to [0, 1] when the constructor is called with (\"method\", \"trapezes\") as arguments.";
  itg = integrator("method", "trapezes");
  expected = [0, 1];
  actual = itg.xk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.method is correctly set to \"simpson\" when the constructor is called with (\"method\", \"simpson\") as arguments.";
  itg = integrator("method", "simpson");
  expected = "simpson";
  actual = itg.method;
  assert(expected, actual, msg, @strcmp);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.wk is set to [1/6, 2/3, 1/6] when the constructor is called with (\"method\", \"simpson\") as arguments.";
  itg = integrator("method", "simpson");
  expected = [1/6, 2/3, 1/6];
  actual = itg.wk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.xk is set to [0, 1/2, 1] when the constructor is called with (\"method\", \"simpson\") as arguments.";
  itg = integrator("method", "simpson");
  expected = [0, 1/2, 1];
  actual = itg.xk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.method is correctly set to \"gauss2\" when the constructor is called with (\"method\", \"gauss2\") as arguments.";
  itg = integrator("method", "gauss2");
  expected = "gauss2";
  actual = itg.method;
  assert(expected, actual, msg, @strcmp);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.wk is set to [1/2, 1/2] when the constructor is called with (\"method\", \"gauss2\") as arguments.";
  itg = integrator("method", "gauss2");
  expected = [1/2, 1/2];
  actual = itg.wk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.xk is set to [1/2-1/(2√3), 1/2+1/(2√3)] when the constructor is called with (\"method\", \"gauss2\") as arguments.";
  itg = integrator("method", "gauss2");
  expected = [1/2-1/(2*sqrt(3)), 1/2+1/(2*sqrt(3))];
  actual = itg.xk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.method is correctly set to \"gauss3\" when the constructor is called with (\"method\", \"gauss3\") as arguments.";
  itg = integrator("method", "gauss3");
  expected = "gauss3";
  actual = itg.method;
  assert(expected, actual, msg, @strcmp);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.wk is set to [5/18, 4/9, 5/18] when the constructor is called with (\"method\", \"gauss3\") as arguments.";
  itg = integrator("method", "gauss3");
  expected = [5/18, 4/9, 5/18];
  actual = itg.wk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.xk is set to [1/2*(1-√(3/5)), 1/2, 1/2*(1+√(3/5))] when the constructor is called with (\"method\", \"gauss3\") as arguments.";
  itg = integrator("method", "gauss3");
  expected = [1/2*(1-sqrt(3/5)), 1/2, 1/2*(1+sqrt(3/5))];
  actual = itg.xk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.dx is set to 0.01 when the constructor is called with (\"dx\", 0.01) as arguments.";
  itg = integrator("dx", 0.01);
  expected = 0.01;
  actual = itg.dx;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.dx is set to 42 when the constructor is called with (\"dx\", 42) as arguments.";
  itg = integrator("dx", 42);
  expected = 42;
  actual = itg.dx;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.method is correctly set to \"simpson\" when the constructor is called with (\"dx\", 0.02, \"method\", \"simpson\") as arguments.";
  itg = integrator("dx", 0.02, "method", "simpson");
  expected = "simpson";
  actual = itg.method;
  assert(expected, actual, msg, @strcmp);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.wk is set to [1/6, 2/3, 1/6] when the constructor is called with (\"dx\", 0.02, \"method\", \"simpson\") as arguments.";
  itg = integrator("dx", 0.02, "method", "simpson");
  expected = [1/6, 2/3, 1/6];
  actual = itg.wk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.xk is set to [0, 1/2, 1] when the constructor is called with (\"dx\", 0.02, \"method\", \"simpson\") as arguments.";
  itg = integrator("dx", 0.02, "method", "simpson");
  expected = [0, 1/2, 1];
  actual = itg.xk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.dx is set to 0.02 when the constructor is called with (\"dx\", 0.02, \"method\", \"simpson\") as arguments.";
  itg = integrator("dx", 0.02, "method", "simpson");
  expected = 0.02;
  actual = itg.dx;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.method is well inherited from the cloned integrator when the constructor is called with another integrator as argument.";
  itg1 = integrator("method", "middle", "dx", 0.5);
  itg2 = integrator(itg1);
  expected = "middle";
  actual = itg2.method;
  assert(expected, actual, msg, @strcmp);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.wk is well inherited from the cloned integrator when the constructor is called with another integrator as argument.";
  itg1 = integrator("method", "middle", "dx", 0.5);
  itg2 = integrator(itg1);
  expected = [1];
  actual = itg2.wk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.xk is well inherited from the cloned integrator when the constructor is called with another integrator as argument.";
  itg1 = integrator("method", "middle", "dx", 0.5);
  itg2 = integrator(itg1);
  expected = [1/2];
  actual = itg2.xk;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;

try
  msg = "Make sure that the property integrator.dx is well inherited from the cloned integrator when the constructor is called with another integrator as argument.";
  itg1 = integrator("method", "middle", "dx", 0.5);
  itg2 = integrator(itg1);
  expected = 0.5;
  actual = itg2.dx;
  assert(expected, actual, msg);
catch e
  print_error(e.message)
end
id += 1;
