class Solution:
    def maxContainers(self, n: int, w: int, maxWeight: int) -> int:
        x= maxWeight//w
        return min(x,n*n)