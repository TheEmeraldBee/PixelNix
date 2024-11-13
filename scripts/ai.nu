def main [...args] {
  $env.GEMINI_API_KEY = (op read op://secrets/gemini-key/password)
  aichat ...$args
}
