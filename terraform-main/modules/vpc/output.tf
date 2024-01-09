output vpc_id {
  value = aws_vpc.my_vpc.id
}
output pub1_sub_id {
 value = aws_subnet.Public_sub2a.id
}
output pub2_sub_id {
 value = aws_subnet.Public_sub2b.id
}
output pri1_sub_id{
value = aws_subnet.db_private_sub2a.id
}
output pri2_sub_id{
value = aws_subnet.Private_sub2b.id
}

