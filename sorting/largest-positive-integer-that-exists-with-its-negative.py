class Solution:
    def findMaxK(self, nums: List[int]) -> int:
        s=set()
        for n in nums:
            if -n in nums:
                s.add(n)
        if s:
            return max(s)
        else:
            return -1