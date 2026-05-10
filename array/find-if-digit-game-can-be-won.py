class Solution(object):
    def canAliceWin(self, nums):
        ss=0
        ds=0
        for n in nums:
            if n<10:
                ss+=n
            else:
                ds+=n
        print(ss,ds)
        if ds!=ss:
           return True
        return False
        