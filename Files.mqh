
class File
{
  public:
    int GetFileType(string file_name);
    void WriteAllText(string file_name, string text);
    void AppendAllText(string file_name, string text);
    string ReadAllText(string file_name);
};

int File::GetFileType(string file_name)
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

void File::WriteAllText(string file_name, string text)
{
  int file_type = GetFileType(file_name);
  
  int handle = FileOpen(file_name, file_type | FILE_ANSI | FILE_WRITE);
  
  if (handle == INVALID_HANDLE)
    return;
  
  FileWriteString(handle, text, StringLen(text));
  
  FileFlush(handle);
  FileClose(handle);
}

void File::AppendAllText(string file_name, string text)
{
  int file_type = GetFileType(file_name);
  
  int handle = FileOpen(file_name, file_type | FILE_ANSI | FILE_READ | FILE_WRITE);
  
  if (handle == INVALID_HANDLE)
    return;
  
  FileSeek(handle, 0, SEEK_END);
  FileWriteString(handle, text, StringLen(text));
  
  FileFlush(handle);
  FileClose(handle);
}

string File::ReadAllText(string file_name)
{
  int file_type = GetFileType(file_name);
  
  int handle = FileOpen(file_name, file_type | FILE_ANSI | FILE_READ);
  
  if (handle == INVALID_HANDLE)
    return "";
  
  string str = "";
    
  while (!FileIsEnding(handle))
    str += FileReadString(handle) + "\n";
    
  return str;
}
