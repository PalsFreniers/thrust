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
    jmp addr_32
addr_1:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_2:
    ;; -- push mem --
    mov rax, mem
    add rax, 16
    push rax
addr_3:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_4:
    ;; -- push mem --
    mov rax, mem
    add rax, 8
    push rax
addr_5:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_6:
    ;; -- push mem --
    mov rax, mem
    add rax, 0
    push rax
addr_7:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_8:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_9:
    ;; -- while --
addr_10:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_11:
    ;; -- push mem --
    mov rax, mem
    add rax, 0
    push rax
addr_12:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_13:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_14:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_30
addr_15:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_16:
    ;; -- push mem --
    mov rax, mem
    add rax, 8
    push rax
addr_17:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_18:
    ;; -- cast(ptr) --
addr_19:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_20:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_21:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_22:
    ;; -- push mem --
    mov rax, mem
    add rax, 16
    push rax
addr_23:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_24:
    ;; -- cast(ptr) --
addr_25:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_26:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_27:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_28:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_29:
    ;; -- end --
    jmp addr_9
addr_30:
    ;; -- drop --
    pop rax
addr_31:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_32:
    ;; -- func --
    jmp addr_51
addr_33:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_34:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_35:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_36:
    ;; -- while --
addr_37:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_38:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_39:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_40:
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
addr_41:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_49
addr_42:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_43:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_44:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_45:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_46:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_47:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_48:
    ;; -- end --
    jmp addr_36
addr_49:
    ;; -- drop --
    pop rax
addr_50:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_51:
    ;; -- func --
    jmp addr_92
addr_52:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_53:
    ;; -- while --
addr_54:
    ;; -- if --
addr_55:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_56:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_57:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_58:
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
addr_59:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_60:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_61:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_62:
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
addr_63:
    ;; -- band --
    pop rax
    pop rbx
    and rbx, rax
    push rbx
addr_64:
    ;; -- cast(bool) --
addr_65:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_72
addr_66:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_67:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_68:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_69:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_70:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_71:
    ;; -- else --
    jmp addr_74
addr_72:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_73:
    ;; -- cast(bool) --
addr_74:
    ;; -- end --
addr_75:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_82
addr_76:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_77:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_78:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_79:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_80:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_81:
    ;; -- end --
    jmp addr_53
addr_82:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_83:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_84:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_85:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_86:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_87:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_88:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_89:
    ;; -- band --
    pop rax
    pop rbx
    and rbx, rax
    push rbx
addr_90:
    ;; -- cast(bool) --
addr_91:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_92:
    ;; -- func --
    jmp addr_199
addr_93:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_94:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_95:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_96:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_97:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_98:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_99:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_100:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_101:
    ;; -- cast(ptr) --
addr_102:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_103:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_104:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_105:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_106:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_107:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_108:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
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
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_112:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_113:
    ;; -- while --
addr_114:
    ;; -- if --
addr_115:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_116:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_117:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_118:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_119:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_120:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_121:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    cmp rax, rcx
    cmove rcx, rdx
    push rcx
addr_122:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_132
addr_123:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_124:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_125:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_126:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_127:
    ;; -- cast(ptr) --
addr_128:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_129:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_130:
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
addr_131:
    ;; -- else --
    jmp addr_134
addr_132:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_133:
    ;; -- cast(bool) --
addr_134:
    ;; -- end --
addr_135:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_167
addr_136:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_137:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_138:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_139:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_140:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_141:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_142:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_143:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_144:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_145:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_146:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_147:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_148:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_149:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_150:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_151:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_152:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_153:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_154:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_155:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_156:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_157:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_158:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_159:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_160:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_161:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_162:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_163:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_164:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_165:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_166:
    ;; -- end --
    jmp addr_113
addr_167:
    ;; -- drop --
    pop rax
addr_168:
    ;; -- if --
addr_169:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_170:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_171:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_172:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_173:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_174:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_175:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    cmp rax, rcx
    cmove rcx, rdx
    push rcx
addr_176:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_196
addr_177:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_178:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_179:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_180:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_181:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_182:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_183:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_184:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_185:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_186:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_187:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_188:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_189:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_190:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_191:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_192:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_193:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_194:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_195:
    ;; -- end --
addr_196:
    ;; -- drop --
    pop rax
addr_197:
    ;; -- drop --
    pop rax
addr_198:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_199:
    ;; -- func --
    jmp addr_246
addr_200:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_201:
    ;; -- while --
addr_202:
    ;; -- if --
addr_203:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_204:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_205:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_206:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_207:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_208:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_209:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    cmp rax, rcx
    cmove rcx, rdx
    push rcx
addr_210:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_220
addr_211:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_212:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_213:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_214:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_215:
    ;; -- cast(ptr) --
addr_216:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_217:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_218:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_219:
    ;; -- else --
    jmp addr_222
addr_220:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_221:
    ;; -- cast(bool) --
addr_222:
    ;; -- end --
addr_223:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_243
addr_224:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_225:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_226:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_227:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_228:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_229:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_230:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_231:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_232:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_233:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_234:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_235:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_236:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_237:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_238:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_239:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_240:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_241:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_242:
    ;; -- end --
    jmp addr_201
addr_243:
    ;; -- drop --
    pop rax
addr_244:
    ;; -- drop --
    pop rax
addr_245:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_246:
    ;; -- func --
    jmp addr_330
addr_247:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_248:
    ;; -- push mem --
    mov rax, mem
    add rax, 24
    push rax
addr_249:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_250:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_251:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_252:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_253:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_254:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_255:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_256:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_257:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_258:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_259:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_260:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_261:
    ;; -- push mem --
    mov rax, mem
    add rax, 40
    push rax
addr_262:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_263:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_264:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_265:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_266:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_267:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_268:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_269:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_270:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_271:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_272:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_273:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_274:
    ;; -- if --
addr_275:
    ;; -- push mem --
    mov rax, mem
    add rax, 24
    push rax
addr_276:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_277:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_278:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_279:
    ;; -- push mem --
    mov rax, mem
    add rax, 40
    push rax
addr_280:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_281:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_282:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_283:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_284:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_326
addr_285:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_286:
    ;; -- while --
addr_287:
    ;; -- if --
addr_288:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_289:
    ;; -- push mem --
    mov rax, mem
    add rax, 24
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
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_294:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_313
addr_295:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_296:
    ;; -- push mem --
    mov rax, mem
    add rax, 24
    push rax
addr_297:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_298:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_299:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_300:
    ;; -- cast(ptr) --
addr_301:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_302:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_303:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_304:
    ;; -- push mem --
    mov rax, mem
    add rax, 40
    push rax
addr_305:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_306:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_307:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_308:
    ;; -- cast(ptr) --
addr_309:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_310:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_311:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_312:
    ;; -- else --
    jmp addr_315
addr_313:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_314:
    ;; -- cast(bool) --
addr_315:
    ;; -- end --
addr_316:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_320
addr_317:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_318:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_319:
    ;; -- end --
    jmp addr_286
addr_320:
    ;; -- push mem --
    mov rax, mem
    add rax, 24
    push rax
addr_321:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_322:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_323:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_324:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_325:
    ;; -- else --
    jmp addr_328
addr_326:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_327:
    ;; -- cast(bool) --
addr_328:
    ;; -- end --
addr_329:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_330:
    ;; -- func --
    jmp addr_383
addr_331:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_332:
    ;; -- if --
addr_333:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_334:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_335:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_336:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_343
addr_337:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_0
addr_338:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_339:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_340:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_341:
    ;; -- drop --
    pop rax
addr_342:
    ;; -- else --
    jmp addr_380
addr_343:
    ;; -- push mem --
    mov rax, mem
    add rax, 56
    push rax
addr_344:
    ;; -- push int 32 --
    mov rax, 32
    push rax
addr_345:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_346:
    ;; -- while --
addr_347:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_348:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_349:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovg rcx, rdx
    push rcx
addr_350:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_369
addr_351:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_352:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_353:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_354:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_355:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_356:
    ;; -- push int 10 --
    mov rax, 10
    push rax
addr_357:
;   -- division --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rax
addr_358:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_359:
    ;; -- push int 10 --
    mov rax, 10
    push rax
addr_360:
;   -- modulo --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rdx
addr_361:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_362:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_363:
    ;; -- push int 48 --
    mov rax, 48
    push rax
addr_364:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_365:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_366:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_367:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_368:
    ;; -- end --
    jmp addr_346
addr_369:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_370:
    ;; -- push mem --
    mov rax, mem
    add rax, 56
    push rax
addr_371:
    ;; -- push int 32 --
    mov rax, 32
    push rax
addr_372:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_373:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_374:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_375:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_376:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_377:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_378:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_379:
    ;; -- drop --
    pop rax
addr_380:
    ;; -- end --
addr_381:
    ;; -- drop --
    pop rax
addr_382:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_383:
    ;; -- func --
    jmp addr_428
addr_384:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_385:
    ;; -- push mem --
    mov rax, mem
    add rax, 88
    push rax
