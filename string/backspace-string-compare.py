class Solution:
    def backspaceCompare(self, s: str, t: str) -> bool:
        s1=[]
        s2=[]
        x=0
        y=0
        while x <= len(s)-1:
            if s[x] != '#':
                s1.append(s[x])
            elif s1:  # <--- The Safety Check: Only pop if s1 is NOT empty
                s1.pop()
            x = x + 1
        while y<=len(t)-1:
            if t[y]!='#':
                s2.append(t[y])
            elif s2:
                s2.pop()
            y=y+1
        if s1==s2:
            return True
        return False