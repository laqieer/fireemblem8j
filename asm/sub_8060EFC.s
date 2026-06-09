	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8060EFC, "ax", %progbits
@ sub_8060EFC @ JP 0x08060EFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8060EFC
	.thumb_func
sub_8060EFC:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _08060F54 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060F58 @ =0x08600574
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08060F5C @ =0x0869C164
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, _08060F60 @ =0x0869BE8C
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08060F64 @ =0x0869BBC8
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08060F54: .4byte 0x0201774C
_08060F58: .4byte 0x08600574
_08060F5C: .4byte 0x0869C164
_08060F60: .4byte 0x0869BE8C
_08060F64: .4byte 0x0869BBC8

