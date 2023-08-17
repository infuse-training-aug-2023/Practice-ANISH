class Calc:
    def __init__(self):
        self.a = 0
        self.b = 0


    def get_input(self):
        self.a = int(input("Enter the first Number : "))
        self.b = int(input("Enter the Second Number : "))
        operation = input("What You wna t to Do?(+,-,*,/):")
        
        if operation == "+":
            self.sum()
        elif operation == "-":
            self.sub()
        
        else :
            print("Wrong Operation!!!!")

    def print(self,operation,sum):
        print(str(self.a) + " "  + operation + " " + str(self.b) +" = "+str(sum))
    
    def sum():
        sum = self.a +self.b
        self.print(operation,sum)
    def sub():
        sum = self.a -self.b
        self.print(operation,sum)
    



c = Calc()

c.get_input()



#         elif operation == "*":
#             self.mul()

    # def mul():
    #     sum = self.a *self.b
    #     self.print(operation,sum)
    # def div():
    #     sum = self.a /self.b
    #     self.print(operation,sum)