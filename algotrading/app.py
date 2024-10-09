from starlite import Starlite, get


@get("/greet/{name:str}")
def greet(name: str) -> dict:
    """
    Return a greeting for the given name.
    """
    return {"message": f"Hello, {name}!"}


app = Starlite(route_handlers=[greet])

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("my_project.app:app", reload=True)
