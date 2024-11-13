# Set Gemini key from the 1password value
$env.GEMINI_API_KEY = (op read op://secrets/gemini-key/password)

# Run AiChat with the configuration
aichat
