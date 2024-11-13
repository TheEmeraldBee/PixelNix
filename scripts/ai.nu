$env.GEMINI_API_KEY = (op read op://secrets/gemini-key/password)

def main [...command] {
  $env.GEMINI_API_KEY = (op read op://secrets/gemini-key/password)
  aichat ($command | str join " ")
}
