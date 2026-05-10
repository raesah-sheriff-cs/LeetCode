class Solution(object):
    def countQuadruplets(self, nums):
   
        dic = {}
        n = len(nums)
        ans = 0

        for i in range(n-1, 0, -1):
            for k in range(n-1, i, -1):
                diff = nums[k] - nums[i] # (d - c)

                if diff in dic:
                    dic[diff] += 1
                else:
                    dic[diff] = 1

            for j in range(i-1, -1, -1):
                summ = nums[i] + nums[j] # (a + b)
                
                # Check the Sticky Note: "Have we seen a difference that matches this sum?"
                if summ in dic:
                    ans += dic[summ] # If yes, add the count to our total
                    
            # Before moving further left, the Middle Man looks at everyone to his RIGHT (k)
            
                    
        return ans