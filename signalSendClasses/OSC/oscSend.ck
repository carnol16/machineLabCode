OscOut out;

out.dest("192.168.1.145", 8001);

out.start("/meow");
out.add(100);
out.add(10);
out.send();