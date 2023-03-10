# start부터 end까지의 합을 구하는 함수
def total(start, end):
    sum = 0
    for i in range(start, end+1):
        sum += i
    return sum

# num1과 num2의 사칙연산의 결과를 반환하는 함수
def calc(num1, num2):
    return num1 + num2, num1 - num2, num1 * num2, num1 / num2

# print(total(1, 100))
# print(calc(10, 3))