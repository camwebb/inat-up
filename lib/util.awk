function curl(method, header, data, url,    RSIN, curlback, methodpart, \
              headerpart, cmd) {
  
  RSIN = RS;
  RS="\x04";

  if (method == "GET") methodpart = "-G";
  if (method == "POST") methodpart = "-X POST";
  
  if (header) headerpart = "--header '" header "'";

  cmd = "curl -s " methodpart " " headerpart " " data " '" url "'";
  if (DEBUG) {
    print cmd > "/dev/stderr";
    close("/dev/stderr");
  }
  cmd | getline curlback;
  close(cmd);
  RS=RSIN;
  if (DEBUG) {
    print curlback > "/dev/stderr";
    close("/dev/stderr");
  }
  return curlback;
}

function log(msg) {
  print msg >> "upload.log";
  close("upload.log");
  print msg > "/dev/stderr";
  close("/dev/stderr");
}
