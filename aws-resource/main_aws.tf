provider "aws"{
    region = "us-east-1"
}

resource "aws_iam_user" "my-user" {
    name = "my-user"
    tags={
        Description = "This is my user"
    }
}


resource "aws_iam_policy" "my-user-policy" {
    name = "my-user-policy"
    policy= file("my-user-policy.json")
}

resource "aws_iam_user_policy_attachment" "my-user-policy-attachment" {
    user = aws_iam_user.my-user.name
    policy_arn = aws_iam_policy.my-user-policy.arn
}


resource "aws_dynamodb_table" "cars"{
    name = "cars"
    hash_key = "VIN"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
        name = "VIN"
        type = "S"
    }
}

resource "aws_dynamodb_table_item" "car-items"{
    table_name = aws_dynamodb_table.cars.name
    hash_key   = aws_dynamodb_table.cars.hash_key
    item       = jsonencode({
        "Manufacturer": {"S":"Toyota"},
        "Make": {"S":"Corolla"},
        "Year": {"N":"2004"},
        "VIN": {"S":"1234567890"},
    }  )
}

