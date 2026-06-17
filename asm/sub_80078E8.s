	.syntax unified
	.set sub_800795C, 0x0800795C + 1
	.section .text.sub_80078E8, "ax", %progbits
@ MoveTalkFace @ JP 0x080078E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MoveTalkFace
	.thumb_func
MoveTalkFace:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r7, #0
	ldr r0, _0800793C @ =0x085B90D4
	mov r8, r0
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, #0x18
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _08007912
	movs r7, #1
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_800795C
_08007912:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl sub_800795C
	mov r1, r8
	ldr r0, [r1]
	lsls r2, r5, #2
	adds r0, #0x18
	adds r2, r0, r2
	ldr r3, [r2]
	adds r0, r0, r6
	ldr r1, [r0]
	str r1, [r2]
	str r3, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800793C: .4byte 0x085B90D4