addr_386:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_387:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_388:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_389:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_390:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_391:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
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
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_395:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_396:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_397:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_398:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_399:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_400:
    ;; -- while --
addr_401:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_402:
    ;; -- push mem --
    mov rax, mem
    add rax, 88
    push rax
addr_403:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_404:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_405:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_406:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_407:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_426
addr_408:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_409:
    ;; -- push mem --
    mov rax, mem
    add rax, 88
    push rax
addr_410:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_411:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_412:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_413:
    ;; -- cast(ptr) --
addr_414:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_415:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_416:
    ;; -- push int 48 --
    mov rax, 48
    push rax
addr_417:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_418:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_419:
    ;; -- push int 10 --
    mov rax, 10
    push rax
addr_420:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_421:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_422:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_423:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_424:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_425:
    ;; -- end --
    jmp addr_400
addr_426:
    ;; -- drop --
    pop rax
addr_427:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_428:
    ;; -- func --
    jmp addr_441
addr_429:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_430:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_431:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_432:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_433:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_434:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_435:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_436:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_437:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_438:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_439:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_440:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_441:
    ;; -- func --
    jmp addr_452
addr_442:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_443:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_444:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_445:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_446:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_447:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_448:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_449:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_450:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_451:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_452:
    ;; -- func --
    jmp addr_471
addr_453:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_454:
    ;; -- push mem --
    mov rax, mem
    add rax, 8544
    push rax
addr_455:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_456:
    ;; -- push int 16 --
    mov rax, 16
    push rax
addr_457:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_458:
    ;; -- push mem --
    mov rax, mem
    add rax, 8552
    push rax
addr_459:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_460:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_461:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_462:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_429
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_463:
    ;; -- push mem --
    mov rax, mem
    add rax, 8544
    push rax
addr_464:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_465:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_466:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_467:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_468:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_469:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_470:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_471:
    ;; -- func --
    jmp addr_509
addr_472:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_473:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_474:
    ;; -- while --
addr_475:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_476:
    ;; -- push mem --
    mov rax, mem
    add rax, 8544
    push rax
addr_477:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_478:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_479:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_507
addr_480:
    ;; -- push str --
    mov rax, 21
    push rax
    push str_1
addr_481:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_482:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_483:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_484:
    ;; -- drop --
    pop rax
addr_485:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_486:
    ;; -- push int 16 --
    mov rax, 16
    push rax
addr_487:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_488:
    ;; -- push mem --
    mov rax, mem
    add rax, 8552
    push rax
addr_489:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_490:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_442
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_491:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_492:
    ;; -- push str --
    mov rax, 13
    push rax
    push str_2
addr_493:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_494:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_495:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_496:
    ;; -- drop --
    pop rax
addr_497:
    ;; -- print --
    pop rdi
    call print
addr_498:
    ;; -- push str --
    mov rax, 13
    push rax
    push str_3
addr_499:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_500:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_501:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_502:
    ;; -- drop --
    pop rax
addr_503:
    ;; -- print --
    pop rdi
    call print
addr_504:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_505:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_506:
    ;; -- end --
    jmp addr_474
addr_507:
    ;; -- drop --
    pop rax
addr_508:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_509:
    ;; -- func --
    jmp addr_553
addr_510:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_511:
    ;; -- if --
addr_512:
    ;; -- push mem --
    mov rax, mem
    add rax, 344
    push rax
addr_513:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_514:
    ;; -- push int 1024 --
    mov rax, 1024
    push rax
addr_515:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovge rcx, rdx
    push rcx
addr_516:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_538
addr_517:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_4
addr_518:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_519:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_520:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_521:
    ;; -- drop --
    pop rax
addr_522:
    ;; -- here --
    mov rax, 18
    push rax
    push str_5
addr_523:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_524:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_525:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_526:
    ;; -- drop --
    pop rax
addr_527:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_6
addr_528:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_529:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_530:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_531:
    ;; -- drop --
    pop rax
addr_532:
    ;; -- push str --
    mov rax, 52
    push rax
    push str_7
addr_533:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_534:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_535:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_536:
    ;; -- drop --
    pop rax
addr_537:
    ;; -- end --
addr_538:
    ;; -- push mem --
    mov rax, mem
    add rax, 352
    push rax
addr_539:
    ;; -- push mem --
    mov rax, mem
    add rax, 344
    push rax
addr_540:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_541:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_542:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_543:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_544:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_545:
    ;; -- push mem --
    mov rax, mem
    add rax, 344
    push rax
addr_546:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_547:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_548:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_549:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_550:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_551:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_552:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_553:
    ;; -- func --
    jmp addr_597
addr_554:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_555:
    ;; -- if --
addr_556:
    ;; -- push mem --
    mov rax, mem
    add rax, 344
    push rax
addr_557:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_558:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_559:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_560:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_582
addr_561:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_8
addr_562:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_563:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_564:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_565:
    ;; -- drop --
    pop rax
addr_566:
    ;; -- here --
    mov rax, 18
    push rax
    push str_9
addr_567:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_568:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_569:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_570:
    ;; -- drop --
    pop rax
addr_571:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_10
addr_572:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_573:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_574:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_575:
    ;; -- drop --
    pop rax
addr_576:
    ;; -- push str --
    mov rax, 55
    push rax
    push str_11
addr_577:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_578:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_579:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_580:
    ;; -- drop --
    pop rax
addr_581:
    ;; -- end --
addr_582:
    ;; -- push mem --
    mov rax, mem
    add rax, 344
    push rax
addr_583:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_584:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_585:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_586:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_587:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_588:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_589:
    ;; -- push mem --
    mov rax, mem
    add rax, 352
    push rax
addr_590:
    ;; -- push mem --
    mov rax, mem
    add rax, 344
    push rax
addr_591:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_592:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_593:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_594:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_595:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_596:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_597:
    ;; -- func --
    jmp addr_699
addr_598:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_599:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_600:
    ;; -- while --
addr_601:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_602:
    ;; -- push mem --
    mov rax, mem
    add rax, 8544
    push rax
addr_603:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_604:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_605:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_697
addr_606:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_607:
    ;; -- push int 16 --
    mov rax, 16
    push rax
addr_608:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_609:
    ;; -- push mem --
    mov rax, mem
    add rax, 8552
    push rax
addr_610:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_611:
    ;; -- if --
addr_612:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_613:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_614:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_615:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_616:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_617:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_618:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_625
addr_619:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_620:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_621:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_622:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_623:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_510
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_624:
    ;; -- elif --
    jmp addr_636
addr_625:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_626:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_627:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_628:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_629:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_630:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_631:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_637
addr_632:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_554
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_633:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_554
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_634:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_635:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_510
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_636:
    ;; -- elif --
    jmp addr_649
addr_637:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_638:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_639:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_640:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_641:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_642:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_643:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_650
addr_644:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_554
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_645:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_554
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_646:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_647:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_648:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_510
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_649:
    ;; -- elif --
    jmp addr_661
addr_650:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_651:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_652:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_653:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_654:
    ;; -- push int 4 --
    mov rax, 4
    push rax
addr_655:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_656:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_662
addr_657:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_554
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_658:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_554
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_659:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_660:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_510
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_661:
    ;; -- elif --
    jmp addr_671
addr_662:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_663:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_664:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_665:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_666:
    ;; -- push int 26 --
    mov rax, 26
    push rax
addr_667:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_668:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_672
addr_669:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_554
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_670:
    ;; -- print --
    pop rdi
    call print
addr_671:
    ;; -- else --
    jmp addr_692
addr_672:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_12
addr_673:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_674:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_675:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_676:
    ;; -- drop --
    pop rax
addr_677:
    ;; -- here --
    mov rax, 18
    push rax
    push str_13
addr_678:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_679:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_680:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_681:
    ;; -- drop --
    pop rax
addr_682:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_14
addr_683:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_684:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_685:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_686:
    ;; -- drop --
    pop rax
addr_687:
    ;; -- push str --
    mov rax, 28
    push rax
    push str_15
addr_688:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_689:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_690:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_691:
    ;; -- drop --
    pop rax
addr_692:
    ;; -- end --
addr_693:
    ;; -- drop --
    pop rax
addr_694:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_695:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_696:
    ;; -- end --
    jmp addr_600
addr_697:
    ;; -- drop --
    pop rax
addr_698:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_699:
    ;; -- func --
    jmp addr_1130
addr_700:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_701:
    ;; -- push str --
    mov rax, 11
    push rax
    push str_16
addr_702:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_703:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_704:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_705:
    ;; -- drop --
    pop rax
addr_706:
    ;; -- push str --
    mov rax, 15
    push rax
    push str_17
addr_707:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_708:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_709:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_710:
    ;; -- drop --
    pop rax
addr_711:
    ;; -- push str --
    mov rax, 26
    push rax
    push str_18
addr_712:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_713:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_714:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_715:
    ;; -- drop --
    pop rax
addr_716:
    ;; -- push str --
    mov rax, 7
    push rax
    push str_19
addr_717:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_718:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_719:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_720:
    ;; -- drop --
    pop rax
