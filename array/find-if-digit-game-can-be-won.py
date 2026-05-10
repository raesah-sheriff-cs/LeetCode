class Solution(object):
    def canAliceWin(self, nums):
        ss,ds=0,0
    
        for n in nums:
            if n<10:
                ss+=n
            else:
                ds+=n
        return ds!=ss
           