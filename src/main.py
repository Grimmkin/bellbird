from fastapi import FastAPI
import newspaper

app = FastAPI()

@app.get("/")
async def get_news() -> list:
	print("Working...")
	cnn_paper = newspaper.build('https://www.nytimes.com/international/', memoize_articles = False)
	for article in cnn_paper.articles:
		print(article.url)
		print("WIP")
	result = [article.url for article in cnn_paper.articles]
	return result
	