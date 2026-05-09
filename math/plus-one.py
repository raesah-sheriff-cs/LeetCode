class Solution(object):
    def plusOne(self, digits):
        n=int("".join(map(str, digits)))+1
        return list(map(int, str(n)))

        
        