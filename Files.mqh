
int GetTextType(string text)
{
  char chars[];
  
  StringToCharArray(text, chars);
  
  for (int i = 0; i < ArraySize(chars); i++)
    if (chars[i] < 0)
      return FILE_UNICODE;
  
  return FILE_ANSI;
}

int GetFileType(string file_name)
{
  if (StringFind(file_name, ".csv") != -1)
    return FILE_CSV;
  if (StringFind(file_name, ".txt") != -1)
    return FILE_TXT;
  if (StringFind(file_name, ".bin") != -1)
    return FILE_BIN;
  if (StringFind(file_name, ".exe") != -1)
    return FILE_BIN;
  if (StringFind(file_name, ".dll") != -1)
    return FILE_BIN;
    
  return -1;
}

void WriteAllText(string file_name, string text)
{
  int file_type = GetFileType(file_name);
  int text_type = GetTextType(file_name);

  int handle = FileOpen(file_name, text_type | file_type | FILE_WRITE);
  
  if (handle == INVALID_HANDLE)
    return;
  
  FileWriteString(handle, text, StringLen(text));
  
  FileFlush(handle);
  FileClose(handle);
}

void AppendAllText(string file_name, string text)
{
  int file_type = GetFileType(file_name);
  int text_type = GetTextType(file_name);

  int handle = FileOpen(file_name, text_type | file_type | FILE_READ | FILE_WRITE);
  
  if (handle == INVALID_HANDLE)
    return;
  
  FileSeek(handle, 0, SEEK_END);
  FileWriteString(handle, text, StringLen(text));
  
  FileFlush(handle);
  FileClose(handle);
}

string ReadAllText(string file_name)
{
  int file_type = GetFileType(file_name);
  int text_type = GetTextType(file_name);

  int handle = FileOpen(file_name, text_type | file_type | FILE_READ);
  
  if (handle == INVALID_HANDLE)
    return "";
  
  string str = "";
    
  while (!FileIsEnding(handle))
    str += FileReadString(handle) + "\n";
    
  return str;
}
