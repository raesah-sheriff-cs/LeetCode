class Solution:
    def backspaceCompare(self, s: str, t: str) -> bool:
        l1=len(s)-1
        l2=len(t)-1
        s1=[]
        s2=[]
    
        while l1>=0 or l2>=0:
            if s[l1]!='#':
                s1.append(s[l1])
            if t[l2]!='#':
                s2.append(t[l2])
            elif s[l1]=='#':
                l1=l1-1
            elif t[l2]=='#':
                l2=l2-1
            l1=l1-1
            l2=l2-1
    print (s1,s2)
        
