class Solution:
    def isPathCrossing(self, path: str) -> bool:
        d={}
        
        O=[0,0]
        N=[1,0]
        S=[-1,0]
        E=[0,1]
        W=[0,-1]

        x=0
        y=set()
        y.add(tuple(O))
       
        while(x<=len(path)-1):
            if path[x]=='N':
                O[0]=O[0]+N[0]
                O[1]=O[1]+N[1]
            if path[x]=='S':
                O[0]=O[0]+S[0]
                O[1]=O[1]+S[1]
            if path[x]=='E':
                O[0]=O[0]+E[0]
                O[1]=O[1]+E[1]
            if path[x]=='W':
                O[0]=O[0]+W[0]
                O[1]=O[1]+W[1]
            
            if tuple(O) in y:
                return True
            else:
                y.add(tuple(O))
            x=x+1
        return False
        
            
