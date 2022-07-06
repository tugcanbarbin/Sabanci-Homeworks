#!/usr/bin/env python
# coding: utf-8

# In[33]:


#!pip install ecpy
#!pip install pycryptodome
import math
import time
import random
import sympy
import warnings
from random import randint, seed
import sys
from ecpy.curves import Curve,Point
from Crypto.Hash import SHA3_256, HMAC, SHA256
import requests
from Crypto.Cipher import AES
from Crypto import Random
from Crypto.Util.Padding import pad
from Crypto.Util.Padding import unpad
import random
import re
import json

API_URL = 'http://10.92.52.175:5000/'

stuID =  25168  ## Change this to your ID number

#server's Identitiy public key
curve = Curve.get_curve('secp256k1')
n = curve.order
P = curve.generator

IKey_Ser = Point(93223115898197558905062012489877327981787036929201444813217704012422483432813 , 8985629203225767185464920094198364255740987346743912071843303975587695337619, curve)

#Send Public Identitiy Key Coordinates and corresponding signature
def IKRegReq(h,s,x,y):
    mes = {'ID':stuID, 'H': h, 'S': s, 'IKPUB.X': x, 'IKPUB.Y': y}
    print("Sending message is: ", mes)
    response = requests.put('{}/{}'.format(API_URL, "IKRegReq"), json = mes)		
    if((response.ok) == False): print(response.json())

#Send the verification code
def IKRegVerify(code):
    mes = {'ID':stuID, 'CODE': code}
    print("Sending message is: ", mes)
    response = requests.put('{}/{}'.format(API_URL, "IKRegVerif"), json = mes)
    if((response.ok) == False): raise Exception(response.json())
    print(response.json())

#Send SPK Coordinates and corresponding signature
def SPKReg(h,s,x,y):
    mes = {'ID':stuID, 'H': h, 'S': s, 'SPKPUB.X': x, 'SPKPUB.Y': y}
    print("Sending message is: ", mes)
    response = requests.put('{}/{}'.format(API_URL, "SPKReg"), json = mes)		
    if((response.ok) == False): 
        print(response.json())
    else: 
        res = response.json()
        print( res['SPKPUB.X'],res['SPKPUB.Y'], res['H'], res['S'])
        return res['SPKPUB.X'], res['SPKPUB.Y'], res['H'], res['S']

#Send OTK Coordinates and corresponding hmac
def OTKReg(keyID,x,y,hmac):
    mes = {'ID':stuID, 'KEYID': keyID, 'OTKI.X': x, 'OTKI.Y': y, 'HMACI': hmac}
    print("Sending message is: ", mes)
    response = requests.put('{}/{}'.format(API_URL, "OTKReg"), json = mes)		
    print(response.json())
    if((response.ok) == False): return False
    else: return True

#Send the reset code to delete your Identitiy Key
#Reset Code is sent when you first registered
def ResetIK(rcode):
    mes = {'ID':stuID, 'RCODE': rcode}
    print("Sending message is: ", mes)
    response = requests.delete('{}/{}'.format(API_URL, "ResetIK"), json = mes)		
    print(response.json())
    if((response.ok) == False): return False
    else: return True

#Sign your ID  number and send the signature to delete your SPK
def ResetSPK(h,s):
    mes = {'ID':stuID, 'H': h, 'S': s}
    print("Sending message is: ", mes)
    response = requests.delete('{}/{}'.format(API_URL, "ResetSPK"), json = mes)		
    print(response.json())
    if((response.ok) == False): return False
    else: return True

#Send the reset code to delete your Identitiy Key
def ResetOTK(h,s):
    mes = {'ID':stuID, 'H': h, 'S': s}
    print("Sending message is: ", mes)
    response = requests.delete('{}/{}'.format(API_URL, "ResetOTK"), json = mes)		
    if((response.ok) == False): print(response.json())


# In[34]:


def keyGeneration(n, P):
    s_a = Random.new().read(int(math.log(n,2)))
    s_a = int.from_bytes(s_a, byteorder='big')%n # priv key
    Q_a = s_a * P # pub key
    return s_a, Q_a

