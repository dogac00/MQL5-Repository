
#include <JAson.mqh>

void OnStart() 
{ 
   string file_content = ReadContent("FILE_NAME.txt");
   
   DeserializeString(file_content);
}
  
string ReadContent(string file_name)
{
   string content = "";

   ResetLastError(); 
   
   int file_handle=FileOpen(file_name,FILE_READ|FILE_TXT|FILE_ANSI); 
   
   if(file_handle!=INVALID_HANDLE) 
     {
      int    str_size;
      string str;
      
      while(!FileIsEnding(file_handle)) 
        { 
         str_size=FileReadInteger(file_handle,INT_VALUE); 
         
         str=FileReadString(file_handle,str_size);
         
         content += str;
        } 
      FileClose(file_handle);
     } 
   else 
      PrintFormat("Failed to open file, Error code = %d",GetLastError());
      
   return content;
}

void DeserializeString(string text)
{
   CJAVal jv;
   
   jv.Deserialize(text);
   
   Print(jv["BoolParameterName"].ToBool());
   Print(jv["DoubleParameterName"].ToDbl());
   Print(jv["IntParameterName"].ToInt());
   Print(jv["StringParameterName"].ToStr());
}
