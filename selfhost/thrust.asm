BITS 64
segment .text
print:
    mov     r9, -3689348814741910323
    sub     rsp, 40
    mov     BYTE [rsp+31], 10
    lea     rcx, [rsp+30]
.L2:
    mov     rax, rdi
    lea     r8, [rsp+32]
    mul     r9
    mov     rax, rdi
    sub     r8, rcx
    shr     rdx, 3
    lea     rsi, [rdx+rdx*4]
    add     rsi, rsi
    sub     rax, rsi
    add     eax, 48
    mov     BYTE [rcx], al
    mov     rax, rdi
    mov     rdi, rdx
    mov     rdx, rcx
    sub     rcx, 1
    cmp     rax, 9
    ja      .L2
    lea     rax, [rsp+32]
    mov     edi, 1
    sub     rdx, rax
    xor     eax, eax
    lea     rsi, [rsp+32+rdx]
    mov     rdx, r8
    mov     rax, 1
    syscall
    add     rsp, 40
    ret
global _start
_start:
    mov [args_ptr], rsp
    mov rax, ret_stack_end
    mov [ret_stack_rsp], rax
addr_0:
    ;; -- func --
    jmp addr_24
addr_1:
    ;; -- stack prep --
    sub rsp, 8
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_2:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_3:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_4:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_5:
    ;; -- while --
addr_6:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_7:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_8:
    ;; -- cast(ptr) --
addr_9:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_10:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_11:
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
addr_12:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_23
addr_13:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_14:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_15:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_16:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_17:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_18:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_19:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_20:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_21:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_22:
    ;; -- end --
    jmp addr_5
addr_23:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 8
    ret
addr_24:
    ;; -- func --
    jmp addr_64
addr_25:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_26:
    ;; -- while --
addr_27:
    ;; -- if --
addr_28:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_29:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_30:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_31:
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
addr_32:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_33:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_34:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_35:
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
addr_36:
    ;; -- band --
    pop rax
    pop rbx
    and rbx, rax
    push rbx
addr_37:
    ;; -- cast(bool) --
addr_38:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_45
addr_39:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_40:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_41:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_42:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_43:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_44:
    ;; -- else --
    jmp addr_46
addr_45:
    ;; -- push bool 0 --
    mov rax, 0
    push rax
addr_46:
    ;; -- end --
addr_47:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_54
addr_48:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_49:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_50:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_51:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_52:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_53:
    ;; -- end --
    jmp addr_26
addr_54:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_55:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_56:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_57:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_58:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_59:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_60:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_61:
    ;; -- band --
    pop rax
    pop rbx
    and rbx, rax
    push rbx
addr_62:
    ;; -- cast(bool) --
addr_63:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_64:
    ;; -- func --
    jmp addr_170
addr_65:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_66:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_67:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_68:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_69:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_70:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_71:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_72:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_73:
    ;; -- cast(ptr) --
addr_74:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_75:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_76:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_77:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_78:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_79:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_80:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_81:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_82:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_83:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_84:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_85:
    ;; -- while --
addr_86:
    ;; -- if --
addr_87:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_88:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_89:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_90:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_91:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_92:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_93:
    ;; -- inv --
    mov rcx, 0
    mov rdx, 1
    pop rax
    cmp rax, rcx
    cmove rcx, rdx
    push rcx
addr_94:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_104
addr_95:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_96:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_97:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_98:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_99:
    ;; -- cast(ptr) --
addr_100:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_101:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_102:
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
addr_103:
    ;; -- else --
    jmp addr_105
addr_104:
    ;; -- push bool 0 --
    mov rax, 0
    push rax
addr_105:
    ;; -- end --
addr_106:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_138
addr_107:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_108:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_109:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_110:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_111:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_112:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_113:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_114:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_115:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_116:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_117:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_118:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_119:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_120:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_121:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_122:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_123:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_124:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_125:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_126:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_127:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_128:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_129:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_130:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_131:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_132:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_133:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_134:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_135:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_136:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_137:
    ;; -- end --
    jmp addr_85
addr_138:
    ;; -- drop --
    pop rax
addr_139:
    ;; -- if --
addr_140:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_141:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_142:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_143:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_144:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_145:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_146:
    ;; -- inv --
    mov rcx, 0
    mov rdx, 1
    pop rax
    cmp rax, rcx
    cmove rcx, rdx
    push rcx
addr_147:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_167
addr_148:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_149:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_150:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_151:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_152:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_153:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_154:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_155:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_156:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_157:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_158:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_159:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_160:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_161:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_162:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_163:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_164:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_165:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_166:
    ;; -- end --
addr_167:
    ;; -- drop --
    pop rax
addr_168:
    ;; -- drop --
    pop rax
addr_169:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_170:
    ;; -- func --
    jmp addr_216
addr_171:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_172:
    ;; -- while --
addr_173:
    ;; -- if --
addr_174:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_175:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_176:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_177:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_178:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_179:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_180:
    ;; -- inv --
    mov rcx, 0
    mov rdx, 1
    pop rax
    cmp rax, rcx
    cmove rcx, rdx
    push rcx
addr_181:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_191
addr_182:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_183:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_184:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_185:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_186:
    ;; -- cast(ptr) --
addr_187:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_188:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_189:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_190:
    ;; -- else --
    jmp addr_192
addr_191:
    ;; -- push bool 0 --
    mov rax, 0
    push rax
addr_192:
    ;; -- end --
addr_193:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_213
addr_194:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_195:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_196:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_197:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_198:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_199:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_200:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_201:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_202:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_203:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_204:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_205:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_206:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_207:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_208:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_209:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_210:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_211:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_212:
    ;; -- end --
    jmp addr_172
addr_213:
    ;; -- drop --
    pop rax
addr_214:
    ;; -- drop --
    pop rax
addr_215:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_216:
    ;; -- func --
    jmp addr_298
addr_217:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_218:
    ;; -- push mem --
    mov rax, mem
    add rax, 0
    push rax
addr_219:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_220:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_221:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_222:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_223:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_224:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_225:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_226:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_227:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_228:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_229:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_230:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_231:
    ;; -- push mem --
    mov rax, mem
    add rax, 16
    push rax
addr_232:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_233:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_234:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_235:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_236:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_237:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_238:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_239:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_240:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_241:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_242:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_243:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_244:
    ;; -- if --
addr_245:
    ;; -- push mem --
    mov rax, mem
    add rax, 0
    push rax
addr_246:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_247:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_248:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_249:
    ;; -- push mem --
    mov rax, mem
    add rax, 16
    push rax
addr_250:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_251:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_252:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_253:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_254:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_295
addr_255:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_256:
    ;; -- while --
addr_257:
    ;; -- if --
addr_258:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_259:
    ;; -- push mem --
    mov rax, mem
    add rax, 0
    push rax
addr_260:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_261:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_262:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_263:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_264:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_283
addr_265:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_266:
    ;; -- push mem --
    mov rax, mem
    add rax, 0
    push rax
addr_267:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_268:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_269:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_270:
    ;; -- cast(ptr) --
addr_271:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_272:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_273:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_274:
    ;; -- push mem --
    mov rax, mem
    add rax, 16
    push rax
addr_275:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_276:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_277:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_278:
    ;; -- cast(ptr) --
addr_279:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_280:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_281:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_282:
    ;; -- else --
    jmp addr_284
addr_283:
    ;; -- push bool 0 --
    mov rax, 0
    push rax
addr_284:
    ;; -- end --
addr_285:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_289
addr_286:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_287:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_288:
    ;; -- end --
    jmp addr_256
addr_289:
    ;; -- push mem --
    mov rax, mem
    add rax, 0
    push rax
addr_290:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_291:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_292:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_293:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_294:
    ;; -- else --
    jmp addr_296
addr_295:
    ;; -- push bool 0 --
    mov rax, 0
    push rax
addr_296:
    ;; -- end --
addr_297:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_298:
    ;; -- func --
    jmp addr_304
addr_299:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_300:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_301:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_302:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_303:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_304:
    ;; -- func --
    jmp addr_311
addr_305:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_306:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_307:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_308:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_309:
    ;; -- drop --
    pop rax
addr_310:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_311:
    ;; -- func --
    jmp addr_318
addr_312:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_313:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_314:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_315:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_316:
    ;; -- drop --
    pop rax
addr_317:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_318:
    ;; -- func --
    jmp addr_365
addr_319:
    ;; -- stack prep --
    sub rsp, 32
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_320:
    ;; -- if --
addr_321:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_322:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_323:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_324:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_328
addr_325:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_0
addr_326:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_305
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_327:
    ;; -- else --
    jmp addr_362
