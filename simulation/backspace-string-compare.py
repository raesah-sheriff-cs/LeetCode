class Solution:
    def backspaceCompare(self, s: str, t: str) -> bool:
        s1=[]
        s2=[]
        x=0
        y=0
        c=0
        d=0
        while x<=len(s)-1:
            if s[x]!='#':
                s1.append(s[x])
            else:
                c+=1
            x=x+1
        while y<=len(t)-1:
            if t[y]!='#':
                s2.append(t[y])
            else:
                d+=1
            y=y+1
        
        while c>0:
            s1.pop()
            c=c-1
        while d>0:
            s2.pop()
            d=d-1
            
        if s1==s2:
            return True
        return False