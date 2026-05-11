class Solution:
    def findMaxK(self, nums: List[int]) -> int:
        s=set()
        for n in nums:
            if -n in nums:
                s.add(n)
        if len(s)==0:
            return -1
        else:
            return max(s)