addr_328:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_329:
    ;; -- push int 32 --
    mov rax, 32
    push rax
addr_330:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_331:
    ;; -- while --
addr_332:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_333:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_334:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovg rcx, rdx
    push rcx
addr_335:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_354
addr_336:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_337:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_338:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_339:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_340:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_341:
    ;; -- push int 10 --
    mov rax, 10
    push rax
addr_342:
;   -- division --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rax
addr_343:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_344:
    ;; -- push int 10 --
    mov rax, 10
    push rax
addr_345:
;   -- modulo --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rdx
addr_346:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_347:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_348:
    ;; -- push int 48 --
    mov rax, 48
    push rax
addr_349:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_350:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_351:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_352:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_353:
    ;; -- end --
    jmp addr_331
addr_354:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_355:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_356:
    ;; -- push int 32 --
    mov rax, 32
    push rax
addr_357:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_358:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_359:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_360:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_361:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_305
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_362:
    ;; -- end --
addr_363:
    ;; -- drop --
    pop rax
addr_364:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 32
    ret
addr_365:
    ;; -- func --
    jmp addr_410
addr_366:
    ;; -- stack prep --
    sub rsp, 16
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_367:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_368:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_369:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_370:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_371:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_372:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_373:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_374:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_375:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_376:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_377:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_378:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_379:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_380:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_381:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_382:
    ;; -- while --
addr_383:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_384:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_385:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_386:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_387:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_388:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_389:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_408
addr_390:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_391:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_392:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_393:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_394:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_395:
    ;; -- cast(ptr) --
addr_396:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_397:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_398:
    ;; -- push int 48 --
    mov rax, 48
    push rax
addr_399:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_400:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_401:
    ;; -- push int 10 --
    mov rax, 10
    push rax
addr_402:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_403:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_404:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_405:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_406:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_407:
    ;; -- end --
    jmp addr_382
addr_408:
    ;; -- drop --
    pop rax
addr_409:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 16
    ret
addr_410:
    ;; -- func --
    jmp addr_435
addr_411:
    ;; -- stack prep --
    sub rsp, 9
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_412:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_413:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_414:
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
addr_415:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_416:
    ;; -- while --
addr_417:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_418:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_419:
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
addr_420:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_433
addr_421:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_422:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_423:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_424:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_425:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_426:
    ;; -- cast(ptr) --
addr_427:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_428:
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
addr_429:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_430:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_431:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_432:
    ;; -- end --
    jmp addr_416
addr_433:
    ;; -- drop --
    pop rax
addr_434:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 9
    ret
addr_435:
    ;; -- func --
    jmp addr_467
addr_436:
    ;; -- stack prep --
    sub rsp, 24
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_437:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_438:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_439:
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
addr_440:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_441:
    mov rax, [ret_stack_rsp]
    add rax, 16
    push rax
addr_442:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_443:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_444:
    ;; -- while --
addr_445:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_446:
    mov rax, [ret_stack_rsp]
    add rax, 16
    push rax
addr_447:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_448:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_449:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_465
addr_450:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_451:
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
addr_452:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_453:
    ;; -- cast(ptr) --
addr_454:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_455:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_456:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_457:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_458:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_459:
    ;; -- cast(ptr) --
addr_460:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_461:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_462:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_463:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_464:
    ;; -- end --
    jmp addr_444
addr_465:
    ;; -- drop --
    pop rax
addr_466:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 24
    ret
addr_467:
    ;; -- func --
    jmp addr_488
addr_468:
    ;; -- stack prep --
    sub rsp, 12
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_469:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_470:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_471:
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
addr_472:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], ebx
addr_473:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_474:
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
addr_475:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov ebx, [rax]
    push rbx
addr_476:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_477:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_478:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_479:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_480:
    ;; -- push int 44 --
    mov rax, 44
    push rax
addr_481:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_482:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_483:
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
addr_484:
    ;; -- push int 9 --
    mov rax, 9
    push rax
addr_485:
    ;; -- syscall6 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    pop r10
    pop r8
    pop r9
    syscall
    push rax
addr_486:
    ;; -- cast(ptr) --
addr_487:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 12
    ret
addr_488:
    ;; -- func --
    jmp addr_512
