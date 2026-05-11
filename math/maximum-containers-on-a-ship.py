class Solution:
    def maxContainers(self, n: int, w: int, maxWeight: int) -> int:
        x= maxWeight//w
        if x<n*n:
            return x
        else:
            return n*n