addr_721:
    ;; -- push str --
    mov rax, 17
    push rax
    push str_20
addr_722:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_723:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_724:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_725:
    ;; -- drop --
    pop rax
addr_726:
    ;; -- push str --
    mov rax, 16
    push rax
    push str_21
addr_727:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_728:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_729:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_730:
    ;; -- drop --
    pop rax
addr_731:
    ;; -- push str --
    mov rax, 17
    push rax
    push str_22
addr_732:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_733:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_734:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_735:
    ;; -- drop --
    pop rax
addr_736:
    ;; -- push str --
    mov rax, 27
    push rax
    push str_23
addr_737:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_738:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_739:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_740:
    ;; -- drop --
    pop rax
addr_741:
    ;; -- push str --
    mov rax, 18
    push rax
    push str_24
addr_742:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_743:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_744:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_745:
    ;; -- drop --
    pop rax
addr_746:
    ;; -- push str --
    mov rax, 23
    push rax
    push str_25
addr_747:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_748:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_749:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_750:
    ;; -- drop --
    pop rax
addr_751:
    ;; -- push str --
    mov rax, 6
    push rax
    push str_26
addr_752:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_753:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_754:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_755:
    ;; -- drop --
    pop rax
addr_756:
    ;; -- push str --
    mov rax, 18
    push rax
    push str_27
addr_757:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_758:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_759:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_760:
    ;; -- drop --
    pop rax
addr_761:
    ;; -- push str --
    mov rax, 18
    push rax
    push str_28
addr_762:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_763:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_764:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_765:
    ;; -- drop --
    pop rax
addr_766:
    ;; -- push str --
    mov rax, 17
    push rax
    push str_29
addr_767:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_768:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_769:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_770:
    ;; -- drop --
    pop rax
addr_771:
    ;; -- push str --
    mov rax, 12
    push rax
    push str_30
addr_772:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_773:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_774:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_775:
    ;; -- drop --
    pop rax
addr_776:
    ;; -- push str --
    mov rax, 17
    push rax
    push str_31
addr_777:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_778:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_779:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_780:
    ;; -- drop --
    pop rax
addr_781:
    ;; -- push str --
    mov rax, 13
    push rax
    push str_32
addr_782:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_783:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_784:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_785:
    ;; -- drop --
    pop rax
addr_786:
    ;; -- push str --
    mov rax, 17
    push rax
    push str_33
addr_787:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_788:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_789:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_790:
    ;; -- drop --
    pop rax
addr_791:
    ;; -- push str --
    mov rax, 23
    push rax
    push str_34
addr_792:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_793:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_794:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_795:
    ;; -- drop --
    pop rax
addr_796:
    ;; -- push str --
    mov rax, 18
    push rax
    push str_35
addr_797:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_798:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_799:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_800:
    ;; -- drop --
    pop rax
addr_801:
    ;; -- push str --
    mov rax, 18
    push rax
    push str_36
addr_802:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_803:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_804:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_805:
    ;; -- drop --
    pop rax
addr_806:
    ;; -- push str --
    mov rax, 16
    push rax
    push str_37
addr_807:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_808:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_809:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_810:
    ;; -- drop --
    pop rax
addr_811:
    ;; -- push str --
    mov rax, 13
    push rax
    push str_38
addr_812:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_813:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_814:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_815:
    ;; -- drop --
    pop rax
addr_816:
    ;; -- push str --
    mov rax, 18
    push rax
    push str_39
addr_817:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_818:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_819:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_820:
    ;; -- drop --
    pop rax
addr_821:
    ;; -- push str --
    mov rax, 18
    push rax
    push str_40
addr_822:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_823:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_824:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_825:
    ;; -- drop --
    pop rax
addr_826:
    ;; -- push str --
    mov rax, 16
    push rax
    push str_41
addr_827:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_828:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_829:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_830:
    ;; -- drop --
    pop rax
addr_831:
    ;; -- push str --
    mov rax, 17
    push rax
    push str_42
addr_832:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_833:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_834:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_835:
    ;; -- drop --
    pop rax
addr_836:
    ;; -- push str --
    mov rax, 16
    push rax
    push str_43
addr_837:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_838:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_839:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_840:
    ;; -- drop --
    pop rax
addr_841:
    ;; -- push str --
    mov rax, 13
    push rax
    push str_44
addr_842:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_843:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_844:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_845:
    ;; -- drop --
    pop rax
addr_846:
    ;; -- push str --
    mov rax, 17
    push rax
    push str_45
addr_847:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_848:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_849:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_850:
    ;; -- drop --
    pop rax
addr_851:
    ;; -- push str --
    mov rax, 9
    push rax
    push str_46
addr_852:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_853:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_854:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_855:
    ;; -- drop --
    pop rax
addr_856:
    ;; -- push str --
    mov rax, 2
    push rax
    push str_47
addr_857:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_858:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_859:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_860:
    ;; -- drop --
    pop rax
addr_861:
    ;; -- push str --
    mov rax, 15
    push rax
    push str_48
addr_862:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_863:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_864:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_865:
    ;; -- drop --
    pop rax
addr_866:
    ;; -- push str --
    mov rax, 9
    push rax
    push str_49
addr_867:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_868:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_869:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_870:
    ;; -- drop --
    pop rax
addr_871:
    ;; -- push str --
    mov rax, 20
    push rax
    push str_50
addr_872:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_873:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_874:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_875:
    ;; -- drop --
    pop rax
addr_876:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_877:
    ;; -- while --
addr_878:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_879:
    ;; -- push mem --
    mov rax, mem
    add rax, 8544
    push rax
addr_880:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_881:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_882:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1079
addr_883:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_884:
    ;; -- push int 16 --
    mov rax, 16
    push rax
addr_885:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_886:
    ;; -- push mem --
    mov rax, mem
    add rax, 8552
    push rax
addr_887:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_888:
    ;; -- if --
addr_889:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_890:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_891:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_892:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_893:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_894:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_895:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_932
addr_896:
    ;; -- push str --
    mov rax, 12
    push rax
    push str_51
addr_897:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_898:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_899:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_900:
    ;; -- drop --
    pop rax
addr_901:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_902:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_903:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_904:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_905:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_331
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_906:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_52
addr_907:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_908:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_909:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_910:
    ;; -- drop --
    pop rax
addr_911:
    ;; -- push str --
    mov rax, 13
    push rax
    push str_53
addr_912:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_913:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_914:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_915:
    ;; -- drop --
    pop rax
addr_916:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_917:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_918:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_919:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_920:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_331
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_921:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_54
addr_922:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_923:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_924:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_925:
    ;; -- drop --
    pop rax
addr_926:
    ;; -- push str --
    mov rax, 13
    push rax
    push str_55
addr_927:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_928:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_929:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_930:
    ;; -- drop --
    pop rax
addr_931:
    ;; -- elif --
    jmp addr_964
addr_932:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_933:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_934:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_935:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_936:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_937:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_938:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_965
addr_939:
    ;; -- push str --
    mov rax, 15
    push rax
    push str_56
addr_940:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_941:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_942:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_943:
    ;; -- drop --
    pop rax
addr_944:
    ;; -- push str --
    mov rax, 12
    push rax
    push str_57
addr_945:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_946:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_947:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_948:
    ;; -- drop --
    pop rax
addr_949:
    ;; -- push str --
    mov rax, 12
    push rax
    push str_58
addr_950:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_951:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_952:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_953:
    ;; -- drop --
    pop rax
addr_954:
    ;; -- push str --
    mov rax, 17
    push rax
    push str_59
addr_955:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_956:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_957:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_958:
    ;; -- drop --
    pop rax
addr_959:
    ;; -- push str --
    mov rax, 13
    push rax
    push str_60
addr_960:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_961:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_962:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_963:
    ;; -- drop --
    pop rax
addr_964:
    ;; -- elif --
    jmp addr_997
addr_965:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_966:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_967:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_968:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_969:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_970:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_971:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_998
addr_972:
    ;; -- push str --
    mov rax, 16
    push rax
    push str_61
addr_973:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_974:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_975:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_976:
    ;; -- drop --
    pop rax
addr_977:
    ;; -- push str --
    mov rax, 12
    push rax
    push str_62
addr_978:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_979:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_980:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_981:
    ;; -- drop --
    pop rax
addr_982:
    ;; -- push str --
    mov rax, 12
    push rax
    push str_63
addr_983:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_984:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_985:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_986:
    ;; -- drop --
    pop rax
addr_987:
    ;; -- push str --
    mov rax, 17
    push rax
    push str_64
addr_988:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_989:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_990:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_991:
    ;; -- drop --
    pop rax
addr_992:
    ;; -- push str --
    mov rax, 13
    push rax
    push str_65
addr_993:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_994:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_995:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_996:
    ;; -- drop --
    pop rax
addr_997:
    ;; -- elif --
    jmp addr_1030
addr_998:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_999:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1000:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1001:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1002:
    ;; -- push int 4 --
    mov rax, 4
    push rax
addr_1003:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_1004:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1031
addr_1005:
    ;; -- push str --
    mov rax, 14
    push rax
    push str_66