addr_489:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_490:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_1
addr_491:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_492:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_493:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_494:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_495:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_496:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_497:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_498:
    ;; -- cast(ptr) --
addr_499:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_500:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_1
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_501:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_502:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_503:
    ;; -- push str --
    mov rax, 23
    push rax
    push str_2
addr_504:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_505:
    ;; -- push str --
    mov rax, 10
    push rax
    push str_3
addr_506:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_507:
    ;; -- push str --
    mov rax, 40
    push rax
    push str_4
addr_508:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_509:
    ;; -- push str --
    mov rax, 37
    push rax
    push str_5
addr_510:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_511:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_512:
    ;; -- func --
    jmp addr_746
addr_513:
    ;; -- stack prep --
    sub rsp, 638
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_514:
    ;; -- push bool 0 --
    mov rax, 0
    push rax
addr_515:
    ;; -- cast(int) --
addr_516:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_517:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_518:
    ;; -- push int 256 --
    mov rax, 256
    push rax
addr_519:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_520:
    mov rax, [ret_stack_rsp]
    add rax, 1
    push rax
addr_521:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_411
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_522:
    ;; -- push int 256 --
    mov rax, 256
    push rax
addr_523:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_524:
    mov rax, [ret_stack_rsp]
    add rax, 258
    push rax
addr_525:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_411
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_526:
    ;; -- push bool 0 --
    mov rax, 0
    push rax
addr_527:
    ;; -- cast(int) --
addr_528:
    mov rax, [ret_stack_rsp]
    add rax, 257
    push rax
addr_529:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_530:
    mov rax, [ret_stack_rsp]
    add rax, 514
    push rax
addr_531:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_532:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_533:
    ;; -- if --
addr_534:
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
addr_535:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_536:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_537:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_546
addr_538:
    ;; -- push str --
    mov rax, 32
    push rax
    push str_6
addr_539:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_489
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_540:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_541:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_542:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_543:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_544:
    ;; -- drop --
    pop rax
addr_545:
    ;; -- end --
addr_546:
    ;; -- if --
addr_547:
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
addr_548:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_549:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovg rcx, rdx
    push rcx
addr_550:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_645
addr_551:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_552:
    ;; -- while --
addr_553:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_554:
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
addr_555:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_556:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_557:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_558:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_643
addr_559:
    ;; -- if --
addr_560:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_561:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_562:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_563:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_564:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_565:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_566:
    ;; -- cast(ptr) --
addr_567:
    ;; -- push str --
    push str_7
addr_568:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_25
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_569:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_575
addr_570:
    ;; -- push bool 1 --
    mov rax, 1
    push rax
addr_571:
    ;; -- cast(int) --
addr_572:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_573:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_574:
    ;; -- elif --
    jmp addr_631
addr_575:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_576:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_577:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_578:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_579:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_580:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_581:
    ;; -- cast(ptr) --
addr_582:
    ;; -- push str --
    push str_8
addr_583:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_25
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_584:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_632
addr_585:
    ;; -- if --
addr_586:
    mov rax, [ret_stack_rsp]
    add rax, 257
    push rax
addr_587:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_588:
    ;; -- cast(bool) --
addr_589:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_598
addr_590:
    ;; -- push str --
    mov rax, 50
    push rax
    push str_9
addr_591:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_489
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_592:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_593:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_594:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_595:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_596:
    ;; -- drop --
    pop rax
addr_597:
    ;; -- end --
addr_598:
    ;; -- if --
addr_599:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_600:
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
addr_601:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_602:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_603:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovg rcx, rdx
    push rcx
addr_604:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_613
addr_605:
    ;; -- push str --
    mov rax, 53
    push rax
    push str_10
addr_606:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_489
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_607:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_608:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_609:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_610:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_611:
    ;; -- drop --
    pop rax
addr_612:
    ;; -- end --
addr_613:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_614:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_615:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_616:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_617:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_618:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_619:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_620:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_621:
    ;; -- cast(ptr) --
addr_622:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_623:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_1
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_624:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_625:
    mov rax, [ret_stack_rsp]
    add rax, 1
    push rax
addr_626:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_436
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_627:
    ;; -- push bool 1 --
    mov rax, 1
    push rax
addr_628:
    ;; -- cast(int) --
addr_629:
    mov rax, [ret_stack_rsp]
    add rax, 257
    push rax
