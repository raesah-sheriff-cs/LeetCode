class Solution:
    def reverseDegree(self, s: str) -> int:
        res=0
        for i in range(len(s)):
            x=ord('a')-ord(s[i])
            res+=((x+ord('z')-96)*(i+1))
        return res