class Solution:
    def findMaxK(self, nums: List[int]) -> int:
        d={}
        def dad(x):
            if x not in d:
                d[x]=1
            else:
                d[x]+=1

        for n in nums:
            if n<0:
                dad(-(n))
            else:
                dad(n)
        result = max((k for k, v in d.items() if v == 2), default=-1)
        return result