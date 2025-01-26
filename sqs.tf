provider "aws" {
  region = "us-east-1"
}

resource "aws_sqs_queue" "videos_to_process_queue" {
  name                        = "videos-to-process-queue"
  visibility_timeout_seconds  = 30       # Timeout for processing messages
  message_retention_seconds   = 345600   # Retain messages for 4 days
  delay_seconds               = 0        # Delay delivery of messages by 0 seconds
  max_message_size            = 262144   # Maximum message size in bytes (256 KB)
  receive_wait_time_seconds   = 0        # Wait time for long polling
  fifo_queue                  = true    # Set to true if you want a FIFO queue
  kms_master_key_id           = "alias/aws/sqs" # Default AWS-managed key for encryption
  kms_data_key_reuse_period_seconds = 300 # Key reuse period in seconds

  tags = {
    Project = "dotvideos"
  }
}

output "sqs_queue_url" {
  value = aws_sqs_queue.videos_to_process_queue.id
}
