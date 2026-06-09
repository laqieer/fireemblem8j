	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807083C, "ax", %progbits
@ sub_807083C @ JP 0x0807083C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807083C
	.thumb_func
sub_807083C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r0, _08070870 @ =0x08603A18
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	str r7, [r0, #0x4c]
	mov r1, r8
	str r1, [r0, #0x64]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070870: .4byte 0x08603A18