def signatureGeneration(m, P, n, s_a):
    k = random.randint(1, n-2)
    R = k * P
    r = (R.x) % n
    m_ = m.to_bytes((m.bit_length()+7)//8,byteorder='big')
    print("Converted my ID to bytes in order to sign it:", m_)
    toHash = r.to_bytes((r.bit_length()+7)//8, byteorder='big') + m_
    h_ = int.from_bytes(SHA3_256.new(toHash).digest(), "big")
    h = h_ % n
    s = (k- s_a * h ) % n
    return h, s

def signatureVerification(m, P, Q_a, h, s):
    V = s*P + h*Q_a
    u = V.x % n
    m_ = m.to_bytes((m.bit_length()+7)//8,byteorder='big')
    toHashPrime =  u.to_bytes((u.bit_length()+7)//8, byteorder='big') + m_
    hPrime_ = int.from_bytes(SHA3_256.new(toHashPrime).digest(), "big")
    hPrime = hPrime_ % n
    return hPrime == h


# In[35]:


IKpri, IKpub = keyGeneration(n,P)
#print("IkPrivate = ", IKpri) # Private
print("Identitiy Key is created")
print("IKey is a long term key and shouldn't be changed and private part should be kept secret.")
print("IKpri = ", IKpri) #  priv
print("IKPublic.x = ", IKpub.x) # Public.x
print("IKPublic.y = ", IKpub.y) # Public.y
print("My ID number is", stuID)


# In[36]:


hID,sID = signatureGeneration(stuID, P, n, IKpri)


# In[37]:


print("Signature of my ID number is:")
print("h=",hID)
print("s=",sID)


# In[38]:


if signatureVerification(stuID, P, IKpub, hID, sID):
    print("Sending signature and my IKEY to server via IKRegReq() function in json format")
    IKRegReq(hID,sID,IKpub.x,IKpub.y)
    print("--------------------------------------------------------------------")
    print("Received the verification code through email")
    code=int(input("Enter verification code which is sent to you: "))
    print("Sending the verification code to server via IKRegVerify() function in json format")
    IKRegVerify(code)
    print("------------------------")
else:
    print("signature not verified, something is wrong")


# In[39]:


print("Generating SPK...")
SPKpri, SPKpub = keyGeneration(n,P)
print("Private SPK: ", SPKpri) # Private
print("Public SPK.x ", SPKpub.x) # Public.x
print("Public SPK.y: ", SPKpub.y) # Public.y


# In[40]:


def signatureGenerationSPK(m, P, n, s_a):
    k = random.randint(1, n-2)
    R = k * P
    r = (R.x) % n
    #m_ = m.to_bytes((m.bit_length()+7)//8,byteorder='big')
    toHash = r.to_bytes((r.bit_length()+7)//8, byteorder='big') + m
    h_ = int.from_bytes(SHA3_256.new(toHash).digest(), "big")
    h = h_ % n
    s = (k- s_a * h ) % n
    return h, s
print("Convert SPK.x and SPK.y to bytes in order to sign them then concatenate them")
print("result will be like: ")
SPKpubX_ = SPKpub.x.to_bytes((SPKpub.x.bit_length()+7)//8,byteorder='big')
SPKpubY_ = SPKpub.y.to_bytes((SPKpub.y.bit_length()+7)//8,byteorder='big')
SPKpub_ = SPKpubX_ + SPKpubY_
print(SPKpub_,"/n")
h,s = signatureGenerationSPK(SPKpub_, P, n, IKpri)
print("Signature of SPK is:")
print("h= ",h)
print("s= ",s)


# In[41]:


def signatureVerificationSPK(m, P, Q_a, h, s):
    V = s*P + h*Q_a
    u = V.x % n
    #m_ = m.to_bytes((m.bit_length()+7)//8,byteorder='big')
    toHashPrime =  u.to_bytes((u.bit_length()+7)//8, byteorder='big') + m
    hPrime_ = int.from_bytes(SHA3_256.new(toHashPrime).digest(), "big")
    hPrime = hPrime_ % n
    return hPrime == h
if signatureVerificationSPK(SPKpub_, P, IKpub, h, s):
    print("Sending SPK and the signatures to the server via SPKReg() function in json format...")
    SPKsPubX, SPKsPubY, Hs, Ss = SPKReg(h,s,SPKpub.x,SPKpub.y)
else:
    print("signature verification failed, something went wrong!")


# In[42]:


#SPKsPubX = 85040781858568445399879179922879835942032506645887434621361669108644661638219
#SPKsPubY = 46354559534391251764410704735456214670494836161052287022185178295305851364841
#Hs = 56754274807050399097922810452357969857725844857376334101637455493651754861384
#Ss = 57333352098706834749224940913999399616082884197298682650999251582766080153779
print("Server's SPK Verification")
print("Recreating the message(SPK) signed by the server")
SPKSpubX_ = SPKsPubX.to_bytes((SPKpub.x.bit_length()+7)//8,byteorder='big')
SPKSpubY_ = SPKsPubY.to_bytes((SPKpub.y.bit_length()+7)//8,byteorder='big')
SPKSpub_ = SPKSpubX_ + SPKSpubY_
print("Verifying the server's SPK...")
print("If server's SPK is verified we can move to the OTK generation step")
print("Is SPK verified?:",signatureVerificationSPK(SPKSpub_, P, IKey_Ser, Hs, Ss))


# In[43]:


def generateHMACKey(SPKprivate, SPKspublic):
    print("Creating HMAC key (Diffie Hellman)")
    T = SPKprivate * SPKspublic
    print('T is', T )
    Tx_ = T.x.to_bytes((T.x.bit_length()+7)//8,byteorder='big')
    Ty_ = T.y.to_bytes((T.x.bit_length()+7)//8,byteorder='big')
    U = Tx_ + Ty_ + b'NoNeedToRideAndHide'
    print('U is', U )
    KHmac = SHA3_256.new(U).digest()
    print("HMAC key is created", KHmac)
    return KHmac


# In[44]:


SPKSPub = Point(SPKsPubX,SPKsPubY,curve)
KHMAC= generateHMACKey(SPKpri,SPKSPub)


# In[45]:


print("Creating OTKs starting from index 0...")
for i in range(11):
    OTKipri, OTKipub = keyGeneration(n,P)
    print(i,"th key generated.", "Private part = ", OTKipri)
    print("Public (x coordinate) =",OTKipub.x)
    print("Public (y coordinate) =",OTKipub.y)
    OTKIpubX = OTKipub.x.to_bytes((OTKipub.x.bit_length()+7)//8,byteorder='big')
    OTKIpubY  = OTKipub.y.to_bytes((OTKipub.x.bit_length()+7)//8,byteorder='big')
    converted = OTKIpubX + OTKIpubY
    print("x and y coordinates of the OTK converted to bytes and concatanated message", converted)
    hmac_ = HMAC.new(KHMAC, converted,SHA256).hexdigest()
    OTKReg(i,OTKipub.x,OTKipub.y,hmac_)


# In[46]:


print("Trying to delete OTKs...")

ResetOTK(hID,sID)


# In[47]:


print("Trying to delete  SPK...")
ResetSPK(hID,sID)


# In[50]:


print("Trying to delete Identity Key...")
resetCode = input("plase enter the reset IK code that comes to your mail:")
ResetIK(resetCode)


# In[ ]:




