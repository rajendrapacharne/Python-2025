first=int(input("Enter First Number"))
second=int(input("Enter second Number"))
third=int(input("Enter third Number"))
if(first>second and first>third):
    print(first ,"number is greater")
elif(third>second and third>first):
    print(third ,"number is greater")
else:
    print(second ,"number is greater")
