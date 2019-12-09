void ReadPositionsFile()
{
  string content = GetFileContent("positions.txt");
  ushort sep = StringGetCharacter("|", 0);
  string all_models[];
  
  StringSplit(content, sep, all_models);
  
  int all_models_length = ArraySize(all_models);
  int current_model_index = 0;
  
  for (int i = 0; i < all_models_length; i++)
  {
    string current_model[];
    ushort second_sep = StringGetCharacter(",", 0);
    
    StringSplit(all_models[i], second_sep, current_model);
    
    int cur_size = ArraySize(current_model);
    int counter;
    
    for (counter = 0; counter < cur_size; counter++)
    {
      open_position_tickets[current_model_index][counter] = StringToInteger(current_model[counter]);
    }
    
    for (counter = counter; open_position_tickets[current_model_index][counter] != NULL; counter++)
    {
      open_position_tickets[current_model_index][counter] = NULL;
    }
    
    current_model_index++;
    
    ArrayFree(current_model);
  }
  
  ArrayFree(all_models);
}
