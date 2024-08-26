extends Control
@onready var quiz_label = $VBoxContainer/QuizLabel
@onready var item_list = $VBoxContainer/ItemList


# Define an array named `data_to_send` to store data for multiple questions
var data_to_send = [

  # Define a dictionary containing information for a single question
	{
		"questions": "Why am I doing this, is a question that can be positive by replacing it with What",
		"options": ["True", "False"],  # Use double quotes for string values
		"correctOptionIndex": 0
	},
	{
		"questions": "If we constantly think about our shortcomings, it's bad for our mental state.",
		"options": ["True", "False"],
		"correctOptionIndex": 0  # Changed to 1 for a different correct answer
	},
	{
		"questions": "What are my strengths in this situation? Is this a good question to ask ourselves? ",
		"options": ["True", "False"],
		"correctOptionIndex": 0  # Changed to 1 for a different correct answer
	},
	{
		"questions": "Everyone makes mistakes. How can I learn and move forward? This is a good thought.",
		"options": ["True", "False"],
		"correctOptionIndex": 0  # Changed to 1 for a different correct answer
	}
	

]

# No need for JSON conversion, data is already a dictionary array
var items: Array = data_to_send  # Stores the questions data
var item : Dictionary  # Stores data for the current question
var index_item: int = 0  # Keeps track of the current question index

var correct: float = 0  # Tracks the number of correct answers

# Called when the node enters the scene tree for the first time.
func _ready():
	refresh_scene()  # Call refresh scene on ready

# Function to refresh the scene (show next question or result)
func refresh_scene():
	if index_item >= items.size():
		print("Hye this is show_result")
		show_result()
	else:
		print("This is show_question")
		show_question()

# Function to display the final result (score)
func show_result():
	print("This is show result")
	item_list.hide()  # Hide the list of options (assuming a UI element)
	var score = round(correct / items.size() * 100)  # Calculate score as a percentage
	var greet = "Congratulations" if score >= 60 else "Oh no"  # Ternary operator for setting greet message
	quiz_label.text = "{greet} ! Your score is {score}".format({"greet": greet, "score": score})  # Format the result string

# Function to display the current question
func show_question():
	item_list.clear()  # Clear any previous options
	item_list.show()  # Show the list of options (assuming a UI element)
	item = items[index_item]  # Get the data for the current question
	print(item)
	quiz_label.text = item["questions"]
	print(quiz_label)  # Access the question text from the dictionary
	var options = item["options"]  # Get the options list from the dictionary
	for option in options:
		item_list.add_item(option)  # Add each option to the list

# Function called when an option is selected in the list
func _on_item_list_item_selected(index):
	if index == item.get("correctOptionIndex"):  # Check if the selected option is correct (using get for potential null check)
		correct += 1
	index_item += 1
	refresh_scene() # Move to the next question
	
