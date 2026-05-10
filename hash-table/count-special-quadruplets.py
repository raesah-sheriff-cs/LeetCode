class Solution(object):
    def countQuadruplets(self, nums):
   
        # Our "Sticky Note" to remember differences (d - c) we found on the right
        dic = {}
        n = len(nums)
        ans = 0
        
        # 'i' is our "Middle Man" walking backward through the hallway
        for i in range(n-1, 0, -1):
            
            # --- STEP 1: CHECK THE LEFT SIDE ---
            # The Middle Man pairs himself with everyone to his LEFT (j)
            for j in range(i-1, -1, -1):
                summ = nums[i] + nums[j] # This is our (a + b)
                
                # Check the Sticky Note: "Have we seen a difference that matches this sum?"
                if summ in dic:
                    ans += dic[summ] # If yes, add the count to our total
                    
            # --- STEP 2: UPDATE THE STICKY NOTE ---
            # Before moving further left, the Middle Man looks at everyone to his RIGHT (k)
            for k in range(n-1, i, -1):
                diff = nums[k] - nums[i] # This is our (d - c)
                
                # Scribble this difference on the Sticky Note for the next 'i' to find
                if diff in dic:
                    dic[diff] += 1
                else:
                    dic[diff] = 1
                    
        return ans