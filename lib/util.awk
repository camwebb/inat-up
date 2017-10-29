function curl(method, header, data, url,    RSIN, curlback, methodpart, \
              headerpart) {
  
  RSIN = RS;
  RS="\x04";

  if (method == "GET") methodpart = "-G";
  if (method == "POST") methodpart = "-X POST";
  
  if (header) headerpart = "--header '" header "'";

  cmd = "curl -s " methodpart " " headerpart " " data " '" url "'";
  # print cmd > "/dev/stderr";
  cmd | getline curlback;
  close(cmd);
  RS=RSIN;
  return curlback;
}
