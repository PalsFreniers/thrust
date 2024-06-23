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
    ;; -- equal --
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
    ;; -- equal --
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
    ;; -- equal --
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
    jmp addr_437
addr_411:
    ;; -- stack prep --
    sub rsp, 9
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_412:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_413:
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
addr_414:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_415:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_416:
    mov rax, [ret_stack_rsp]
    add rax, 1
    push rax
addr_417:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_418:
    ;; -- while --
addr_419:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_420:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_421:
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
addr_422:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_435
addr_423:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_424:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_425:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_426:
    mov rax, [ret_stack_rsp]
    add rax, 1
    push rax
addr_427:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_428:
    ;; -- cast(ptr) --
addr_429:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_430:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_431:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_432:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_433:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_434:
    ;; -- end --
    jmp addr_418
addr_435:
    ;; -- drop --
    pop rax
addr_436:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 9
    ret
addr_437:
    ;; -- func --
    jmp addr_469
addr_438:
    ;; -- stack prep --
    sub rsp, 24
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_439:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_440:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_441:
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
addr_442:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_443:
    mov rax, [ret_stack_rsp]
    add rax, 16
    push rax
addr_444:
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
addr_445:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_446:
    ;; -- while --
addr_447:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_448:
    mov rax, [ret_stack_rsp]
    add rax, 16
    push rax
addr_449:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_450:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_451:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_467
addr_452:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_453:
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
addr_454:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_455:
    ;; -- cast(ptr) --
addr_456:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_457:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_458:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_459:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
addr_460:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_461:
    ;; -- cast(ptr) --
addr_462:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_463:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_464:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_465:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_466:
    ;; -- end --
    jmp addr_446
addr_467:
    ;; -- drop --
    pop rax
addr_468:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 24
    ret
addr_469:
    ;; -- func --
    jmp addr_494
addr_470:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_471:
    ;; -- push str --
    mov rax, 8
    push rax
    push str_1
addr_472:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_473:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_474:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_475:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_476:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_477:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_478:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_479:
    ;; -- cast(ptr) --
addr_480:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_481:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_1
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_482:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_483:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_484:
    ;; -- push str --
    mov rax, 23
    push rax
    push str_2
addr_485:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_486:
    ;; -- push str --
    mov rax, 10
    push rax
    push str_3
addr_487:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_488:
    ;; -- push str --
    mov rax, 40
    push rax
    push str_4
addr_489:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_490:
    ;; -- push str --
    mov rax, 37
    push rax
    push str_5
addr_491:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_492:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_312
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_493:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_494:
    ;; -- func --
    jmp addr_604
addr_495:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_496:
    ;; -- push bool 0 --
    mov rax, 0
    push rax
addr_497:
    ;; -- cast(int) --
addr_498:
    ;; -- push mem --
    mov rax, mem
    add rax, 32
    push rax
addr_499:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_500:
    ;; -- push mem --
    mov rax, mem
    add rax, 33
    push rax
addr_501:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_502:
    ;; -- push int 256 --
    mov rax, 256
    push rax
addr_503:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_411
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_504:
    ;; -- if --
addr_505:
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
addr_506:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_507:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_508:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_516
addr_509:
    ;; -- push str --
    mov rax, 32
    push rax
    push str_6
addr_510:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_470
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_511:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_512:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_513:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_514:
    ;; -- drop --
    pop rax
addr_515:
    ;; -- end --
addr_516:
    ;; -- if --
addr_517:
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
addr_518:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_519:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovg rcx, rdx
    push rcx
addr_520:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_596
addr_521:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_522:
    ;; -- while --
addr_523:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_524:
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
addr_525:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_526:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_527:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_528:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_594
addr_529:
    ;; -- if --
addr_530:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_531:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_532:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_533:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_534:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_535:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_536:
    ;; -- cast(ptr) --
addr_537:
    ;; -- push str --
    push str_7
addr_538:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_25
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_539:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_545
addr_540:
    ;; -- push bool 1 --
    mov rax, 1
    push rax
addr_541:
    ;; -- cast(int) --
addr_542:
    ;; -- push mem --
    mov rax, mem
    add rax, 32
    push rax
addr_543:
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
addr_544:
    ;; -- elif --
    jmp addr_583
addr_545:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_546:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_547:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_548:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_549:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_550:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_551:
    ;; -- cast(ptr) --
addr_552:
    ;; -- push str --
    push str_8
addr_553:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_25
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_554:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_584
addr_555:
    ;; -- if --
addr_556:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_557:
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
addr_558:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_559:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_560:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovg rcx, rdx
    push rcx
addr_561:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_569
addr_562:
    ;; -- push str --
    mov rax, 53
    push rax
    push str_9
addr_563:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_470
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_564:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_565:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_566:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_567:
    ;; -- drop --
    pop rax
addr_568:
    ;; -- end --
addr_569:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_570:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_571:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_572:
    ;; -- push int 8 --
    mov rax, 8
    push rax
addr_573:
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
addr_574:
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
    push rax
addr_575:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_576:
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
addr_577:
    ;; -- cast(ptr) --
addr_578:
    ;; -- dup --
    pop rax
    push rax
    push rax
addr_579:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_1
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_580:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_581:
    ;; -- push mem --
    mov rax, mem
    add rax, 33
    push rax
addr_582:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_438
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_583:
    ;; -- else --
    jmp addr_590
addr_584:
    ;; -- push str --
    mov rax, 53
    push rax
    push str_10
addr_585:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_470
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_586:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_587:
    ;; -- push int 60 --
    mov rax, 60
    push rax
addr_588:
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
addr_589:
    ;; -- drop --
    pop rax
addr_590:
    ;; -- end --
addr_591:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_592:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_593:
    ;; -- end --
    jmp addr_522
addr_594:
    ;; -- drop --
    pop rax
addr_595:
    ;; -- end --
addr_596:
    ;; -- push str --
    mov rax, 4
    push rax
    push str_11
addr_597:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_305
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_598:
    ;; -- push int 256 --
    mov rax, 256
    push rax
addr_599:
    ;; -- push mem --
    mov rax, mem
    add rax, 33
    push rax
addr_600:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_305
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_601:
    ;; -- push str --
    mov rax, 5
    push rax
    push str_12
addr_602:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_305
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_603:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
addr_604:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call addr_495
    mov [ret_stack_rsp], rsp
    mov rsp, rax
addr_605:
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
str_9: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20,0x3d,0x3e,0x20,0x50,0x6c,0x65,0x61,0x73,0x65,0x20,0x70,0x72,0x6f,0x76,0x69,0x64,0x65,0x20,0x6f,0x75,0x74,0x70,0x75,0x74,0x20,0x6e,0x61,0x6d,0x65,0x20,0x66,0x6f,0x72,0x20,0x2d,0x6f,0x20,0x6f,0x70,0x74,0x69,0x6f,0x6e,0x73,0xa
str_10: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20,0x3d,0x3e,0x20,0x50,0x6c,0x65,0x61,0x73,0x65,0x20,0x70,0x72,0x6f,0x76,0x69,0x64,0x65,0x20,0x6f,0x75,0x74,0x70,0x75,0x74,0x20,0x6e,0x61,0x6d,0x65,0x20,0x66,0x6f,0x72,0x20,0x2d,0x6f,0x20,0x6f,0x70,0x74,0x69,0x6f,0x6e,0x73,0xa
str_11: db 0x2d,0x2d,0x2d,0xa
str_12: db 0xa,0x2d,0x2d,0x2d,0xa
segment .bss
args_ptr: resq 1
ret_stack_rsp: resq 1
ret_stack: resq 4096
ret_stack_end:
mem: resb 289
