def main [...args] {
  if ("GEMINI_API_KEY" not-in $env) {
    export-env {
      $env.GEMINI_API_KEY = (op read op://secrets/gemini-key/password)
    }
  }
  aichat ...$args
}