addr_1006:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1007:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1008:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1009:
    ;; -- drop --
    pop rax
addr_1010:
    ;; -- push str --
    mov rax, 12
    push rax
    push str_67
addr_1011:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1012:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1013:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1014:
    ;; -- drop --
    pop rax
addr_1015:
    ;; -- push str --
    mov rax, 12
    push rax
    push str_68
addr_1016:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1017:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1018:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1019:
    ;; -- drop --
    pop rax
addr_1020:
    ;; -- push str --
    mov rax, 12
    push rax
    push str_69
addr_1021:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1022:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1023:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1024:
    ;; -- drop --
    pop rax
addr_1025:
    ;; -- push str --
    mov rax, 13
    push rax
    push str_70
addr_1026:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1027:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1028:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1029:
    ;; -- drop --
    pop rax
addr_1030:
    ;; -- elif --
    jmp addr_1053
addr_1031:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1032:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1033:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1034:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1035:
    ;; -- push int 26 --
    mov rax, 26
    push rax
addr_1036:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_1037:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1054
addr_1038:
    ;; -- push str --
    mov rax, 15
    push rax
    push str_71
addr_1039:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1040:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1041:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1042:
    ;; -- drop --
    pop rax
addr_1043:
    ;; -- push str --
    mov rax, 12
    push rax
    push str_72
addr_1044:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1045:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1046:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1047:
    ;; -- drop --
    pop rax
addr_1048:
    ;; -- push str --
    mov rax, 14
    push rax
    push str_73
addr_1049:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1050:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1051:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1052:
    ;; -- drop --
    pop rax
addr_1053:
    ;; -- else --
    jmp addr_1074
addr_1054:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_74
addr_1055:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1056:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1057:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1058:
    ;; -- drop --
    pop rax
addr_1059:
    ;; -- here --
    mov rax, 18
    push rax
    push str_75
addr_1060:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1061:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1062:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1063:
    ;; -- drop --
    pop rax
addr_1064:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_76
addr_1065:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1066:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1067:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1068:
    ;; -- drop --
    pop rax
addr_1069:
    ;; -- push str --
    mov rax, 28
    push rax
    push str_77
addr_1070:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1071:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1072:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1073:
    ;; -- drop --
    pop rax
addr_1074:
    ;; -- end --
addr_1075:
    ;; -- drop --
    pop rax
addr_1076:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1077:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1078:
    ;; -- end --
    jmp addr_877
addr_1079:
    ;; -- drop --
    pop rax
addr_1080:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_78
addr_1081:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1082:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1083:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1084:
    ;; -- drop --
    pop rax
addr_1085:
    ;; -- push str --
    mov rax, 15
    push rax
    push str_79
addr_1086:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1087:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1088:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1089:
    ;; -- drop --
    pop rax
addr_1090:
    ;; -- push str --
    mov rax, 16
    push rax
    push str_80
addr_1091:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1092:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1093:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1094:
    ;; -- drop --
    pop rax
addr_1095:
    ;; -- push str --
    mov rax, 12
    push rax
    push str_81
addr_1096:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1097:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1098:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1099:
    ;; -- drop --
    pop rax
addr_1100:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_82
addr_1101:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1102:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1103:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1104:
    ;; -- drop --
    pop rax
addr_1105:
    ;; -- push str --
    mov rax, 13
    push rax
    push str_83
addr_1106:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1107:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1108:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1109:
    ;; -- drop --
    pop rax
addr_1110:
    ;; -- push str --
    mov rax, 14
    push rax
    push str_84
addr_1111:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1112:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1113:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1114:
    ;; -- drop --
    pop rax
addr_1115:
    ;; -- push int 1024 --
    mov rax, 1024
    push rax
addr_1116:
    ;; -- push int 1024 --
    mov rax, 1024
    push rax
addr_1117:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_1118:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_331
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1119:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_85
addr_1120:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1121:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1122:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1123:
    ;; -- drop --
    pop rax
addr_1124:
    ;; -- push str --
    mov rax, 16
    push rax
    push str_86
addr_1125:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1126:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1127:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1128:
    ;; -- drop --
    pop rax
addr_1129:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_1130:
    ;; -- func --
    jmp addr_1223
addr_1131:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1132:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_87
addr_1133:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1134:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1135:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1136:
    ;; -- drop --
    pop rax
addr_1137:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_1138:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1139:
    ;; -- cast(ptr) --
addr_1140:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1141:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_33
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1142:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1143:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1144:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1145:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1146:
    ;; -- drop --
    pop rax
addr_1147:
    ;; -- push str --
    mov rax, 30
    push rax
    push str_88
addr_1148:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1149:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1150:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1151:
    ;; -- drop --
    pop rax
addr_1152:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_89
addr_1153:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1154:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1155:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1156:
    ;; -- drop --
    pop rax
addr_1157:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_90
addr_1158:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1159:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1160:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1161:
    ;; -- drop --
    pop rax
addr_1162:
    ;; -- push str --
    mov rax, 7
    push rax
    push str_91
addr_1163:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1164:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1165:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1166:
    ;; -- drop --
    pop rax
addr_1167:
    ;; -- push str --
    mov rax, 73
    push rax
    push str_92
addr_1168:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1169:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1170:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1171:
    ;; -- drop --
    pop rax
addr_1172:
    ;; -- push str --
    mov rax, 63
    push rax
    push str_93
addr_1173:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1174:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1175:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1176:
    ;; -- drop --
    pop rax
addr_1177:
    ;; -- push str --
    mov rax, 43
    push rax
    push str_94
addr_1178:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1179:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1180:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1181:
    ;; -- drop --
    pop rax
addr_1182:
    ;; -- push str --
    mov rax, 74
    push rax
    push str_95
addr_1183:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1184:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1185:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1186:
    ;; -- drop --
    pop rax
addr_1187:
    ;; -- push str --
    mov rax, 43
    push rax
    push str_96
addr_1188:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1189:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1190:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1191:
    ;; -- drop --
    pop rax
addr_1192:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_97
addr_1193:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1194:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1195:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1196:
    ;; -- drop --
    pop rax
addr_1197:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_98
addr_1198:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1199:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1200:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1201:
    ;; -- drop --
    pop rax
addr_1202:
    ;; -- push str --
    mov rax, 11
    push rax
    push str_99
addr_1203:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1204:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1205:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1206:
    ;; -- drop --
    pop rax
addr_1207:
    ;; -- push str --
    mov rax, 43
    push rax
    push str_100
addr_1208:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1209:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1210:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1211:
    ;; -- drop --
    pop rax
addr_1212:
    ;; -- push str --
    mov rax, 43
    push rax
    push str_101
addr_1213:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1214:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1215:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1216:
    ;; -- drop --
    pop rax
addr_1217:
    ;; -- push str --
    mov rax, 37
    push rax
    push str_102
addr_1218:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1219:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1220:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1221:
    ;; -- drop --
    pop rax
addr_1222:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_1223:
    ;; -- func --
    jmp addr_1567
addr_1224:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1225:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1226:
    ;; -- push mem --
    mov rax, mem
    add rax, 104
    push rax
addr_1227:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1228:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1229:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1230:
    ;; -- cast(ptr) --
addr_1231:
    ;; -- push int -100 --
    mov rax, -100
    push rax
addr_1232:
    ;; -- push int 257 --
    mov rax, 257
    push rax
addr_1233:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1234:
    ;; -- if --
addr_1235:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1236:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1237:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_1238:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1283
addr_1239:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_103
addr_1240:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1241:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1242:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1243:
    ;; -- drop --
    pop rax
addr_1244:
    ;; -- here --
    mov rax, 18
    push rax
    push str_104
addr_1245:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1246:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1247:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1248:
    ;; -- drop --
    pop rax
addr_1249:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_105
addr_1250:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1251:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1252:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1253:
    ;; -- drop --
    pop rax
addr_1254:
    ;; -- push str --
    mov rax, 5
    push rax
    push str_106
addr_1255:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1256:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1257:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1258:
    ;; -- drop --
    pop rax
addr_1259:
    ;; -- push mem --
    mov rax, mem
    add rax, 104
    push rax
addr_1260:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1261:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1262:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1263:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1264:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1265:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1266:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1267:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1268:
    ;; -- cast(ptr) --
addr_1269:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1270:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1271:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1272:
    ;; -- drop --
    pop rax
addr_1273:
    ;; -- push str --
    mov rax, 15
    push rax
    push str_107
addr_1274:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1275:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1276:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1277:
    ;; -- drop --
    pop rax
addr_1278:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1279:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_1280:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_1281:
    ;; -- drop --
    pop rax
addr_1282:
    ;; -- end --
addr_1283:
    ;; -- push mem --
    mov rax, mem
    add rax, 120
    push rax
addr_1284:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_1285:
    ;; -- if --
addr_1286:
    ;; -- push mem --
    mov rax, mem
    add rax, 128
    push rax
addr_1287:
    ;; -- push mem --
    mov rax, mem
    add rax, 120
    push rax
addr_1288:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1289:
    ;; -- push int 5 --
    mov rax, 5
    push rax
addr_1290:
    ;; -- syscall2 --
    pop rax
    pop rdi
    pop rsi
    syscall
    push rax
addr_1291:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1292:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_1293:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1338
addr_1294:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_108
addr_1295:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1296:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1297:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1298:
    ;; -- drop --
    pop rax
addr_1299:
    ;; -- here --
    mov rax, 18
    push rax
    push str_109
addr_1300:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1301:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1302:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1303:
    ;; -- drop --
    pop rax
addr_1304:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_110
addr_1305:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1306:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1307:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1308:
    ;; -- drop --
    pop rax
addr_1309:
    ;; -- push str --
    mov rax, 33
    push rax
    push str_111
addr_1310:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1311:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1312:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1313:
    ;; -- drop --
    pop rax
addr_1314:
    ;; -- push mem --
    mov rax, mem
    add rax, 104
    push rax
addr_1315:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1316:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1317:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1318:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1319:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1320:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1321:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1322:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1323:
    ;; -- cast(ptr) --
addr_1324:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1325:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1326:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1327:
    ;; -- drop --
    pop rax
addr_1328:
    ;; -- push mem --
    mov rax, mem
    add rax, 120
    push rax
addr_1329:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1330:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_1331:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_1332:
    ;; -- drop --
    pop rax
addr_1333:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1334:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_1335:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_1336:
    ;; -- drop --
    pop rax
addr_1337:
    ;; -- end --
addr_1338:
    ;; -- push mem --
    mov rax, mem
    add rax, 272
    push rax
addr_1339:
    ;; -- push mem --
    mov rax, mem
    add rax, 128
    push rax
addr_1340:
    ;; -- push int 48 --
    mov rax, 48
    push rax
addr_1341:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1342:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1343:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1344:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1345:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1346:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_1347:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1348:
    ;; -- push mem --
    mov rax, mem
    add rax, 120
    push rax
addr_1349:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1350:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1351:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1352:
    ;; -- push mem --
    mov rax, mem
    add rax, 272
    push rax
addr_1353:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1354:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1355:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1356:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1357:
    ;; -- cast(ptr) --
addr_1358:
    ;; -- push int 9 --
    mov rax, 9
    push rax
addr_1359:
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
addr_1360:
    ;; -- push mem --
    mov rax, mem
    add rax, 272
    push rax
addr_1361:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1362:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1363:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1364:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1365:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_1366:
    ;; -- if --
addr_1367:
    ;; -- push mem --
    mov rax, mem
    add rax, 272
    push rax
addr_1368:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1369:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1370:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_1371:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1421
addr_1372:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_112
addr_1373:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1374:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1375:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1376:
    ;; -- drop --
    pop rax
addr_1377:
    ;; -- here --
    mov rax, 18
    push rax
    push str_113
addr_1378:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1379:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1380:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1381:
    ;; -- drop --
    pop rax
addr_1382:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_114
addr_1383:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1384:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1385:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1386:
    ;; -- drop --
    pop rax
addr_1387:
    ;; -- push str --
    mov rax, 19
    push rax
    push str_115
addr_1388:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1389:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1390:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1391:
    ;; -- drop --
    pop rax
addr_1392:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1393:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1394:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_1395:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_1396:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1397:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1398:
    ;; -- cast(ptr) --
addr_1399:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1400:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_33
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1401:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1402:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1403:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1404:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1405:
    ;; -- drop --
    pop rax
addr_1406:
    ;; -- push str --
    mov rax, 10
    push rax
    push str_116
addr_1407:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1408:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1409:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1410:
    ;; -- drop --
    pop rax
addr_1411:
    ;; -- push mem --
    mov rax, mem
    add rax, 120
    push rax
addr_1412:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1413:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_1414:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_1415:
    ;; -- drop --
    pop rax
addr_1416:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1417:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_1418:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_1419:
    ;; -- drop --
    pop rax
addr_1420:
    ;; -- end --
addr_1421:
    ;; -- push mem --
    mov rax, mem
    add rax, 288
    push rax
addr_1422:
    ;; -- push mem --
    mov rax, mem
    add rax, 272
    push rax
addr_1423:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1424:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1425:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1426:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1427:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1428:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1429:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1430:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1431:
    ;; -- cast(ptr) --
addr_1432:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_1433:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1434:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_1435:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1436:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1437:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1438:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_1439:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1440:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1441:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_1442:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1443:
    ;; -- push mem --
    mov rax, mem
    add rax, 304
    push rax
addr_1444:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_1445:
    ;; -- while --
addr_1446:
    ;; -- push mem --
    mov rax, mem
    add rax, 288
    push rax
addr_1447:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1448:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1449:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1450:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1451:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_1452:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    cmp rax, rcx
    cmove rcx, rdx
    push rcx
addr_1453:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1566
addr_1454:
    ;; -- push mem --
    mov rax, mem
    add rax, 312
    push rax
addr_1455:
    ;; -- push mem --
    mov rax, mem
    add rax, 288
    push rax
addr_1456:
    ;; -- push int 10 --
    mov rax, 10
    push rax
addr_1457:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_93
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1458:
    ;; -- push mem --
    mov rax, mem
    add rax, 304
    push rax
addr_1459:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1460:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1461:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1462:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1463:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1464:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_1465:
    ;; -- while --
addr_1466:
    ;; -- push mem --
    mov rax, mem
    add rax, 312
    push rax
addr_1467:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1468:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1469:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1470:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1471:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_1472:
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    cmp rax, rcx
    cmove rcx, rdx
    push rcx
addr_1473:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1565
addr_1474:
    ;; -- push mem --
    mov rax, mem
    add rax, 312
    push rax
addr_1475:
    ;; -- push int 32 --
    mov rax, 32
    push rax
addr_1476:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_200
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1477:
    ;; -- push mem --
    mov rax, mem
    add rax, 328
    push rax
addr_1478:
    ;; -- push mem --
    mov rax, mem
    add rax, 312
    push rax
addr_1479:
    ;; -- push int 32 --
    mov rax, 32
    push rax
addr_1480:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_93
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1481:
    ;; -- if --
addr_1482:
    ;; -- push mem --
    mov rax, mem
    add rax, 328
    push rax
addr_1483:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1484:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1485:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1486:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1487:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1488:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1489:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1490:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1491:
    ;; -- cast(ptr) --
addr_1492:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_117
addr_1493:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_247
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1494:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1499
addr_1495:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1496:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1497:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_453
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1498:
    ;; -- elif --
    jmp addr_1515
addr_1499:
    ;; -- push mem --
    mov rax, mem
    add rax, 328
    push rax
addr_1500:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1501:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1502:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1503:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1504:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1505:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1506:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1507:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1508:
    ;; -- cast(ptr) --
addr_1509:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_118
addr_1510:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_247
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1511:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1516
addr_1512:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_1513:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1514:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_453
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1515:
    ;; -- elif --
    jmp addr_1532
addr_1516:
    ;; -- push mem --
    mov rax, mem
    add rax, 328
    push rax
addr_1517:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1518:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1519:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1520:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1521:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1522:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1523:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1524:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1525:
    ;; -- cast(ptr) --
addr_1526:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_119
addr_1527:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_247
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1528:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1533
addr_1529:
    ;; -- push int 4 --
    mov rax, 4
    push rax
addr_1530:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1531:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_453
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1532:
    ;; -- elif --
    jmp addr_1549
addr_1533:
    ;; -- push mem --
    mov rax, mem
    add rax, 328
    push rax
addr_1534:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1535:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1536:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1537:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1538:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1539:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1540:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1541:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1542:
    ;; -- cast(ptr) --
addr_1543:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_120
addr_1544:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_247
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1545:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1550
addr_1546:
    ;; -- push int 26 --
    mov rax, 26
    push rax
addr_1547:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1548:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_453
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1549:
    ;; -- else --
    jmp addr_1563
addr_1550:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1551:
    ;; -- push mem --
    mov rax, mem
    add rax, 328
    push rax
addr_1552:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1553:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1554:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1555:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1556:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1557:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1558:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1559:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1560:
    ;; -- cast(ptr) --
addr_1561:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_384
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1562:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_453
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1563:
    ;; -- end --
addr_1564:
    ;; -- end --
    jmp addr_1465
addr_1565:
    ;; -- end --
    jmp addr_1445
addr_1566:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_1567:
    ;; -- if --
addr_1568:
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
addr_1569:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1570:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_1571:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1598
addr_1572:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_1131
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1573:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_121
addr_1574:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1575:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1576:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1577:
    ;; -- drop --
    pop rax
addr_1578:
    ;; -- here --
    mov rax, 18
    push rax
    push str_122
addr_1579:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1580:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1581:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1582:
    ;; -- drop --
    pop rax
addr_1583:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_123
addr_1584:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1585:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1586:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1587:
    ;; -- drop --
    pop rax
addr_1588:
    ;; -- push str --
    mov rax, 23
    push rax
    push str_124
addr_1589:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1590:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1591:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1592:
    ;; -- drop --
    pop rax
