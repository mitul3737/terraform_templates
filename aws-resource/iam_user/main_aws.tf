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



