class Solution:
    def findMaxK(self, nums: List[int]) -> int:
        # 1. Convert the list to a set for instant lookups
        seen = set(nums)
        max_k = -1
        
        # 2. Only look for positive numbers
        for i in nums:
            if i > 0:
                # 3. Check if the negative version exists in our set
                if -i in seen:
                    # 4. Keep track of the largest one
                    if i > max_k:
                        max_k = i
                        
        return max_k