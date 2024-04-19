# Python program to update
# JSON
  
import json
  
# function to add to JSON
def write_json(new_data, filename='gke-dashboard.json'):
    with open(filename,'r+') as file:
          # First we load existing data into a dict.
        file_data = json.load(file)
        # Join new_data with file_data inside emp_details
        file_data["mosaicLayout"]["tiles"].append(new_data)
        # Sets file's current position at offset.
        file.seek(0)
        # convert back to json.
        json.dump(file_data, file, indent = 4)
 
# python object to be appended
with open('append_dashboard.json') as f:
   new_data_list = json.load(f)
   new_data      = new_data_list[0]

# calling function     
write_json(new_data)