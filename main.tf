resource "aws_eks_cluster" "eks" {
  name     = "kubus-eks-cluster"
  role_arn = aws_iam_role.kubus_eks_role.arn

  vpc_config {
    subnet_ids = var.subnet_ranges
  }

  depends_on = [aws_iam_role_policy_attachment.kubus_eks_policy]
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "kubus-worker-node-nonprod"
  node_role_arn   = aws_iam_role.kubus_node_instance_role.arn
  subnet_ids      = var.subnet_ranges

  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.registry_policy,
  ]
}
