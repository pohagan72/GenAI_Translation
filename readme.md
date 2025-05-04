

### Text Analysis:

Prompt for reviewing the text for which languages are present and counting the number of words. Designed to always return the JSON with no other response from the LLM

```
Please analyze the text provided below. Your task is to:
Determine the number of distinct languages present.
Count the total number of words. Follow standard word counting rules, treating hyphenated words as one and counting bracketed citations like [1] as one word.
Count the words belonging to each identified language. Use the full language name (e.g., "English", "German") as the key.
Your response MUST be ONLY the following JSON structure, with no other text before or after it:
{{
"languageAnalysis": {{
"numberOfLanguages": <integer>,
"totalWords": <integer>,
"wordsPerLanguage": {{
"<LanguageName1>": <integer>,
"<LanguageName2>": <integer>
}}
}}
}}
--- TEXT TO ANALYZE START ---
{text}
--- TEXT TO ANALYZE END ---
```

### Text Translation:

Re-use of this prompt: https://github.com/pohagan72/Prompt_Library/blob/main/Translation.md which has proven to be excellent for text translation activities across mulitple different cloud hosted and local LLMs.

