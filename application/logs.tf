# logs.tf

# Set up cloudwatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "cb_log_group" {
  name              = "/ecs/hello-app"
  retention_in_days = 30

  tags = {
    Name = "node-hello-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "cb_log_stream" {
  name           = "node-hello-log-stream"
  log_group_name = "${aws_cloudwatch_log_group.cb_log_group.name}"
}
