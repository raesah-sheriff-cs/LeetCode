class Solution:
    def isPathCrossing(self, path: str) -> bool:
        O=[0,0]
        x=0
        y=set()
        y.add(tuple(O))
       
        while(x<=len(path)-1):
            if path[x]=='N':
                O[0]=O[0]+1
                #O[1]=O[1]+0
            if path[x]=='S':
                O[0]=O[0]-1
                #O[1]=O[1]+0
            if path[x]=='E':
                #O[0]=O[0]+E[0]
                O[1]=O[1]+1
            if path[x]=='W':
                #O[0]=O[0]+0
                O[1]=O[1]-1
            
            if tuple(O) in y:
                return True
            else:
                y.add(tuple(O))
            x=x+1
        return False
        
            