addr_1593:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1594:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_1595:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_1596:
    ;; -- drop --
    pop rax
addr_1597:
    ;; -- end --
addr_1598:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1599:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1600:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_1601:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_1602:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1603:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1604:
    ;; -- cast(ptr) --
addr_1605:
    ;; -- if --
addr_1606:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1607:
    ;; -- push str --
    push str_125
addr_1608:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_52
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1609:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1683
addr_1610:
    ;; -- if --
addr_1611:
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
addr_1612:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_1613:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_1614:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1641
addr_1615:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_1131
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1616:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_126
addr_1617:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1618:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1619:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1620:
    ;; -- drop --
    pop rax
addr_1621:
    ;; -- here --
    mov rax, 18
    push rax
    push str_127
addr_1622:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1623:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1624:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1625:
    ;; -- drop --
    pop rax
addr_1626:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_128
addr_1627:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1628:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1629:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1630:
    ;; -- drop --
    pop rax
addr_1631:
    ;; -- push str --
    mov rax, 22
    push rax
    push str_129
addr_1632:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1633:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1634:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1635:
    ;; -- drop --
    pop rax
addr_1636:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1637:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_1638:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_1639:
    ;; -- drop --
    pop rax
addr_1640:
    ;; -- end --
addr_1641:
    ;; -- push mem --
    mov rax, mem
    add rax, 104
    push rax
addr_1642:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1643:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1644:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_1645:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_1646:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1647:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1648:
    ;; -- cast(ptr) --
addr_1649:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1650:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_33
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1651:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1652:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_1653:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1654:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_1655:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1656:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1657:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1658:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_1659:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1660:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1661:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_1662:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_1224
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1663:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_598
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1664:
    ;; -- push mem --
    mov rax, mem
    add rax, 272
    push rax
addr_1665:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1666:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1667:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1668:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1669:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1670:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1671:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1672:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1673:
    ;; -- cast(ptr) --
addr_1674:
    ;; -- push int 11 --
    mov rax, 11
    push rax
addr_1675:
    ;; -- syscall2 --
    pop rax
    pop rdi
    pop rsi
    syscall
    push rax
addr_1676:
    ;; -- drop --
    pop rax
addr_1677:
    ;; -- push mem --
    mov rax, mem
    add rax, 120
    push rax
addr_1678:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1679:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_1680:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_1681:
    ;; -- drop --
    pop rax
addr_1682:
    ;; -- elif --
    jmp addr_1759
addr_1683:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1684:
    ;; -- push str --
    push str_130
addr_1685:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_52
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1686:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1760
addr_1687:
    ;; -- if --
addr_1688:
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
addr_1689:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_1690:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_1691:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1718
addr_1692:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_1131
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1693:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_131
addr_1694:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1695:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1696:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1697:
    ;; -- drop --
    pop rax
addr_1698:
    ;; -- here --
    mov rax, 18
    push rax
    push str_132
addr_1699:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1700:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1701:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1702:
    ;; -- drop --
    pop rax
addr_1703:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_133
addr_1704:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1705:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1706:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1707:
    ;; -- drop --
    pop rax
addr_1708:
    ;; -- push str --
    mov rax, 22
    push rax
    push str_134
addr_1709:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1710:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1711:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1712:
    ;; -- drop --
    pop rax
addr_1713:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1714:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_1715:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_1716:
    ;; -- drop --
    pop rax
addr_1717:
    ;; -- end --
addr_1718:
    ;; -- push mem --
    mov rax, mem
    add rax, 104
    push rax
addr_1719:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1720:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1721:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_1722:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_1723:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1724:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1725:
    ;; -- cast(ptr) --
addr_1726:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1727:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_33
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1728:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1729:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_1730:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1731:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_1732:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1733:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1734:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1735:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_1736:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1737:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1738:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_1739:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_1224
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1740:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_700
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1741:
    ;; -- push mem --
    mov rax, mem
    add rax, 272
    push rax
addr_1742:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1743:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1744:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1745:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1746:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1747:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_1748:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_1749:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1750:
    ;; -- cast(ptr) --
addr_1751:
    ;; -- push int 11 --
    mov rax, 11
    push rax
addr_1752:
    ;; -- syscall2 --
    pop rax
    pop rdi
    pop rsi
    syscall
    push rax
addr_1753:
    ;; -- drop --
    pop rax
addr_1754:
    ;; -- push mem --
    mov rax, mem
    add rax, 120
    push rax
addr_1755:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_1756:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_1757:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_1758:
    ;; -- drop --
    pop rax
addr_1759:
    ;; -- elif --
    jmp addr_1765
addr_1760:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1761:
    ;; -- push str --
    push str_135
addr_1762:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_52
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1763:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_1766
addr_1764:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_1131
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1765:
    ;; -- else --
    jmp addr_1799
addr_1766:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_1131
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1767:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_136
addr_1768:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1769:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1770:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1771:
    ;; -- drop --
    pop rax
addr_1772:
    ;; -- here --
    mov rax, 18
    push rax
    push str_137
addr_1773:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1774:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1775:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1776:
    ;; -- drop --
    pop rax
addr_1777:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_138
addr_1778:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1779:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1780:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1781:
    ;; -- drop --
    pop rax
addr_1782:
    ;; -- push str --
    mov rax, 19
    push rax
    push str_139
addr_1783:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1784:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1785:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1786:
    ;; -- drop --
    pop rax
addr_1787:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1788:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_1789:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_33
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_1790:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_1791:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_1792:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1793:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_1794:
    ;; -- drop --
    pop rax
addr_1795:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_1796:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_1797:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_1798:
    ;; -- drop --
    pop rax
addr_1799:
    ;; -- end --
addr_1800:
    ;; -- drop --
    pop rax
addr_1801:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1802:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_1803:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_1804:
    ;; -- drop --
    pop rax
addr_1805:
    mov rax, 60
    mov rdi, 0
    syscall