addr_630:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_631:
    ;; -- else --
    jmp addr_639
addr_632:
    ;; -- push str --
    mov rax, 53
    push rax
    push str_11
addr_633:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_489
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_634:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_635:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_636:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_637:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_638:
    ;; -- drop --
    pop rax
addr_639:
    ;; -- end --
addr_640:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_641:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_642:
    ;; -- end --
    jmp addr_552
addr_643:
    ;; -- drop --
    pop rax
addr_644:
    ;; -- end --
addr_645:
    ;; -- push int 4 --
    mov rax, 4
    push rax
addr_646:
    ;; -- print --
    pop rdi
    call print
addr_647:
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
addr_648:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_649:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_650:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_651:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_652:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_653:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_654:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_655:
    ;; -- cast(ptr) --
addr_656:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_657:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_1
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_658:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_659:
    mov rax, [ret_stack_rsp]
    add rax, 258
    push rax
addr_660:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_436
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_661:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_662:
    mov rax, [ret_stack_rsp]
    add rax, 258
    push rax
addr_663:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_664:
    ;; -- syscall2 --
    pop rax
    pop rdi
    pop rsi
    syscall
    push rax
addr_665:
    ;; -- if --
addr_666:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_667:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_668:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_669:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_682
addr_670:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_12
addr_671:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_672:
    ;; -- push int 256 --
    mov rax, 256
    push rax
addr_673:
    mov rax, [ret_stack_rsp]
    add rax, 258
    push rax
addr_674:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_675:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_13
addr_676:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_677:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_678:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_679:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_680:
    ;; -- drop --
    pop rax
addr_681:
    ;; -- end --
addr_682:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_683:
    mov rax, [ret_stack_rsp]
    add rax, 522
    push rax
addr_684:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_685:
    ;; -- push int 5 --
    mov rax, 5
    push rax
addr_686:
    ;; -- syscall2 --
    pop rax
    pop rdi
    pop rsi
    syscall
    push rax
addr_687:
    ;; -- if --
addr_688:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_689:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_690:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_691:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_704
addr_692:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_14
addr_693:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_694:
    ;; -- push int 256 --
    mov rax, 256
    push rax
addr_695:
    mov rax, [ret_stack_rsp]
    add rax, 258
    push rax
addr_696:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_697:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_15
addr_698:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_699:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_700:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_701:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_702:
    ;; -- drop --
    pop rax
addr_703:
    ;; -- end --
addr_704:
    mov rax, [ret_stack_rsp]
    add rax, 514
    push rax
addr_705:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_706:
    ;; -- print --
    pop rdi
    call print
addr_707:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_708:
    mov rax, [ret_stack_rsp]
    add rax, 522
    push rax
addr_709:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_468
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_710:
    mov rax, [ret_stack_rsp]
    add rax, 514
    push rax
addr_711:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_712:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_713:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_714:
    ;; -- if --
addr_715:
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
addr_716:
    mov rax, [ret_stack_rsp]
    add rax, 514
    push rax
addr_717:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_718:
    ;; -- cast(ptr) --
addr_719:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_720:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_733
addr_721:
    ;; -- push str --
    mov rax, 30
    push rax
    push str_16
addr_722:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_723:
    ;; -- push int 256 --
    mov rax, 256
    push rax
addr_724:
    mov rax, [ret_stack_rsp]
    add rax, 258
    push rax
addr_725:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_726:
    ;; -- push str --
    mov rax, 12
    push rax
    push str_17
addr_727:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_728:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_729:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_730:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_731:
    ;; -- drop --
    pop rax
addr_732:
    ;; -- end --
addr_733:
    mov rax, [ret_stack_rsp]
    add rax, 522
    push rax
addr_734:
    ;; -- push int 44 --
    mov rax, 44
    push rax
addr_735:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_736:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_737:
    mov rax, [ret_stack_rsp]
    add rax, 514
    push rax
addr_738:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_739:
    ;; -- push int 11 --
    mov rax, 11
    push rax
addr_740:
    ;; -- syscall2 --
    pop rax
    pop rdi
    pop rsi
    syscall
    push rax
addr_741:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_742:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_743:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_744:
    ;; -- drop --
    pop rax
addr_745:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 638
    ret
addr_746:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_513
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_747:
    mov rax, 60
    mov rdi, 0
    syscall
