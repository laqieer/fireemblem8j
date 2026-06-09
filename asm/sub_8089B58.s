	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_8089B58, "ax", %progbits
@ sub_8089B58 @ JP 0x08089B58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089B58
	.thumb_func
sub_8089B58:
	push {r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	mov r1, sp
	ldr r0, _08089B98 @ =0x081F54DC
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r5, #0
	str r5, [sp, #0x10]
	add r0, sp, #0x10
	ldr r1, _08089B9C @ =0x02003D2C
	ldr r2, _08089BA0 @ =0x01000140
	bl sub_80D636C
	str r5, [sp, #0x14]
	add r0, sp, #0x14
	ldr r1, _08089BA4 @ =0x0200472C
	ldr r2, _08089BA8 @ =0x01000120
	bl sub_80D636C
	lsls r4, r4, #2
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	bl sub_80D65BC
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089B98: .4byte 0x081F54DC
_08089B9C: .4byte 0x02003D2C
_08089BA0: .4byte 0x01000140
_08089BA4: .4byte 0x0200472C
_08089BA8: .4byte 0x01000120

