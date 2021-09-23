from fastapi import APIRouter
from ai_api_utils.submodules import TaskRouter

router = APIRouter()

input = [
    {
        "type": "text",
        "name": "word",
        "default": "cat",
        "placeholder": "cat",
        "tooltip": "Insert the word to pluralize here",
    },
    {
        "type": "int",
        "name": "count",
        "default": 2,
        "placeholder": 2,
        "tooltip": "Insert the number associated to the word to pluralize",
    },
]

output = [
    {
        "type": str,
        "name": "pluralized_text",
    }
]


TaskRouter(router=router, input=input, output=output, default_model="inflect")
