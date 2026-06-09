	.syntax unified
	.section .text.PutSpriteListToHiOam, "ax", %progbits
@ PutSpriteListToHiOam @ JP 0x08002134 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutSpriteListToHiOam
	.thumb_func
PutSpriteListToHiOam:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov r8, r1
	mov ip, r2
	ldr r4, [r5]
	cmp r4, #1
	beq _08002186
	ldr r3, _08002190 @ =0x030036E4
	ldr r0, [r3]
	ldr r7, _08002194 @ =0x030031E0
	cmp r0, r7
	bhs _08002186
	adds r6, r3, #0
_08002152:
	movs r0, #6
	ldrsh r1, [r5, r0]
	add r1, r8
	ldr r0, _08002198 @ =0x000001FF
	ands r1, r0
	movs r0, #8
	ldrsh r2, [r5, r0]
	add r2, ip
	movs r0, #0xff
	ands r2, r0
	ldr r3, [r6]
	lsls r1, r1, #0x10
	orrs r4, r1
	orrs r4, r2
	stm r3!, {r4}
	str r3, [r6]
	ldrh r0, [r5, #4]
	strh r0, [r3]
	adds r3, #4
	str r3, [r6]
	adds r5, #0xc
	ldr r4, [r5]
	cmp r4, #1
	beq _08002186
	cmp r3, r7
	blo _08002152
_08002186:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002190: .4byte 0x030036E4
_08002194: .4byte 0x030031E0
_08002198: .4byte 0x000001FF

