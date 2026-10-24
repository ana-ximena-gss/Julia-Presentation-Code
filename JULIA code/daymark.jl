# Daymark | Temperature brief
# Summarize four daily Celsius readings with an average and a label per day.
# Run from this file's folder with: julia daymark.jl
# Or start Julia in this folder and run: include("daymark.jl")

# 1. Readings
# Keep the four observations together in one vector.
temperatures = [18, 22, 19, 25]
# Print the report heading and the stored readings.
println("Daymark | Temperature brief")
println("Readings: ", temperatures)
# Julia arrays are one-based, so index 1 selects the first reading.
println("First reading: ", temperatures[1], "°C")

# 2. Average
# Define a reusable calculation that returns the mean.
function average_temperature(values)
    # Start the accumulator at zero.
    total = 0
    # Visit each value and add it to the running total.
    for temperature in values
        total += temperature
    end
    # Divide by the number of readings and return the result.
    return total / length(values)
end

# Call the function with our vector.
average = average_temperature(temperatures)
# Add the returned value to the report.
println("Average: $(average)°C")

# 3. Daily labels
# Define one reusable rule: readings of 20°C or higher are warm.
function temperature_label(temp)
    if temp >= 20
        return "warm"
    else
        return "cool"
    end
end

# Print a label for each reading.
println("Daily labels:")
for temperature in temperatures
    # Interpolation inserts the reading and returned label into this string.
    println("$(temperature)°C: $(temperature_label(temperature))")
end