segment .data
str_0: db 0x30
str_1: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
str_2: db 0x20,0x20,0x20,0x20,0x54,0x79,0x70,0x65,0x3a,0x20,0x20,0x20,0x20
str_3: db 0x20,0x20,0x20,0x20,0x6f,0x70,0x65,0x72,0x61,0x6e,0x64,0x3a,0x20
str_4: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str_5: db 0x2e,0x2f,0x6c,0x69,0x62,0x2f,0x6c,0x6f,0x67,0x2e,0x74,0x68,0x72,0x74,0x3a,0x39,0x3a,0x39
str_6: db 0x20,0x2d,0x3e,0x20
str_7: db 0x73,0x69,0x6d,0x75,0x6c,0x61,0x74,0x69,0x6f,0x6e,0x20,0x73,0x74,0x61,0x63,0x6b,0x20,0x6f,0x76,0x65,0x72,0x66,0x6c,0x6f,0x77,0x20,0x63,0x61,0x6e,0x6e,0x6f,0x74,0x20,0x70,0x75,0x73,0x68,0x20,0x74,0x6f,0x20,0x66,0x75,0x6c,0x6c,0x20,0x73,0x74,0x61,0x63,0x6b,0xa
str_8: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str_9: db 0x2e,0x2f,0x6c,0x69,0x62,0x2f,0x6c,0x6f,0x67,0x2e,0x74,0x68,0x72,0x74,0x3a,0x39,0x3a,0x39
str_10: db 0x20,0x2d,0x3e,0x20
str_11: db 0x73,0x69,0x6d,0x75,0x6c,0x61,0x74,0x69,0x6f,0x6e,0x20,0x73,0x74,0x61,0x63,0x6b,0x20,0x75,0x6e,0x64,0x65,0x72,0x66,0x6c,0x6f,0x77,0x20,0x63,0x61,0x6e,0x6e,0x6f,0x74,0x20,0x70,0x6f,0x70,0x20,0x66,0x72,0x6f,0x6d,0x20,0x65,0x6d,0x70,0x74,0x79,0x20,0x73,0x74,0x61,0x63,0x6b,0xa
str_12: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str_13: db 0x2e,0x2f,0x6c,0x69,0x62,0x2f,0x6c,0x6f,0x67,0x2e,0x74,0x68,0x72,0x74,0x3a,0x39,0x3a,0x39
str_14: db 0x20,0x2d,0x3e,0x20
str_15: db 0x75,0x6e,0x6b,0x6e,0x6f,0x77,0x6e,0x20,0x6f,0x70,0x72,0x61,0x74,0x69,0x6f,0x6e,0x20,0x75,0x6e,0x72,0x65,0x61,0x63,0x68,0x61,0x62,0x6c,0x65
str_16: db 0x5b,0x62,0x69,0x74,0x73,0x20,0x36,0x34,0x5d,0x20,0xa
str_17: db 0x73,0x65,0x63,0x74,0x69,0x6f,0x6e,0x20,0x2e,0x74,0x65,0x78,0x74,0x20,0xa
str_18: db 0x3b,0x20,0x20,0x20,0x20,0x2d,0x2d,0x20,0x64,0x75,0x6d,0x70,0x20,0x66,0x75,0x6e,0x63,0x74,0x69,0x6f,0x6e,0x20,0x2d,0x2d,0x20,0xa
str_19: db 0x64,0x75,0x6d,0x70,0x3a,0x20,0xa
str_20: db 0x20,0x20,0x20,0x20,0x73,0x75,0x62,0x20,0x72,0x73,0x70,0x2c,0x20,0x34,0x30,0x20,0xa
str_21: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x65,0x63,0x78,0x2c,0x20,0x31,0x20,0xa
str_22: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x72,0x38,0x64,0x2c,0x20,0x31,0x30,0x20,0xa
str_23: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x42,0x59,0x54,0x45,0x20,0x5b,0x72,0x73,0x70,0x2b,0x33,0x31,0x5d,0x2c,0x20,0x31,0x30,0x20,0xa
str_24: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x72,0x73,0x69,0x2c,0x20,0x72,0x73,0x70,0x20,0xa
str_25: db 0x20,0x20,0x20,0x20,0x6c,0x65,0x61,0x20,0x72,0x31,0x30,0x2c,0x20,0x5b,0x72,0x73,0x70,0x2b,0x33,0x31,0x5d,0x20,0xa
str_26: db 0x2e,0x4c,0x32,0x3a,0x20,0xa
str_27: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x72,0x61,0x78,0x2c,0x20,0x72,0x64,0x69,0x20,0xa
str_28: db 0x20,0x20,0x20,0x20,0x78,0x6f,0x72,0x20,0x65,0x64,0x78,0x2c,0x20,0x65,0x64,0x78,0x20,0xa
str_29: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x72,0x39,0x2c,0x20,0x72,0x31,0x30,0x20,0xa
str_30: db 0x20,0x20,0x20,0x20,0x64,0x69,0x76,0x20,0x72,0x38,0x20,0xa
str_31: db 0x20,0x20,0x20,0x20,0x73,0x75,0x62,0x20,0x72,0x39,0x2c,0x20,0x72,0x63,0x78,0x20,0xa
str_32: db 0x20,0x20,0x20,0x20,0x69,0x6e,0x63,0x20,0x72,0x63,0x78,0x20,0xa
str_33: db 0x20,0x20,0x20,0x20,0x61,0x64,0x64,0x20,0x65,0x64,0x78,0x2c,0x20,0x34,0x38,0x20,0xa
str_34: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x42,0x59,0x54,0x45,0x20,0x5b,0x72,0x39,0x5d,0x2c,0x20,0x64,0x6c,0x20,0xa
str_35: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x72,0x64,0x78,0x2c,0x20,0x72,0x64,0x69,0x20,0xa
str_36: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x72,0x64,0x69,0x2c,0x20,0x72,0x61,0x78,0x20,0xa
str_37: db 0x20,0x20,0x20,0x20,0x63,0x6d,0x70,0x20,0x72,0x64,0x78,0x2c,0x20,0x39,0x20,0xa
str_38: db 0x20,0x20,0x20,0x20,0x6a,0x61,0x20,0x20,0x2e,0x4c,0x32,0x20,0xa
str_39: db 0x20,0x20,0x20,0x20,0x73,0x75,0x62,0x20,0x72,0x73,0x69,0x2c,0x20,0x72,0x63,0x78,0x20,0xa
str_40: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x72,0x64,0x78,0x2c,0x20,0x72,0x63,0x78,0x20,0xa
str_41: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x65,0x64,0x69,0x2c,0x20,0x31,0x20,0xa
str_42: db 0x20,0x20,0x20,0x20,0x61,0x64,0x64,0x20,0x72,0x73,0x69,0x2c,0x20,0x33,0x32,0x20,0xa
str_43: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x72,0x61,0x78,0x2c,0x20,0x31,0x20,0xa
str_44: db 0x20,0x20,0x20,0x20,0x73,0x79,0x73,0x63,0x61,0x6c,0x6c,0x20,0xa
str_45: db 0x20,0x20,0x20,0x20,0x61,0x64,0x64,0x20,0x72,0x73,0x70,0x2c,0x20,0x34,0x30,0x20,0xa
str_46: db 0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x20,0xa
str_47: db 0x20,0xa
str_48: db 0x67,0x6c,0x6f,0x62,0x61,0x6c,0x20,0x5f,0x73,0x74,0x61,0x72,0x74,0x20,0xa
str_49: db 0x5f,0x73,0x74,0x61,0x72,0x74,0x3a,0x20,0xa
str_50: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x5b,0x61,0x72,0x67,0x76,0x5d,0x2c,0x20,0x72,0x73,0x70,0xa
str_51: db 0x3b,0x20,0x20,0x20,0x2d,0x2d,0x20,0x70,0x75,0x73,0x68,0x20
str_52: db 0x20,0x2d,0x2d,0xa
str_53: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x72,0x61,0x78,0x2c,0x20
str_54: db 0xa
str_55: db 0x20,0x20,0x20,0x20,0x70,0x75,0x73,0x68,0x20,0x72,0x61,0x78,0xa
str_56: db 0x3b,0x20,0x20,0x20,0x2d,0x2d,0x20,0x70,0x6c,0x75,0x73,0x20,0x2d,0x2d,0xa
str_57: db 0x20,0x20,0x20,0x20,0x70,0x6f,0x70,0x20,0x72,0x61,0x78,0xa
str_58: db 0x20,0x20,0x20,0x20,0x70,0x6f,0x70,0x20,0x72,0x62,0x78,0xa
str_59: db 0x20,0x20,0x20,0x20,0x61,0x64,0x64,0x20,0x72,0x61,0x78,0x2c,0x20,0x72,0x62,0x78,0xa
str_60: db 0x20,0x20,0x20,0x20,0x70,0x75,0x73,0x68,0x20,0x72,0x61,0x78,0xa
str_61: db 0x3b,0x20,0x20,0x20,0x2d,0x2d,0x20,0x6d,0x69,0x6e,0x75,0x73,0x20,0x2d,0x2d,0xa
str_62: db 0x20,0x20,0x20,0x20,0x70,0x6f,0x70,0x20,0x72,0x61,0x78,0xa
str_63: db 0x20,0x20,0x20,0x20,0x70,0x6f,0x70,0x20,0x72,0x62,0x78,0xa
str_64: db 0x20,0x20,0x20,0x20,0x73,0x75,0x62,0x20,0x72,0x62,0x78,0x2c,0x20,0x72,0x61,0x78,0xa
str_65: db 0x20,0x20,0x20,0x20,0x70,0x75,0x73,0x68,0x20,0x72,0x62,0x78,0xa
str_66: db 0x3b,0x20,0x20,0x20,0x2d,0x2d,0x20,0x6d,0x75,0x6c,0x20,0x2d,0x2d,0xa
str_67: db 0x20,0x20,0x20,0x20,0x70,0x6f,0x70,0x20,0x72,0x61,0x78,0xa
str_68: db 0x20,0x20,0x20,0x20,0x70,0x6f,0x70,0x20,0x72,0x62,0x78,0xa
str_69: db 0x20,0x20,0x20,0x20,0x6d,0x75,0x6c,0x20,0x72,0x62,0x78,0xa
str_70: db 0x20,0x20,0x20,0x20,0x70,0x75,0x73,0x68,0x20,0x72,0x61,0x78,0xa
str_71: db 0x3b,0x20,0x20,0x20,0x2d,0x2d,0x20,0x64,0x75,0x6d,0x70,0x20,0x2d,0x2d,0xa
str_72: db 0x20,0x20,0x20,0x20,0x70,0x6f,0x70,0x20,0x72,0x64,0x69,0xa
str_73: db 0x20,0x20,0x20,0x20,0x63,0x61,0x6c,0x6c,0x20,0x64,0x75,0x6d,0x70,0xa
str_74: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str_75: db 0x2e,0x2f,0x6c,0x69,0x62,0x2f,0x6c,0x6f,0x67,0x2e,0x74,0x68,0x72,0x74,0x3a,0x39,0x3a,0x39
str_76: db 0x20,0x2d,0x3e,0x20
str_77: db 0x75,0x6e,0x6b,0x6e,0x6f,0x77,0x6e,0x20,0x6f,0x70,0x72,0x61,0x74,0x69,0x6f,0x6e,0x20,0x75,0x6e,0x72,0x65,0x61,0x63,0x68,0x61,0x62,0x6c,0x65
str_78: db 0xa
str_79: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x72,0x64,0x69,0x2c,0x20,0x30,0xa
str_80: db 0x20,0x20,0x20,0x20,0x6d,0x6f,0x76,0x20,0x72,0x61,0x78,0x2c,0x20,0x36,0x30,0xa
str_81: db 0x20,0x20,0x20,0x20,0x73,0x79,0x73,0x63,0x61,0x6c,0x6c,0xa
str_82: db 0xa
str_83: db 0x73,0x65,0x63,0x74,0x69,0x6f,0x6e,0x20,0x2e,0x62,0x73,0x73,0xa
str_84: db 0x20,0x20,0x20,0x20,0x72,0x6d,0x65,0x6d,0x20,0x72,0x65,0x73,0x62,0x20
str_85: db 0xa
str_86: db 0x20,0x20,0x20,0x20,0x61,0x72,0x67,0x76,0x20,0x72,0x65,0x73,0x71,0x20,0x31,0xa
str_87: db 0x55,0x53,0x41,0x47,0x45,0x20,0x3a,0x20
str_88: db 0x20,0x5b,0x4f,0x50,0x54,0x49,0x4f,0x4e,0x5d,0x20,0x3c,0x53,0x55,0x42,0x43,0x4f,0x4d,0x4d,0x41,0x4e,0x44,0x3e,0x20,0x5b,0x41,0x52,0x47,0x53,0x5d,0xa
str_89: db 0xa
str_90: db 0xa
str_91: db 0x4f,0x50,0x54,0x49,0x4f,0x4e,0xa
str_92: db 0x20,0x20,0x20,0x20,0x2d,0x49,0x20,0x3c,0x64,0x69,0x72,0x65,0x63,0x74,0x6f,0x72,0x79,0x3e,0x20,0x78,0x20,0x61,0x64,0x64,0x20,0x6f,0x6e,0x65,0x20,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,0x20,0x64,0x69,0x72,0x65,0x63,0x74,0x6f,0x72,0x79,0x20,0x74,0x6f,0x20,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,0x20,0x64,0x69,0x72,0x65,0x63,0x74,0x6f,0x72,0x79,0x20,0x6c,0x69,0x73,0x74,0xa
str_93: db 0x20,0x20,0x20,0x20,0x2d,0x6c,0x20,0x3c,0x6c,0x69,0x6d,0x69,0x74,0x3e,0x20,0x20,0x20,0x20,0x20,0x78,0x20,0x73,0x65,0x74,0x20,0x6d,0x61,0x63,0x72,0x6f,0x20,0x64,0x65,0x70,0x74,0x68,0x20,0x6c,0x69,0x6d,0x69,0x74,0x20,0x74,0x6f,0x20,0x6e,0x20,0x28,0x64,0x65,0x66,0x61,0x75,0x6c,0x74,0x3d,0x31,0x30,0x30,0x30,0x29,0xa
str_94: db 0x20,0x20,0x20,0x20,0x2d,0x75,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x78,0x20,0x64,0x69,0x73,0x61,0x62,0x6c,0x65,0x20,0x74,0x79,0x70,0x65,0x20,0x63,0x68,0x65,0x63,0x6b,0x69,0x6e,0x67,0xa
str_95: db 0x20,0x20,0x20,0x20,0x2d,0x4c,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x78,0x20,0x61,0x6e,0x61,0x6c,0x79,0x73,0x65,0x20,0x79,0x6f,0x75,0x72,0x20,0x63,0x6f,0x64,0x65,0x20,0x77,0x69,0x74,0x68,0x6f,0x75,0x74,0x20,0x63,0x6f,0x6d,0x70,0x69,0x6c,0x69,0x6e,0x67,0x20,0x6f,0x72,0x20,0x73,0x69,0x6d,0x75,0x6c,0x61,0x74,0x69,0x6e,0x67,0x20,0x69,0x74,0xa
str_96: db 0x20,0x20,0x20,0x20,0x2d,0x64,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x78,0x20,0x61,0x64,0x64,0x20,0x64,0x65,0x62,0x75,0x67,0x20,0x69,0x6e,0x66,0x6f,0x72,0x6d,0x61,0x74,0x69,0x6f,0x6e,0xa
str_97: db 0xa
str_98: db 0xa
str_99: db 0x53,0x55,0x42,0x43,0x4f,0x4d,0x4d,0x41,0x4e,0x44,0xa
str_100: db 0x20,0x20,0x20,0x20,0x2d,0x63,0x20,0x5b,0x63,0x7c,0x72,0x7c,0x67,0x5d,0x20,0x3c,0x66,0x69,0x6c,0x65,0x3e,0x20,0x43,0x6f,0x6d,0x70,0x69,0x6c,0x65,0x20,0x20,0x74,0x68,0x65,0x20,0x70,0x72,0x6f,0x67,0x72,0x61,0x6d,0xa
str_101: db 0x20,0x20,0x20,0x20,0x2d,0x73,0x20,0x3c,0x66,0x69,0x6c,0x65,0x3e,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x53,0x69,0x6d,0x75,0x6c,0x61,0x74,0x65,0x20,0x74,0x68,0x65,0x20,0x70,0x72,0x6f,0x67,0x72,0x61,0x6d,0xa
str_102: db 0x20,0x20,0x20,0x20,0x2d,0x68,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x53,0x68,0x6f,0x77,0x20,0x74,0x68,0x69,0x73,0x20,0x68,0x65,0x6c,0x70,0xa
str_103: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str_104: db 0x2e,0x2f,0x6c,0x69,0x62,0x2f,0x6c,0x6f,0x67,0x2e,0x74,0x68,0x72,0x74,0x3a,0x39,0x3a,0x39
str_105: db 0x20,0x2d,0x3e,0x20
str_106: db 0x66,0x69,0x6c,0x65,0x20
str_107: db 0x20,0x64,0x6f,0x65,0x73,0x20,0x6e,0x6f,0x74,0x20,0x65,0x78,0x69,0x73,0x74
str_108: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str_109: db 0x2e,0x2f,0x6c,0x69,0x62,0x2f,0x6c,0x6f,0x67,0x2e,0x74,0x68,0x72,0x74,0x3a,0x39,0x3a,0x39
str_110: db 0x20,0x2d,0x3e,0x20
str_111: db 0x75,0x6e,0x61,0x62,0x6c,0x65,0x20,0x74,0x6f,0x20,0x64,0x65,0x74,0x65,0x72,0x6d,0x69,0x6e,0x65,0x20,0x73,0x69,0x7a,0x65,0x20,0x6f,0x66,0x20,0x66,0x69,0x6c,0x65,0x20
str_112: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str_113: db 0x2e,0x2f,0x6c,0x69,0x62,0x2f,0x6c,0x6f,0x67,0x2e,0x74,0x68,0x72,0x74,0x3a,0x39,0x3a,0x39
str_114: db 0x20,0x2d,0x3e,0x20
str_115: db 0x75,0x6e,0x61,0x62,0x6c,0x65,0x20,0x74,0x6f,0x20,0x6d,0x61,0x70,0x20,0x66,0x69,0x6c,0x65,0x20
str_116: db 0x20,0x74,0x6f,0x20,0x6d,0x65,0x6d,0x6f,0x72,0x79
str_117: db 0x2b
str_118: db 0x2d
str_119: db 0x2a
str_120: db 0x64,0x75,0x6d,0x70
str_121: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str_122: db 0x2e,0x2f,0x6c,0x69,0x62,0x2f,0x6c,0x6f,0x67,0x2e,0x74,0x68,0x72,0x74,0x3a,0x39,0x3a,0x39
str_123: db 0x20,0x2d,0x3e,0x20
str_124: db 0x6e,0x6f,0x20,0x73,0x75,0x62,0x63,0x6f,0x6d,0x6d,0x61,0x6e,0x64,0x20,0x70,0x72,0x6f,0x76,0x69,0x64,0x65,0x64,0xa
str_125: db 0x2d,0x73,0x0
str_126: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str_127: db 0x2e,0x2f,0x6c,0x69,0x62,0x2f,0x6c,0x6f,0x67,0x2e,0x74,0x68,0x72,0x74,0x3a,0x39,0x3a,0x39
str_128: db 0x20,0x2d,0x3e,0x20
str_129: db 0x4e,0x6f,0x20,0x69,0x6e,0x70,0x75,0x74,0x20,0x66,0x69,0x6c,0x65,0x20,0x70,0x72,0x6f,0x76,0x69,0x64,0x65,0x64
str_130: db 0x2d,0x63,0x0
str_131: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str_132: db 0x2e,0x2f,0x6c,0x69,0x62,0x2f,0x6c,0x6f,0x67,0x2e,0x74,0x68,0x72,0x74,0x3a,0x39,0x3a,0x39
str_133: db 0x20,0x2d,0x3e,0x20
str_134: db 0x4e,0x6f,0x20,0x69,0x6e,0x70,0x75,0x74,0x20,0x66,0x69,0x6c,0x65,0x20,0x70,0x72,0x6f,0x76,0x69,0x64,0x65,0x64
str_135: db 0x2d,0x68,0x0
str_136: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str_137: db 0x2e,0x2f,0x6c,0x69,0x62,0x2f,0x6c,0x6f,0x67,0x2e,0x74,0x68,0x72,0x74,0x3a,0x39,0x3a,0x39
str_138: db 0x20,0x2d,0x3e,0x20
str_139: db 0x75,0x6e,0x6b,0x6e,0x6f,0x77,0x6e,0x20,0x73,0x75,0x62,0x63,0x6f,0x6d,0x6d,0x61,0x6e,0x64,0x20
segment .bss
args_ptr: resq 1
ret_stack_rsp: resq 1
ret_stack: resq 4096
ret_stack_end:
mem: resb 24936
