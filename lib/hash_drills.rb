def shopping_list
{
    :sweets => ["soda", "candy", "potato chips"],
    :protein => {
        :meat => ["chicken", "fish", "steak"],
        :other => ["eggs", "nuts","beans"]
    },
    :dairy => ["milk", "yogurt", "cheese"],
    :fruits => ["bananas", "oranges", "apples", "grapes"],
    :vegetables => ["cabbage", "broccoli", "tomatoes", "carrots"],
    :grains => ["crackers", "rice", "bread", "pasta", "cereal"]
}
end

# Write methods and implementation here based on README instructions and tests


def vegetarian_ingredients 
    vegetarian = shopping_list
    vegetarian[:protein].delete(:meat)
    vegetarian[:protein][:other].shift
    vegetarian
end 

def ketogenic_ingredients
    keto = shopping_list.select {|key, value|[:vegetables, :protein, :dairy].include? key}
    keto[:dairy] = ['cheese']
    keto 
end 

def mediterranean_ingredients
    good_categories = [:protein, :dairy, :fruits, :vegetables, :grains]
    mediterranean_keys = shopping_list.select {|key, value| good_categories.include? key}
    mediterranean_keys[:protein][:meat].delete('steak')
    mediterranean_keys[:protein][:other] = ['nuts']
    mediterranean_keys[:dairy].delete('milk')
    mediterranean_keys

end 


def vegan_ingredients
    vegan = vegetarian_ingredients
    vegan.delete(:dairy)
    vegan
end 

def remove_allergens(ingredients_hash)
    ingredients_hash[:protein][:other].delete('nuts')
    ingredients_hash


end 