segment .data
str_0: db 0x30
str_1: db 0x55,0x53,0x41,0x47,0x45,0x20,0x3a,0x20
str_2: db 0x20,0x5b,0x4f,0x50,0x54,0x49,0x4f,0x4e,0x53,0x5d,0x20,0x3c,0x66,0x69,0x6c,0x65,0x2e,0x74,0x68,0x72,0x74,0x3e,0xa
str_3: db 0x4f,0x50,0x54,0x49,0x4f,0x4e,0x53,0x20,0x3a,0xa
str_4: db 0x9,0x2d,0x72,0x20,0x3a,0x20,0x72,0x75,0x6e,0x20,0x74,0x68,0x65,0x20,0x70,0x72,0x6f,0x67,0x72,0x61,0x6d,0x20,0x61,0x66,0x74,0x65,0x72,0x20,0x63,0x6f,0x6d,0x70,0x69,0x6c,0x61,0x74,0x69,0x6f,0x6e,0xa
str_5: db 0x9,0x2d,0x6f,0x20,0x3c,0x6e,0x61,0x6d,0x65,0x3e,0x20,0x3a,0x20,0x73,0x65,0x74,0x20,0x74,0x68,0x65,0x20,0x65,0x78,0x65,0x63,0x75,0x74,0x61,0x62,0x6c,0x65,0x20,0x6e,0x61,0x6d,0x65,0xa
str_6: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20,0x3d,0x3e,0x20,0x4e,0x6f,0x74,0x20,0x65,0x6e,0x6f,0x75,0x67,0x68,0x20,0x61,0x72,0x67,0x75,0x6d,0x65,0x6e,0x74,0x73,0xa
str_7: db 0x2d,0x72,0x0
str_8: db 0x2d,0x6f,0x0
str_9: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20,0x3d,0x3e,0x20,0x59,0x6f,0x75,0x20,0x63,0x61,0x6e,0x27,0x74,0x20,0x72,0x65,0x6e,0x61,0x6d,0x65,0x20,0x6d,0x75,0x6c,0x74,0x69,0x70,0x6c,0x65,0x20,0x74,0x69,0x6d,0x65,0x73,0x20,0x6f,0x75,0x74,0x70,0x75,0x74,0xa
str_10: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20,0x3d,0x3e,0x20,0x50,0x6c,0x65,0x61,0x73,0x65,0x20,0x70,0x72,0x6f,0x76,0x69,0x64,0x65,0x20,0x6f,0x75,0x74,0x70,0x75,0x74,0x20,0x6e,0x61,0x6d,0x65,0x20,0x66,0x6f,0x72,0x20,0x2d,0x6f,0x20,0x6f,0x70,0x74,0x69,0x6f,0x6e,0x73,0xa
str_11: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20,0x3d,0x3e,0x20,0x50,0x6c,0x65,0x61,0x73,0x65,0x20,0x70,0x72,0x6f,0x76,0x69,0x64,0x65,0x20,0x6f,0x75,0x74,0x70,0x75,0x74,0x20,0x6e,0x61,0x6d,0x65,0x20,0x66,0x6f,0x72,0x20,0x2d,0x6f,0x20,0x6f,0x70,0x74,0x69,0x6f,0x6e,0x73,0xa
str_12: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20,0x3d,0x3e,0x20,0x55,0x6e,0x61,0x62,0x6c,0x65,0x20,0x74,0x6f,0x20,0x6f,0x70,0x65,0x6e,0x20,0x66,0x69,0x6c,0x65,0x20
str_13: db 0xa
str_14: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20,0x3d,0x3e,0x20,0x55,0x6e,0x61,0x62,0x6c,0x65,0x20,0x74,0x6f,0x20,0x73,0x74,0x61,0x74,0x20,0x66,0x69,0x6c,0x65,0x20
str_15: db 0xa
str_16: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20,0x3d,0x3e,0x20,0x55,0x6e,0x61,0x62,0x6c,0x65,0x20,0x74,0x6f,0x20,0x6d,0x61,0x70,0x20,0x66,0x69,0x6c,0x65,0x20
str_17: db 0x20,0x74,0x6f,0x20,0x6d,0x65,0x6d,0x6f,0x72,0x79,0x20,0xa
segment .bss
args_ptr: resq 1
ret_stack_rsp: resq 1
ret_stack: resq 4096
ret_stack_end:
mem: resb 32
