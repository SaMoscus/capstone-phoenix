output "control_plane_public_ip" {
  value = aws_instance.control_plane.public_ip
}

output "control_plane_private_ip" {
  value = aws_instance.control_plane.private_ip
}

output "worker_public_ips" {
  value = aws_instance.workers[*].public_ip
}

output "worker_private_ips" {
  value = aws_instance.workers[*].private_ip
}

output "ansible_inventory" {
  value = <<-EOF
[control_plane]
${aws_instance.control_plane.public_ip} ansible_user=ubuntu ansible_host=${aws_instance.control_plane.public_ip} private_ip=${aws_instance.control_plane.private_ip} ansible_ssh_private_key_file=${local.ssh_key_path}

[workers]
${join("\n", [for node in aws_instance.workers : "${node.public_ip} ansible_user=ubuntu ansible_host=${node.public_ip} private_ip=${node.private_ip} ansible_ssh_private_key_file=${local.ssh_key_path}"])}

[k3s_cluster:children]
control_plane
workers
EOF
}

